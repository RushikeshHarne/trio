CREATE TABLE IF NOT EXISTS purchases (
    id SERIAL PRIMARY KEY,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    purchase_date DATE NOT NULL,
    supplier VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO purchases (product, quantity, purchase_date, supplier, unit_price) VALUES
('Laptop', 50, '2023-01-10', 'Tech Wholesale', 800.00),
('Monitor', 30, '2023-01-11', 'Display World', 200.00),
('Keyboard', 100, '2023-01-12', 'Input Devices', 25.00),
('Mouse', 200, '2023-01-13', 'Pointer Co', 12.50),
('Printer', 20, '2023-01-14', 'Print Systems', 300.00),
('Tablet', 40, '2023-01-15', 'Mobile Gear', 350.00),
('Headphones', 80, '2023-01-16', 'Sound Suppliers', 40.00),
('Router', 15, '2023-01-17', 'Network Gear', 150.00),
('SSD', 60, '2023-01-18', 'Storage Pros', 120.00),
('Webcam', 50, '2023-01-19', 'Imaging Tech', 60.00);
