CREATE DATABASE IF NOT EXISTS eiu_computer;
USE eiu_computer;

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS part_items;
DROP TABLE IF EXISTS part_categories;

CREATE TABLE part_categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  `key` VARCHAR(50) NOT NULL UNIQUE,
  label VARCHAR(100) NOT NULL
);

CREATE TABLE part_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  price INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES part_categories(id) ON DELETE CASCADE
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL UNIQUE,
  image VARCHAR(255),
  price INT NOT NULL,
  old_price INT DEFAULT NULL,
  badge VARCHAR(20),
  description TEXT,
  preset_json JSON
);

INSERT INTO part_categories (`key`, label) VALUES
('cpu', 'Bộ vi xử lý'),
('main', 'Bo mạch chủ'),
('ram', 'RAM'),
('ssd', 'SSD'),
('hdd', 'HDD'),
('vga', 'VGA'),
('psu', 'Nguồn'),
('case', 'Vỏ case'),
('monitor', 'Màn hình'),
('keyboard', 'Bàn phím'),
('mouse', 'Chuột'),
('headset', 'Tai nghe'),
('fan', 'Fan case'),
('aircool', 'Tản nhiệt khí'),
('aio', 'Tản nhiệt nước AIO'),
('custom', 'Tản nhiệt nước Custom'),
('windows', 'Windows bản quyền');

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Intel Core i5-12400F', 3500000 FROM part_categories WHERE `key`='cpu';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'AMD Ryzen 5 5600X', 3900000 FROM part_categories WHERE `key`='cpu';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'B660M', 2200000 FROM part_categories WHERE `key`='main';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'B760M', 2900000 FROM part_categories WHERE `key`='main';

INSERT INTO part_items (category_id, name, price)
SELECT id, '16GB DDR4', 1200000 FROM part_categories WHERE `key`='ram';
INSERT INTO part_items (category_id, name, price)
SELECT id, '32GB DDR4', 2200000 FROM part_categories WHERE `key`='ram';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'SSD 512GB', 1300000 FROM part_categories WHERE `key`='ssd';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'SSD 1TB', 2300000 FROM part_categories WHERE `key`='ssd';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'HDD 1TB', 900000 FROM part_categories WHERE `key`='hdd';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'HDD 2TB', 1500000 FROM part_categories WHERE `key`='hdd';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'RTX 3060', 7500000 FROM part_categories WHERE `key`='vga';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'RTX 4060', 9500000 FROM part_categories WHERE `key`='vga';

INSERT INTO part_items (category_id, name, price)
SELECT id, '650W Bronze', 1200000 FROM part_categories WHERE `key`='psu';
INSERT INTO part_items (category_id, name, price)
SELECT id, '750W Gold', 1800000 FROM part_categories WHERE `key`='psu';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Case Mid Tower', 1000000 FROM part_categories WHERE `key`='case';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'Case Full Tower', 1800000 FROM part_categories WHERE `key`='case';

INSERT INTO part_items (category_id, name, price)
SELECT id, '24 inch FHD', 3000000 FROM part_categories WHERE `key`='monitor';
INSERT INTO part_items (category_id, name, price)
SELECT id, '27 inch QHD', 5200000 FROM part_categories WHERE `key`='monitor';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Phím cơ', 600000 FROM part_categories WHERE `key`='keyboard';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'Phím văn phòng', 300000 FROM part_categories WHERE `key`='keyboard';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Chuột gaming', 400000 FROM part_categories WHERE `key`='mouse';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'Chuột văn phòng', 200000 FROM part_categories WHERE `key`='mouse';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Tai nghe gaming', 800000 FROM part_categories WHERE `key`='headset';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'Tai nghe thường', 400000 FROM part_categories WHERE `key`='headset';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Fan RGB', 300000 FROM part_categories WHERE `key`='fan';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'Fan thường', 150000 FROM part_categories WHERE `key`='fan';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Tản khí Cooler Master', 700000 FROM part_categories WHERE `key`='aircool';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'Tản khí Noctua', 1500000 FROM part_categories WHERE `key`='aircool';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'AIO 240mm', 2500000 FROM part_categories WHERE `key`='aio';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'AIO 360mm', 4200000 FROM part_categories WHERE `key`='aio';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Custom cơ bản', 5000000 FROM part_categories WHERE `key`='custom';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'Custom cao cấp', 9000000 FROM part_categories WHERE `key`='custom';

INSERT INTO part_items (category_id, name, price)
SELECT id, 'Windows 11 Home', 1200000 FROM part_categories WHERE `key`='windows';
INSERT INTO part_items (category_id, name, price)
SELECT id, 'Windows 11 Pro', 2500000 FROM part_categories WHERE `key`='windows';

INSERT INTO products (name, slug, image, price, old_price, badge, description, preset_json) VALUES
(
  'Mainboard Asus ROG STRIX B550-F GAMING',
  'mainboard-asus-rog-strix-b550-f-gaming',
  'image/pc.jpg',
  4999000,
  5290000,
  '-6%',
  'Mainboard Asus ROG STRIX B550-F GAMING',
  JSON_OBJECT(
    'main', JSON_OBJECT('name', 'Asus ROG STRIX B550-F GAMING', 'price', 4999000)
  )
),
(
  'Vỏ case Inwin 925 Black - Full Tower',
  'vo-case-inwin-925-black-full-tower',
  'image/pc.jpg',
  10990000,
  11990000,
  '-9%',
  'Vỏ case Inwin 925 Black - Full Tower',
  JSON_OBJECT(
    'case', JSON_OBJECT('name', 'Inwin 925 Black Full Tower', 'price', 10990000)
  )
),
(
  'Mainboard Asus PRIME B550M-K',
  'mainboard-asus-prime-b550m-k',
  'image/pc.jpg',
  1999000,
  2599000,
  '-24%',
  'Mainboard Asus PRIME B550M-K',
  JSON_OBJECT(
    'main', JSON_OBJECT('name', 'Asus PRIME B550M-K', 'price', 1999000)
  )
),
(
  'Bộ cấu hình Gaming phổ thông',
  'bo-cau-hinh-gaming-pho-thong',
  'image/pc.jpg',
  15990000,
  20990000,
  '-24%',
  'Bộ cấu hình Gaming phổ thông',
  JSON_OBJECT(
    'cpu', JSON_OBJECT('name', 'Ryzen 5 5600X', 'price', 3900000),
    'ram', JSON_OBJECT('name', '16GB DDR4', 'price', 1200000),
    'vga', JSON_OBJECT('name', 'RTX 3060', 'price', 7500000)
  )
);
