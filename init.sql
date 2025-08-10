-- Create Inventory Table
CREATE TABLE inventory (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(50),
    stock_quantity INT,
    purchase_price DECIMAL(10,2)
);

-- Create Purchases Table
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    item_id INT,
    purchase_date DATE,
    quantity_purchased INT,
    total_cost DECIMAL(10,2),
    unit_cost DECIMAL(10,2),
    FOREIGN KEY (item_id) REFERENCES inventory(item_id)
);

-- Create Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    item_id INT,
    sale_date DATE,
    quantity_sold INT,
    sale_price DECIMAL(10,2),
    FOREIGN KEY (item_id) REFERENCES inventory(item_id)
);

-- Insert Data into inventory
INSERT INTO inventory VALUES
(1, 'Tyre', 100, 1500.00),
(2, 'Engine Oil', 200, 500.00),
(3, 'Battery', 75, 2500.00),
(4, 'Brake Pads', 60, 800.00);

-- Insert Data into purchases
INSERT INTO purchases VALUES
(1, 1, '2025-06-10', 100, 150000.00, 1500.00),
(2, 2, '2025-06-11', 200, 100000.00, 500.00),
(3, 3, '2025-06-12', 75, 187500.00, 2500.00),
(4, 4, '2025-06-13', 60, 48000.00, 800.00);

-- Insert Data into sales
INSERT INTO sales VALUES
(1, 1, '2025-07-15', 10, 20000.00),
(2, 2, '2025-07-16', 30, 15000.00),
(3, 3, '2025-07-16', 5, 12500.00),
(4, 4, '2025-07-17', 10, 8000.00);
