CREATE DATABASE Week6_Review_DB;
USE Week6_Review_DB;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50) NOT NULL
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL
);
INSERT INTO Customer VALUES
(1, 'John'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Anu');
INSERT INTO Product VALUES
(101, 'Laptop'),
(102, 'Mobile'),
(103, 'Headphones'),
(104, 'Keyboard');
CREATE TABLE Review (
    Review_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Review_Text VARCHAR(255),
    Review_Date DATE NOT NULL,

    CONSTRAINT FK_Customer
    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID),

    CONSTRAINT FK_Product
    FOREIGN KEY (Product_ID)
    REFERENCES Product(Product_ID)
);
INSERT INTO Review VALUES
('R101', 1, 101, 5, 'Excellent performance', '2026-11-01'),
('R102', 2, 102, 4, 'Good battery life', '2026-11-02'),
('R103', 3, 103, 3, 'Average quality', '2026-11-03'),
('R104', 2, 101, 5, 'Very good product', '2026-11-04'),
('R105', 4, 104, 2, 'Poor performance', '2026-11-05'),
('R106', 1, 102, 4, 'Good product', '2026-11-06'),
('R107', 3, 104, 1, 'Not satisfied', '2026-11-07');
SELECT * FROM Review;
UPDATE Review
SET Review_Text = 'Excellent quality'
WHERE Review_ID = 'R101';

DELETE FROM Review
WHERE Review_ID = 'R107';
SELECT
    Product.Product_Name,
    Review.Rating,
    Review.Review_Text
FROM Product
INNER JOIN Review
ON Product.Product_ID = Review.Product_ID;
SELECT
    Customer.Customer_Name,
    Review.Review_Text,
    Review.Rating
FROM Customer
INNER JOIN Review
ON Customer.Customer_ID = Review.Customer_ID;
SELECT
    Product.Product_Name,
    COUNT(Review.Review_ID) AS Total_Reviews
FROM Product
INNER JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
ORDER BY Total_Reviews DESC;
SELECT *
FROM Review
ORDER BY Review_Date DESC;
SELECT *
FROM Review
WHERE Rating > 4;
SELECT
    Product.Product_Name,
    AVG(Review.Rating) AS Average_Rating
FROM Product
INNER JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name;
SELECT
    Product.Product_Name,
    COUNT(Review.Review_ID) AS Total_Reviews
FROM Product
LEFT JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name;
SELECT
    Product.Product_Name,
    AVG(Review.Rating) AS Average_Rating
FROM Product
INNER JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
ORDER BY Average_Rating DESC;
SELECT
    Product.Product_Name,
    AVG(Review.Rating) AS Average_Rating
FROM Product
INNER JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
HAVING AVG(Review.Rating) > 4;
SELECT
    Product.Product_Name,
    COUNT(Review.Review_ID) AS Total_Reviews,
    AVG(Review.Rating) AS Average_Rating
FROM Product
LEFT JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name;
SELECT
    Product.Product_Name,
    COUNT(Review.Review_ID) AS Total_Reviews
FROM Product
LEFT JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
ORDER BY Total_Reviews DESC;
SELECT
    Product.Product_Name,
    AVG(Review.Rating) AS Average_Rating
FROM Product
INNER JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
HAVING AVG(Review.Rating) >= 4;
SELECT
    Product.Product_Name,
    AVG(Review.Rating) AS Average_Rating
FROM Product
INNER JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name
HAVING AVG(Review.Rating) < 3;
SELECT COUNT(*) AS Five_Star_Ratings
FROM Review
WHERE Rating = 5;
SELECT COUNT(*) AS Four_Star_Ratings
FROM Review
WHERE Rating = 4;
SELECT COUNT(*) AS Low_Ratings
FROM Review
WHERE Rating <= 2;
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Review;