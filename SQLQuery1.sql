CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255) 
);
CREATE TABLE PhoneNumbers (
    PhoneNumberID INT PRIMARY KEY,
    CustomerID INT,
    Phone VARCHAR(15),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE users (
	id int,
    username VARCHAR(255),
    password TEXT,
    first_name TEXT,
    last_name TEXT,
	birth_date date
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(255),
    Category VARCHAR(255),
    Price DECIMAL(10, 2),
    description  VARCHAR(255),
    state BIT
);

CREATE TABLE Orderr (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    total_amount decimal,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE cart (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orderr(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    Comment TEXT,
    CustomerID INT,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Customer (CustomerID, Name, Address, Email, Password)
VALUES
    (1, 'Ahmed Mohamed', 'Cairo, Egypt', 'ahmed@gmail.com', 'password1'),
    (2, 'Amr Ali', 'Alexandria, Egypt', 'amr@gmail.com', 'password2'),
    (3, 'Hassan Ibrahim', 'Giza, Egypt', 'hassan@gmail.com', 'password3'),
    (4, 'Mohamed Abdelrahman', 'Luxor, Egypt', 'mohamed@gmail.com', 'password4'),
    (5, 'Khaled Hussein', 'Aswan, Egypt', 'khaled@gmail.com', 'password5'),
    (6, 'Mahmoud Ahmed', 'Hurghada, Egypt', 'mahmoud@gmail.com', 'password6'),
    (7, 'Ali Hassan', 'Sharm El Sheikh, Egypt', 'ali@gmail.com', 'password7'),
    (8, 'Omar Mohamed', 'Dahab, Egypt', 'omar@gmail.com', 'password8'),
    (9, 'Tarek Mahmoud', 'Suez, Egypt', 'tarek@gmail.com', 'password9'),
    (10, 'Ibrahim Abdelaziz', 'Port Said, Egypt', 'ibrahim@gmail.com', 'password10');


INSERT INTO PhoneNumbers (PhoneNumberID, CustomerID, Phone)
VALUES
    (1, 1, '+201234567890'),
    (2, 2, '+201112223344'),
    (3, 3, '+201987654321'),
    (4, 4, '+202345678901'),
    (5, 5, '+202876543210'),
    (6, 6, '+203111122233'),
    (7, 7, '+203444455556'),
    (8, 8, '+204999988877'),
    (9, 9, '+204665544433'),
    (10, 10, '+205777766655');

INSERT INTO users (id, username, password, first_name, last_name, birth_date)
VALUES
    (1, 'ahmed_mohamed', 'password1', 'Ahmed', 'Mohamed', '1990-05-15'),
    (2, 'amr_ali', 'password2', 'Amr', 'Ali', '1988-09-20'),
    (3, 'hassan_ibrahim', 'password3', 'Hassan', 'Ibrahim', '1995-02-10'),
    (4, 'mohamed_abdelrahman', 'password4', 'Mohamed', 'Abdelrahman', '1985-07-08'),
    (5, 'khaled_hussein', 'password5', 'Khaled', 'Hussein', '1992-11-25'),
    (6, 'mahmoud_ahmed', 'password6', 'Mahmoud', 'Ahmed', '1998-04-30'),
    (7, 'ali_hassan', 'password7', 'Ali', 'Hassan', '1993-12-18'),
    (8, 'omar_mohamed', 'password8', 'Omar', 'Mohamed', '1987-03-22'),
    (9, 'tarek_mahmoud', 'password9', 'Tarek', 'Mahmoud', '1996-08-12'),
    (10, 'ibrahim_abdelaziz', 'password10', 'Ibrahim', 'Abdelaziz', '1991-01-05');
    

INSERT INTO Product (ProductID, Name, Category, Price, Description, State)
VALUES
    (1, 'Smart TV', 'Electronics', 799.99, '4K Smart TV with HDR', 1),
    (2, 'Coffee Maker', 'Homeware', 49.99, 'Programmable coffee maker', 1),
    (3, 'Laptop', 'Electronics', 1099.99, 'High-performance laptop', 1),
    (4, 'Toaster', 'Homeware', 29.99, '2-slice toaster', 1),
    (5, 'Bluetooth Speaker', 'Electronics', 69.99, 'Wireless Bluetooth speaker', 1),
    (6, 'Bedding Set', 'Homeware', 79.99, 'Comfortable bedding set', 1),
    (7, 'Smartphone', 'Electronics', 599.99, 'Latest smartphone model', 1),
    (8, 'Cookware Set', 'Homeware', 129.99, 'Non-stick cookware set', 1),
    (9, 'Fitness Tracker', 'Electronics', 49.99, 'Health and fitness tracker', 1),
    (10, 'Table Lamp', 'Homeware', 19.99, 'Modern table lamp', 1);


INSERT INTO Orderr (OrderID, OrderDate, CustomerID, total_amount)
VALUES
    (1, '2023-01-15', 1, 150.99),
    (2, '2023-02-20', 2, 75.50),
    (3, '2023-03-10', 3, 200.00),
    (4, '2023-04-08', 4, 120.75),
    (5, '2023-05-25', 5, 90.49),
    (6, '2023-06-30', 6, 300.25),
    (7, '2023-07-18', 7, 50.00),
    (8, '2023-08-22', 8, 180.99),
    (9, '2023-09-12', 9, 250.50),
    (10, '2023-10-05', 10, 130.75);

INSERT INTO Cart (OrderID, ProductID, Quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 3),
    (3, 4, 1),
    (4, 5, 2),
    (5, 6, 1),
    (6, 7, 2),
    (7, 8, 1),
    (8, 9, 3),
    (9, 10, 1);


INSERT INTO Feedback (FeedbackID, Comment, CustomerID, ProductID)
VALUES
    (1, 'Great product!', 1, 1),
    (2, 'Excellent service!', 2, 3),
    (3, 'Could be better.', 3, 5),
    (4, 'Love it!', 4, 7),
    (5, 'Fast delivery.', 5, 9),
    (6, 'Not satisfied.', 6, 2),
    (7, 'Highly recommended!', 7, 4),
    (8, 'Good quality.', 8, 6),
    (9, 'Needs improvement.', 9, 8),
    (10, 'Awesome product!', 10, 10);