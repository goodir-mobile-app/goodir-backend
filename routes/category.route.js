import express from "express";
import { createCategory } from "../controllers/category.controller.js";

const categoryRoute = express.Router();

categoryRoute.post("/create-category", createCategory);

export default categoryRoute;
