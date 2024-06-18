import { Request, Response } from 'express';
import { Repository } from 'typeorm';
import bcrypt from 'bcrypt';
import postmark from 'postmark';
import { User } from '../../db/entity/User';
import { Company } from '../../db/entity/Company';
import { validateAndFetchEntitySafe } from '../../utils/controllerHelpers';

const saltRounds = 12;

export default class UserController {
  public userRepository: Repository<User>;
  public companyRepository: Repository<Company>;

  constructor(
    userRepository: Repository<User>,
    companyRepository: Repository<Company>,
  ) {
    this.userRepository = userRepository;
    this.companyRepository = companyRepository;
  }

  // Get all the users of a company
  async getUsers(req: Request, res: Response) {
    const company = (await validateAndFetchEntitySafe(
      parseInt(req.params.companyId ?? ''),
      this.companyRepository,
      'Company',
      res,
    )) as Company;
    if (!company) return;

    // Make a deep copy of the users
    const users = structuredClone(company.users);

    // Don't return the hashed password or salt
    users.forEach((user) => {
      user.password = '';
      user.salt = '';
    });

    res.status(200).json(users);
  }

  async getUser(req: Request, res: Response) {
    const user = (await validateAndFetchEntitySafe(
      parseInt(req.params.userId ?? ''),
      this.userRepository,
      'User',
      res,
    )) as User;
    if (!user) return;

    // Don't return the hashed password or salt
    user.password = '';
    user.salt = '';

    res.status(200).json(user);
  }

  async createUser(req: Request, res: Response) {
    const {
      companyId,
      role,
      username,
      plaintextPassword,
      email,
      firstname,
      surname,
    } = req.body;

    if (!companyId || !role || !username || !plaintextPassword || !email) {
      res.status(400).json({
        message:
          'companyId, role, username, password, email, and name are required',
      });
      return;
    }

    const company = (await validateAndFetchEntitySafe(
      parseInt(companyId),
      this.companyRepository,
      'Company',
      res,
    )) as Company;
    if (!company) return;

    // Hash the password
    const salt = await bcrypt.genSalt(saltRounds);
    const hashedPassword = await bcrypt.hash(plaintextPassword, salt);

    // Create the user
    const user = new User();
    user.company = company;
    user.role = role;
    user.email = email;
    user.username = username;
    user.firstname = firstname;
    user.surname = surname;
    user.salt = salt;
    user.password = hashedPassword;
    user.createdAt = new Date();
    user.updatedAt = user.createdAt;

    await this.userRepository.save(user);

    // Don't return the hashed password or salt
    user.password = '';
    user.salt = '';

    res.status(201).json(user);
  }

  // Update a user, we can update the role, username, password, or email.
  // Updating the password requires the old password to be provided.
  async updateUser(req: Request, res: Response) {
    const {
      companyId,
      role,
      username,
      newPlaintextPassword,
      email,
      firstname,
      surname,
    } = req.body;

    if (
      role &&
      !username &&
      !newPlaintextPassword &&
      !email &&
      !firstname &&
      !surname
    ) {
      res.status(400).json({
        message: 'At least one field is required to update a user',
      });
      return;
    }

    if (companyId) {
      res.status(400).json({
        message:
          'Company ID cannot be changed. Please delete the user and create a new one.',
      });
    }

    const user = (await validateAndFetchEntitySafe(
      parseInt(req.params.userId ?? ''),
      this.userRepository,
      'User',
      res,
    )) as User;
    if (!user) return;

    // Update the password, if provided and verify the old password
    if (newPlaintextPassword) {
      const oldPlainTextPassword = req.body.oldPlaintextPassword || '';

      if (!oldPlainTextPassword) {
        res.status(400).json({
          message: 'Old password is required to update the password',
        });
        return;
      }

      const hashedPassword = await bcrypt.hash(oldPlainTextPassword, user.salt);

      if (!bcrypt.compareSync(oldPlainTextPassword, hashedPassword)) {
        res.status(401).json({
          message: 'Old password is incorrect',
        });
        return;
      }

      const salt = await bcrypt.genSalt(saltRounds);
      user.salt = salt;
      user.password = await bcrypt.hash(newPlaintextPassword, salt);
    }

    user.role = role || user.role;
    user.email = email || user.email;
    user.username = username || user.username;
    user.firstname = firstname || user.firstname;
    user.surname = surname || user.surname;
    user.updatedAt = new Date();

    await this.userRepository.save(user);

    res.status(200).json(user);
  }

  async deleteUser(req: Request, res: Response) {
    const user = (await validateAndFetchEntitySafe(
      parseInt(req.params.userId ?? ''),
      this.userRepository,
      'User',
      res,
    )) as User;
    if (!user) return;

    await this.userRepository.remove(user);

    res.status(204).send();
  }

  async resetPassword(req: Request, res: Response) {
    const user = (await validateAndFetchEntitySafe(
      parseInt(req.params.userId ?? ''),
      this.userRepository,
      'User',
      res,
    )) as User;
    if (!user) return;

    // Generate a random password
    const newPassword = (await bcrypt.genSalt(saltRounds)).substring(-8);
    // Generate a new salt
    const newSalt = await bcrypt.genSalt(saltRounds);

    // Update the user
    user.password = await bcrypt.hash(newPassword, user.salt);
    user.salt = newSalt;
    user.updatedAt = new Date();

    await this.userRepository.save(user);

    // Send the new password to the user
    let emailClient = new postmark.ServerClient(
      process.env.POSTMARK_API_KEY || '',
    );

    await emailClient.sendEmail({
      From: process.env.FROM_EMAIL || '',
      To: user.email,
      Subject: 'Password Reset',
      TextBody: `Your new temporary password is: ${newPassword}\nPlease log in and change your password.`,
    });

    res.status(200).json({
      message: 'Password reset',
    });
  }
}
