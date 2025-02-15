CREATE DATABASE CRM_System;
USE CRM_System;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE SupportTickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Issue VARCHAR(255),
    Status ENUM('Open', 'In Progress', 'Resolved'),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Insert into Customers
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('John Doe', 'john@example.com', '9876543210', 'New York, USA'),
('Alice Smith', 'alice@example.com', '9867543210', 'Los Angeles, USA'),
('Bob Johnson', 'bob@example.com', '9856543210', 'Chicago, USA'),
('Emma Brown', 'emma@example.com', '9846543210', 'Houston, USA'),
('Michael Lee', 'michael@example.com', '9836543210', 'San Diego, USA'),
('Sophia Wilson', 'sophia@example.com', '9826543210', 'San Francisco, USA'),
('David Miller', 'david@example.com', '9816543210', 'Dallas, USA'),
('Olivia Davis', 'olivia@example.com', '9806543210', 'Austin, USA'),
('James Anderson', 'james@example.com', '9796543210', 'Boston, USA'),
('Lucas Martinez', 'lucas@example.com', '9786543210', 'Seattle, USA'),
('Mia Robinson', 'mia@example.com', '9776543210', 'Denver, USA'),
('Ethan Clark', 'ethan@example.com', '9766543210', 'Miami, USA'),
('Liam Thomas', 'liam@example.com', '9756543210', 'Las Vegas, USA'),
('Charlotte Harris', 'charlotte@example.com', '9746543210', 'Philadelphia, USA'),
('Amelia White', 'amelia@example.com', '9736543210', 'Phoenix, USA'),
('Mason Hall', 'mason@example.com', '9726543210', 'Atlanta, USA'),
('Harper Young', 'harper@example.com', '9716543210', 'San Antonio, USA'),
('Benjamin King', 'benjamin@example.com', '9706543210', 'San Jose, USA'),
('Ava Scott', 'ava@example.com', '9696543210', 'Indianapolis, USA'),
('William Green', 'william@example.com', '9686543210', 'Nashville, USA');

-- Insert into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-01-10', 500.00), (2, '2024-01-12', 150.00), (3, '2024-01-15', 700.50),
(4, '2024-02-01', 320.75), (5, '2024-02-03', 600.00), (6, '2024-02-05', 450.20),
(7, '2024-02-08', 220.30), (8, '2024-02-10', 330.00), (9, '2024-02-12', 590.80),
(10, '2024-02-15', 740.10), (11, '2024-02-18', 820.00), (12, '2024-02-20', 250.75),
(13, '2024-02-22', 530.40), (14, '2024-02-25', 670.90), (15, '2024-02-28', 410.25),
(16, '2024-03-01', 200.60), (17, '2024-03-03', 310.15), (18, '2024-03-05', 780.90),
(19, '2024-03-08', 620.50), (20, '2024-03-10', 890.80);

-- Insert into SupportTickets
INSERT INTO SupportTickets (CustomerID, Issue, Status) VALUES
(1, 'Login issue', 'Open'), (2, 'Payment failure', 'Resolved'), (3, 'Product not received', 'In Progress'),
(4, 'Account hacked', 'Open'), (5, 'Wrong order delivered', 'Resolved'), (6, 'Technical glitch in app', 'Open'),
(7, 'Refund request', 'In Progress'), (8, 'Subscription issue', 'Resolved'), (9, 'Billing error', 'Open'),
(10, 'Delayed delivery', 'Resolved'), (11, 'Shipping issue', 'Open'), (12, 'Order cancellation', 'Resolved'),
(13, 'Quality complaint', 'In Progress'), (14, 'Coupon code issue', 'Open'), (15, 'App crash', 'Resolved'),
(16, 'Account access problem', 'Open'), (17, 'Delayed refund', 'Resolved'), (18, 'Item missing', 'In Progress'),
(19, 'Feedback submission issue', 'Open'), (20, 'Security concern', 'Resolved');

-- Retrieve all customers
SELECT * FROM Customers;

-- Get all orders with customer details
SELECT Orders.OrderID, Customers.Name, Orders.TotalAmount 
FROM Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Get open support tickets
SELECT * FROM SupportTickets WHERE Status = 'Open';

-- Get orders above $500
SELECT * FROM Orders WHERE TotalAmount > 500;

-- Customers whose name starts with 'A'
SELECT * FROM Customers WHERE Name LIKE 'A%';

-- Total customers count
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- Total revenue
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

-- Average order amount
SELECT AVG(TotalAmount) AS AvgOrderValue FROM Orders;

-- Sort orders by TotalAmount in descending order
SELECT * FROM Orders ORDER BY TotalAmount DESC;

-- Sort customers alphabetically

-- Find emails ending in 'example.com'
SELECT * FROM Customers WHERE Email LIKE '%@example.com';

-- Find issues containing 'payment'
SELECT * FROM SupportTickets WHERE Issue LIKE '%payment%';

-- Get resolved and in-progress tickets

-- INNER JOIN: Customers with orders
SELECT Customers.Name, Orders.OrderID, Orders.TotalAmount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN: All customers with or without orders
SELECT Customers.Name, Orders.OrderID, Orders.TotalAmount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN: All orders with customer details (if available)
SELECT Customers.Name, Orders.OrderID, Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;






