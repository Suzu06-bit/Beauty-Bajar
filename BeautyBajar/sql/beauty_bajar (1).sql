

CREATE DATABASE IF NOT EXISTS beauty_bajar
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE beauty_bajar;

--  DROP TABLES (clean slate)
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
SET FOREIGN_KEY_CHECKS = 1;

--  CATEGORIES 
CREATE TABLE categories (
    category_id   INT          AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

INSERT INTO categories (category_name) VALUES
    ('Lipstick'),
    ('Skincare'),
    ('Foundation'),
    ('Eyeshadow'),
    ('Perfume');

--  USERS 
CREATE TABLE users (
    user_id    INT          AUTO_INCREMENT PRIMARY KEY,
    full_name  VARCHAR(100) NOT NULL,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    email      VARCHAR(100) NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    phone      VARCHAR(15)  UNIQUE,
    address    VARCHAR(255),
    role       ENUM('admin','user') DEFAULT 'user'
);

-- password = admin123
INSERT INTO users (full_name, username, email, password, phone, address, role) VALUES
    ('Admin User',
     'admin',
     'admin@beautybajar.com',
     '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
     '9800000000',
     'Kathmandu, Nepal',
     'admin');

-- password = test123  (all 5 users below use the same hash for easy testing)
-- BCrypt hash of 'test123'
INSERT INTO users (full_name, username, email, password, phone, address, role) VALUES
    ('Priya Sharma',
     'priya',
     'priya@gmail.com',
     '$2a$10$eI9gJ7zQwXuP3mLkN5rVOeKsYhD2cFbTvMpA8nWlRj6qIuXoZ4sHa',
     '9801111111',
     'Pokhara, Nepal',
     'user'),

    ('Anita Thapa',
     'anita',
     'anita@gmail.com',
     '$2a$10$eI9gJ7zQwXuP3mLkN5rVOeKsYhD2cFbTvMpA8nWlRj6qIuXoZ4sHa',
     '9802222222',
     'Lalitpur, Nepal',
     'user'),

    ('Sunita Gurung',
     'sunita',
     'sunita@gmail.com',
     '$2a$10$eI9gJ7zQwXuP3mLkN5rVOeKsYhD2cFbTvMpA8nWlRj6qIuXoZ4sHa',
     '9803333333',
     'Chitwan, Nepal',
     'user'),

    ('Kabita Rai',
     'kabita',
     'kabita@yahoo.com',
     '$2a$10$eI9gJ7zQwXuP3mLkN5rVOeKsYhD2cFbTvMpA8nWlRj6qIuXoZ4sHa',
     '9804444444',
     'Biratnagar, Nepal',
     'user'),

    ('Manisha Koirala',
     'manisha',
     'manisha@outlook.com',
     '$2a$10$eI9gJ7zQwXuP3mLkN5rVOeKsYhD2cFbTvMpA8nWlRj6qIuXoZ4sHa',
     '9805555555',
     'Butwal, Nepal',
     'user');

--  PRODUCTS 
CREATE TABLE products (
    product_id  INT            AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(150)   NOT NULL,
    description TEXT,
    price       DECIMAL(10,2)  NOT NULL,
    category_id INT,
    stock       INT            DEFAULT 0,
    image_url   VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE SET NULL
);

-- LIPSTICK (category_id = 1) — 5 products
INSERT INTO products (name, description, price, category_id, stock, image_url) VALUES
    ('MAC Ruby Woo Lipstick',
     'Iconic matte red lipstick. Long-lasting formula with intense colour payoff. A cult classic loved worldwide.',
     1450.00, 1, 50, NULL),

    ('L''Oreal Paris Colour Riche Lipstick',
     'Creamy and moisturising. Rich colour payoff in one stroke. Infused with Argan Oil for soft, hydrated lips.',
     750.00, 1, 70, NULL),

    ('Maybelline New York SuperStay Matte Ink',
     'Up to 16-hour wear matte lipstick. Arrow-tip applicator for precise application. Transfer-proof formula.',
     680.00, 1, 65, NULL),

    ('NYX Soft Matte Lip Cream',
     'Ultra-smooth matte finish lip cream. Lightweight and comfortable for all-day wear. Available in 35 shades.',
     520.00, 1, 80, NULL),

    ('Revlon Super Lustrous Lipstick',
     'Classic cream lipstick with moisturising formula. High-shine finish with Vitamin E and Avocado Oil.',
     450.00, 1, 90, NULL);

-- SKINCARE (category_id = 2) — 5 products
INSERT INTO products (name, description, price, category_id, stock, image_url) VALUES
    ('Garnier Vitamin C Serum',
     'Brightening serum with 30x Vitamin C. Fades dark spots in 3 days. Lightweight and fast-absorbing formula.',
     850.00, 2, 80, NULL),

    ('The Ordinary Hyaluronic Acid 2% + B5',
     'Deep hydration serum. Smooths fine lines and plumps skin. Contains multi-weight Hyaluronic Acid complex.',
     1100.00, 2, 55, NULL),

    ('Neutrogena Hydro Boost Water Gel',
     'Oil-free moisturiser with Hyaluronic Acid. Instantly hydrates and continuously quenches skin. Dermatologist recommended.',
     1350.00, 2, 40, NULL),

    ('Cetaphil Moisturising Lotion',
     'Gentle, non-greasy moisturiser for sensitive skin. Dermatologist-recommended formula for daily use.',
     600.00, 2, 100, NULL),

    ('Pond''s White Beauty Spot-less Fairness Day Cream',
     'Brightening day cream with SPF 15 sun protection. Reduces dark spots and evens skin tone over time.',
     380.00, 2, 120, NULL);

-- FOUNDATION (category_id = 3) — 5 products
INSERT INTO products (name, description, price, category_id, stock, image_url) VALUES
    ('Maybelline Fit Me Foundation',
     'Natural coverage foundation for all skin types. Lightweight formula blends seamlessly. Available in 40 shades.',
     680.00, 3, 60, NULL),

    ('Lakme Absolute Foundation',
     'Full-coverage liquid foundation with SPF 35 sun protection. Long-lasting 16-hour wear formula.',
     520.00, 3, 45, NULL),

    ('L''Oreal Paris True Match Foundation',
     'Micro-refined pigments match your skin''s unique tone and texture perfectly. SPF 17 sun protection included.',
     920.00, 3, 55, NULL),

    ('MAC Studio Fix Fluid Foundation',
     'Full-coverage, long-wearing foundation with matte finish. 24-hour wear formula. Available in 67 shades.',
     2100.00, 3, 30, NULL),

    ('NYX Can''t Stop Won''t Stop Foundation',
     '24-hour full coverage foundation with matte finish. Waterproof and transfer-resistant. Vegan formula.',
     1050.00, 3, 50, NULL);

-- EYESHADOW (category_id = 4) — 5 products
INSERT INTO products (name, description, price, category_id, stock, image_url) VALUES
    ('NYX Ultimate Eyeshadow Palette',
     '16 highly pigmented eyeshadows. Matte and shimmer shades for every look. Smooth blendable formula.',
     1200.00, 4, 40, NULL),

    ('Rimmel London Scandaleyes Palette',
     'Smoky eye palette with 12 versatile shades. Intensely pigmented formula for all-day wear.',
     890.00, 4, 30, NULL),

    ('Maybelline The Nudes Palette',
     '12 nudes eyeshadow palette. Smooth and blendable. Ideal for both everyday and special occasion looks.',
     750.00, 4, 45, NULL),

    ('Urban Decay Naked Basics Palette',
     '6 neutral matte eyeshadows. Ultra-smooth formula with perfect colour accuracy. Travel-friendly size.',
     3200.00, 4, 15, NULL),

    ('L''Oreal Paris Color Riche Eyeshadow',
     'Intensely pigmented single eyeshadow. Long-lasting up to 24 hours. Enriched with Pearl Powder.',
     420.00, 4, 70, NULL);

-- PERFUME (category_id = 5) — 5 products
INSERT INTO products (name, description, price, category_id, stock, image_url) VALUES
    ('Gucci Bloom Eau de Parfum',
     'A rich floral scent with Tuberose, Jasmine and Rangoon Creeper. Feminine and timeless fragrance.',
     8500.00, 5, 10, NULL),

    ('Chanel Chance Eau Tendre',
     'A fresh, transparent, floral fragrance. Top notes of Grapefruit and Quince. Light and feminine.',
     12000.00, 5, 8, NULL),

    ('Victoria''s Secret Bombshell Eau de Parfum',
     'Vibrant and feminine fragrance with Purple Passion Fruit, Shangri-La Peony, and Vanilla Woods.',
     4200.00, 5, 20, NULL),

    ('Davidoff Cool Water Woman',
     'Refreshing aquatic fragrance for women. Notes of Fresh Mint, Lotus and Sandalwood. Everyday wear.',
     3500.00, 5, 25, NULL),

    ('Fogg Scent Xpressio',
     'Long-lasting body spray for women. Floral and fruity blend. No gas formula — more perfume per bottle.',
     580.00, 5, 60, NULL);

--  ORDERS 
CREATE TABLE orders (
    order_id    INT           AUTO_INCREMENT PRIMARY KEY,
    user_id     INT           NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status      ENUM('pending','confirmed','shipped','delivered') DEFAULT 'pending',
    order_date  DATE          NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

-- 5 orders placed by different users
INSERT INTO orders (user_id, total_price, status, order_date) VALUES
    (2, 2300.00, 'delivered', '2025-04-01'),
    (3, 1580.00, 'shipped',   '2025-04-10'),
    (4,  850.00, 'confirmed', '2025-04-18'),
    (5, 3650.00, 'pending',   '2025-04-25'),
    (6, 1200.00, 'delivered', '2025-05-01');

--  ORDER ITEMS 
CREATE TABLE order_items (
    item_id    INT           AUTO_INCREMENT PRIMARY KEY,
    order_id   INT           NOT NULL,
    product_id INT           NOT NULL,
    quantity   INT           NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id)  ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Order 1 (Priya — delivered)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    (1, 1, 1, 1450.00),   -- MAC Ruby Woo
    (1, 4, 1,  850.00);   -- Garnier Vitamin C Serum

-- Order 2 (Anita — shipped)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    (2, 8, 1,  680.00),   -- Maybelline Foundation
    (2, 3, 1,  750.00),   -- L'Oreal Lipstick
    (2, 9, 1,  520.00);   -- Lakme Foundation (adjusted)

-- Order 3 (Sunita — confirmed)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    (3, 5, 1,  850.00);   -- Garnier Vitamin C Serum

-- Order 4 (Kabita — pending)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    (4, 21, 1, 8500.00),  -- Gucci Bloom Perfume
    (4, 16, 1, 1200.00),  -- NYX Eyeshadow Palette
    (4, 10, 1, 1100.00);  -- The Ordinary Hyaluronic Acid

-- Order 5 (Manisha — delivered)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
    (5, 16, 1, 1200.00);  -- NYX Ultimate Eyeshadow Palette

--  VERIFY DATA 
SELECT 'categories' AS tbl, COUNT(*) AS total_rows FROM categories
UNION ALL SELECT 'users',      COUNT(*) FROM users
UNION ALL SELECT 'products',   COUNT(*) FROM products
UNION ALL SELECT 'orders',     COUNT(*) FROM orders
UNION ALL SELECT 'order_items',COUNT(*) FROM order_items;
