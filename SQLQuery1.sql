CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  Address VARCHAR(255),
  Email VARCHAR(255) UNIQUE,
  Password VARCHAR(255),
  birth_date DATE
);


CREATE TABLE PhoneNumbers (
  PhoneNumberID INT PRIMARY KEY,
  CustomerID INT,
  Phone VARCHAR(15),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Product (
  ProductID INT PRIMARY KEY,
  Name VARCHAR(255),
  Category VARCHAR(255),
  Price DECIMAL(10, 2),
  Description VARCHAR(255),
  State BOOL
);


CREATE TABLE Orderr (
  OrderID INT PRIMARY KEY,
  OrderDate DATE,
  CustomerID INT,
  Total_amount DECIMAL,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Cart (
  CartID INT PRIMARY KEY,
  CustomerID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE OrderItem (
  OrderID INT,
  ProductID INT,
  CartID INT,
  Quantity INT,
  PRIMARY KEY (OrderID, ProductID, CartID),
  FOREIGN KEY (OrderID) REFERENCES Orderr(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
  FOREIGN KEY (CartID) REFERENCES Cart(CartID)
);

CREATE TABLE Feedback (
  FeedbackID INT PRIMARY KEY,
  Comment TEXT,
  CustomerID INT,
  ProductID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Customer (CustomerID, first_name, last_name, Address, Email, Password, birth_date) VALUES
(1, 'Ahmed', 'Fouad', '123 Cairo St', 'ahmed.fouad@gmail.com', 'pass123', '1980-01-01'),
(2, 'Sara', 'Mahmoud', '456 Alexandria Ave', 'sara.mahmoud@gmail.com', 'pass456', '1990-02-02'),
(3, 'Mohamed', 'Hassan', '789 Giza Rd', 'mohamed.hassan@gmail.com', 'pass789', '1985-03-03'),
(4, 'Amira', 'Sayed', '101 Luxor Way', 'amira.sayed@gmail.com', 'pass101', '1992-04-04'),
(5, 'Tarek', 'Ali', '202 Aswan Blvd', 'tarek.ali@gmail.com', 'pass202', '1978-05-05'),
(6, 'Hala', 'Youssef', '303 Mansoura Ln', 'hala.youssef@gmail.com', 'pass303', '1982-06-06'),
(7, 'Yasser', 'Ibrahim', '404 Hurghada Path', 'yasser.ibrahim@gmail.com', 'pass404', '1991-07-07'),
(8, 'Laila', 'Adel', '505 Siwa Oasis', 'laila.adel@gmail.com', 'pass505', '1984-08-08'),
(9, 'Khaled', 'Nour', '606 Sharm El-Sheikh St', 'khaled.nour@gmail.com', 'pass606', '1975-09-09'),
(10, 'Nadia', 'Samir', '707 Alexandria Rd', 'nadia.samir@gmail.com', 'pass707', '1987-10-10');


INSERT INTO PhoneNumbers (PhoneNumberID, CustomerID, Phone) VALUES
(1, 1, '01234567891'),
(2, 2, '01234567892'),
(3, 3, '01234567893'),
(4, 4, '01234567894'),
(5, 5, '01234567895'),
(6, 6, '01234567896'),
(7, 7, '01234567897'),
(8, 8, '01234567898'),
(9, 9, '01234567899'),
(10, 10, '01234567900');

    

INSERT INTO Product (ProductID, Name, Category, Price, Description, State)
VALUES
(1, 'Stainless Steel Cookware Set', 'Cookware', 3000.00, '10-piece stainless steel cookware set', TRUE),
(2, 'Ceramic Dinner Set', 'Houseware', 1500.00, '16-piece ceramic dinner set', TRUE),
(3, 'Non-Stick Frying Pan', 'Cookware', 500.00, 'Non-stick 12 inch frying pan', TRUE),
(4, 'Electric Kettle', 'Houseware', 250.00, '1.5L stainless steel electric kettle', TRUE),
(5, 'Glass Bakeware Set', 'Cookware', 800.00, '5-piece glass bakeware', TRUE),
(6, 'Ultra-Thin Laptop', 'Laptops', 12000.00, 'Ultra-thin, lightweight 13-inch laptop', TRUE),
(7, 'Gaming Laptop', 'Laptops', 15000.00, 'High-performance gaming laptop with advanced graphics', TRUE),
(8, '2-in-1 Convertible Laptop', 'Laptops', 8000.00, 'Convertible 2-in-1 laptop with touch screen', TRUE),
(9, 'Cordless Blender', 'Houseware', 600.00, 'Cordless, rechargeable hand blender', TRUE),
(10, 'Cast Iron Skillet', 'Cookware', 400.00, '10-inch pre-seasoned cast iron skillet', TRUE);


INSERT INTO Orderr (OrderID, OrderDate, CustomerID, Total_amount)
VALUES
(1, '2023-01-15', 1, 500.00),
(2, '2023-02-20', 2, 450.00),
(3, '2023-03-05', 3, 300.00),
(4, '2023-04-10', 4, 750.00),
(5, '2023-05-15', 5, 600.00),
(6, '2023-06-01', 6, 500.00),
(7, '2023-07-07', 7, 350.00),
(8, '2023-08-14', 8, 900.00),
(9, '2023-09-20', 9, 250.00),
(10, '2023-10-25', 10, 650.00);

INSERT INTO Cart (CartID, CustomerID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


INSERT INTO OrderItem (OrderID, ProductID, CartID, Quantity)
VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 5, 2),
(6, 6, 6, 2),
(7, 7, 7, 1),
(8, 8, 8, 3),
(9, 9, 9, 1),
(10, 10, 10, 2);


INSERT INTO Feedback (FeedbackID, Comment, CustomerID, ProductID)
VALUES
(11, 'Very durable and stylish!', 1, 1), -- Feedback for houseware
(12, 'Excellent quality, easy to clean.', 2, 2), -- Feedback for cookware
(13, 'Superb performance and sleek design.', 3, 3), -- Feedback for a laptop
(14, 'Makes my kitchen look great!', 4, 4), -- More feedback for houseware
(15, 'Heats evenly, perfect for my recipes.', 5, 5), -- More feedback for cookware
(16, 'Fast, reliable, and worth the price.', 6, 6), -- More feedback for a laptop
(17, 'Elegant and functional - a great buy.', 7, 7), -- And more feedback for houseware
(18, 'Cookware set is a must-have for any chef.', 8, 8), -- And more feedback for cookware
(19, 'Handles all my computing needs effortlessly.', 9, 9), -- And more feedback for a laptop
(20, 'Aesthetic and practical for daily use.', 10, 10); -- Final feedback for houseware
    
    
/* Retrieve all customers and their orders */
SELECT CONCAT(Customer.first_name, ' ', Customer.last_name) AS Name, Orderr.OrderID, Orderr.OrderDate, Orderr.Total_amount
FROM Customer
INNER JOIN Orderr ON Customer.CustomerID = Orderr.CustomerID;

/* Find the total amount spent by each customer */
SELECT CONCAT(Customer.first_name, ' ', Customer.last_name) AS Name, SUM(Orderr.Total_amount) AS TotalSpent
FROM Customer
LEFT JOIN Orderr ON Customer.CustomerID = Orderr.CustomerID
GROUP BY Customer.CustomerID, Customer.first_name, Customer.last_name;

/* List all products in a specific category */
SELECT Product.Name, Product.Category, Product.Price
FROM Product
WHERE Product.Category = 'YourCategory';

/* Retrieve the most recent order for each customer */
SELECT CONCAT(Customer.first_name, ' ', Customer.last_name) AS Name, MAX(Orderr.OrderDate) AS LatestOrderDate
FROM Customer
LEFT JOIN Orderr ON Customer.CustomerID = Orderr.CustomerID
GROUP BY Customer.CustomerID, Customer.first_name, Customer.last_name;

/* Count the number of products in each cart */
SELECT Cart.CartID, COUNT(OrderItem.ProductID) AS ProductCount
FROM Cart
LEFT JOIN OrderItem ON Cart.CartID = OrderItem.CartID
GROUP BY Cart.CartID;



/* Average order amount for each customer in the last quarter */
SELECT Customer.CustomerID, CONCAT(Customer.first_name, ' ', Customer.last_name) AS Name, AVG(Orderr.Total_amount) AS AvgOrderAmount
FROM Customer
INNER JOIN Orderr ON Customer.CustomerID = Orderr.CustomerID
WHERE Orderr.OrderDate >= DATE_SUB(NOW(), INTERVAL 3 MONTH)
GROUP BY Customer.CustomerID, Customer.first_name, Customer.last_name;

/* This query ranks products based on the number of feedback entries they have received, which is a different metric from average rating. */
SELECT Product.Category, Product.ProductID, Product.Name, COUNT(Feedback.FeedbackID) AS FeedbackCount
FROM Product
LEFT JOIN Feedback ON Product.ProductID = Feedback.ProductID
WHERE Product.Category = 'YourCategory'
GROUP BY Product.Category, Product.ProductID, Product.Name
ORDER BY FeedbackCount DESC
LIMIT 3;
