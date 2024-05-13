import "dotenv/config";
import express from "express";
import categoryRoute from "./routes/category.route.js";

const app = express();
const PORT = process.env.PORT;

app.use("/category", categoryRoute);

app.get("/test", (req, res) => {
  res.status(200).json({
    success: "done",
    message: "API is working",
  });
});

app.all("*", (req, res, next) => {
  const error = new Error(`Route ${req.originalUrl} not found`);
  error.status = 404;
  next(error);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
