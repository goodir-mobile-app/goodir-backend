import { PrismaClient } from "@prisma/client";

// Instantiate Prisma Client
const prisma = new PrismaClient();

export const createCategory = async (req, res, next) => {
  try {
    const data = req.body;

    const category = await prisma.category.create({ data });
    res.status(200).json({ category });
  } catch (error) {
    return next(error);
  }
};
