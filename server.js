const express = require("express");
const cors = require("cors");
const path = require("path");

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Cho phép truy cập file tĩnh (A.html, view.html)
app.use(express.static(__dirname));

// Trang mặc định
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "A.html"));
});

// Trang xem cấu hình chia sẻ
app.get("/view", (req, res) => {
  res.sendFile(path.join(__dirname, "view.html"));
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
const express = require("express");
const path = require("path");
const app = express();

/* Serve static files */
app.use(express.static(path.join(__dirname, "public")));

app.listen(3000, () => {
  console.log("Server running http://localhost:3000");
});
