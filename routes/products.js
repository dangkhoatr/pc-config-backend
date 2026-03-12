const express = require("express");
const router = express.Router();
const db = require("../db");

// Lấy toàn bộ sản phẩm tham khảo
router.get("/", async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT id, name, slug, image, price, old_price, badge, description, preset_json
      FROM products
      ORDER BY id ASC
    `);

    const result = rows.map((item) => ({
      ...item,
      preset_json:
        typeof item.preset_json === "string"
          ? JSON.parse(item.preset_json)
          : item.preset_json
    }));

    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Lỗi lấy danh sách sản phẩm" });
  }
});

// Lấy chi tiết theo slug
router.get("/:slug", async (req, res) => {
  try {
    const { slug } = req.params;

    const [rows] = await db.query(
      `
      SELECT id, name, slug, image, price, old_price, badge, description, preset_json
      FROM products
      WHERE slug = ?
      LIMIT 1
      `,
      [slug]
    );

    if (rows.length === 0) {
      return res.status(404).json({ message: "Không tìm thấy sản phẩm" });
    }

    const item = rows[0];
    item.preset_json =
      typeof item.preset_json === "string"
        ? JSON.parse(item.preset_json)
        : item.preset_json;

    res.json(item);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Lỗi lấy chi tiết sản phẩm" });
  }
});

module.exports = router;
