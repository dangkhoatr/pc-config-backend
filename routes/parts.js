const express = require("express");
const router = express.Router();
const db = require("../db");

// Lấy toàn bộ category
router.get("/categories", async (req, res) => {
  try {
    const [rows] = await db.query(
      "SELECT id, `key`, label FROM part_categories ORDER BY id ASC"
    );
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Lỗi lấy danh mục linh kiện" });
  }
});

// Lấy toàn bộ item, group theo key giống DATA hiện tại của bạn
router.get("/items", async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT pc.\`key\`, pc.label, pi.id, pi.name, pi.price
      FROM part_items pi
      JOIN part_categories pc ON pi.category_id = pc.id
      ORDER BY pc.id ASC, pi.id ASC
    `);

    const grouped = {};
    rows.forEach((row) => {
      if (!grouped[row.key]) grouped[row.key] = [];
      grouped[row.key].push({
        id: row.id,
        name: row.name,
        price: row.price
      });
    });

    res.json(grouped);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Lỗi lấy danh sách linh kiện" });
  }
});

// Lấy item theo key
router.get("/items/:key", async (req, res) => {
  try {
    const { key } = req.params;

    const [rows] = await db.query(
      `
      SELECT pi.id, pi.name, pi.price
      FROM part_items pi
      JOIN part_categories pc ON pi.category_id = pc.id
      WHERE pc.\`key\` = ?
      ORDER BY pi.id ASC
      `,
      [key]
    );

    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Lỗi lấy linh kiện theo loại" });
  }
});

module.exports = router;
