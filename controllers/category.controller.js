import { Prisma } from "@prisma/client";

export const createCategory = async (req, res, next) => {
  try {
    const data = req.body;

    const category = await prisma.category.create({ data });
    res.status(200).json({ category });
  } catch (error) {
    if (error instanceof Prisma.PrismaClientKnownRequestError) {
      return next(error);
    }
    return next(error);
  }
};
