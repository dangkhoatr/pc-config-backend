const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

// Serve static files
app.use("/products", express.static(path.join(__dirname, "products")));
app.use("/image", express.static(path.join(__dirname, "image")));

// Trang chính
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "A.html"));
});

// Trang view (GIỮ NGUYÊN)
app.get("/view", (req, res) => {
  res.sendFile(path.join(__dirname, "view.html"));
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
