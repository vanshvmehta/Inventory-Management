import { Request } from 'express';

const DEFAULT_PAGE = 1;
const DEFAULT_ITEMS_PER_PAGE = 10;

export const getPagination = (req: Request, totalItems: number = 0) => {
  const page = parseInt(req.query.page as string) || DEFAULT_PAGE;
  const itemsPerPage =
    parseInt(req.query.itemsPerPage as string) || DEFAULT_ITEMS_PER_PAGE;
  const totalPages = Math.ceil(totalItems / itemsPerPage);

  return {
    page,
    itemsPerPage,
    totalPages,
    totalItems,
  };
};
