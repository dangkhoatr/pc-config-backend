const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

/* ================= STATIC FILES ================= */
// Ảnh
app.use("/image", express.static(path.join(__dirname, "image")));

// Trang sản phẩm (HTML tĩnh)
app.use("/product", express.static(path.join(__dirname, "product")));

/* ================= ROUTES ================= */

// Trang build cấu hình (A.html)
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "A.html"));
});

// Trang view cấu hình (KHÔNG BỊ MẤT)
app.get("/view", (req, res) => {
  res.sendFile(path.join(__dirname, "view.html"));
});

/* ================= START SERVER ================= */
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
