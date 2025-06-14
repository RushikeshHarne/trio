CREATE DATABASE IF NOT EXISTS inventory_db;
USE inventory_db;

CREATE TABLE IF NOT EXISTS sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,
    customer VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO sales (product, quantity, sale_date, customer, amount) VALUES
('Laptop', 5, '2023-01-15', 'Tech Solutions Inc', 5000.00),
('Monitor', 8, '2023-01-16', 'Digital World', 2400.00),
('Keyboard', 15, '2023-01-17', 'Office Plus', 750.00),
('Mouse', 25, '2023-01-18', 'Tech Retail', 625.00),
('Printer', 3, '2023-01-19', 'Print Masters', 900.00),
('Tablet', 12, '2023-01-20', 'Mobile Devices', 3600.00),
('Headphones', 20, '2023-01-21', 'Audio Experts', 1000.00),
('Router', 6, '2023-01-22', 'Network Pros', 1200.00),
('SSD', 10, '2023-01-23', 'Storage Solutions', 1500.00),
('Webcam', 7, '2023-01-24', 'Video Tech', 700.00);
                                           
