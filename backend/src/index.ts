import express, { Request, Response } from "express";
import dotenv from "dotenv";
dotenv.config();
import mongoose from "mongoose";
import cors from "cors";
const app = express();
app.use(express.json());
app.use(cors());
const dbConnect = async () => {
  const conStr = `mongodb://${process.env.DATABASE_USERNAME}:${process.env.DATABASE_PASSWORD}@database:27017/`;
  try {
    await mongoose.connect(conStr);
    console.log("database connected successfully");
  } catch (e) {
    console.log("database connection error:", e);
    console.log("exiting...");
    process.exit(1);
  }
};
app.get("/healthCheck", (req: Request, res: Response) => {
  res.status(200).json({ status: "ok" });
});

const port = 8080;
app.listen(port, "0.0.0.0", async () => {
  await dbConnect();

  console.log("listening at port:", port);
});
