### Getting Started

#### Windows

**For windows, follow steps here: https://nodejs.org/en/download/package-manager**

#### MacOS

##### 1. Install Node & nvm

```
# navigate to server directory
cd server

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download and install Node.js
nvm install 20

# verifies the right Node.js version is in the environment
node -v # should print `v20.14.0`

# verifies the right NPM version is in the environment
npm -v # should print `10.7.0`
```

##### 2. Install dependencies

```
npm i
```

##### 3. Run development environment locally

```
npm start
```

---

## Database

#### DB Creds

Host: `aws-0-ca-central-1.pooler.supabase.com`

DB Name: `postgres`

Port: `5432`

User: `postgres.tyeloctuvwmumvylllxd`

Password: `JZufSR5SrjQ5zvkm`

#### URIs

For your convenience

##### Postgres

```
postgres://postgres.tyeloctuvwmumvylllxd:JZufSR5SrjQ5zvkm@aws-0-ca-central-1.pooler.supabase.com:5432/postgres
```

##### JDBC

```
jdbc:postgresql://aws-0-ca-central-1.pooler.supabase.com:5432/postgres?user=postgres.tyeloctuvwmumvylllxd&password=JZufSR5SrjQ5zvkm
```
