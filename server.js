const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

const PORT = 3000;

// Database tạm (RAM)
const sharedBuilds = {};

// API: tạo link chia sẻ
app.post("/api/share", (req, res) => {
  const id = Date.now().toString(36);
  sharedBuilds[id] = req.body;
  res.json({ id });
});

// API: lấy cấu hình theo id
app.get("/api/build/:id", (req, res) => {
  const build = sharedBuilds[req.params.id];
  if (!build) {
    return res.status(404).json({ message: "Không tìm thấy cấu hình" });
  }
  res.json(build);
});

app.listen(PORT, () => {
  console.log(`Backend chạy tại http://localhost:${PORT}`);
});
