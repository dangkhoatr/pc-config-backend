const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

// Public static folders
app.use(express.static(path.join(__dirname)));
app.use("/product", express.static(path.join(__dirname, "product")));
app.use("/image", express.static(path.join(__dirname, "image")));

// Trang chính
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "A.html"));
});

// Trang view chia sẻ
app.get("/view", (req, res) => {
  res.sendFile(path.join(__dirname, "view.html"));
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
