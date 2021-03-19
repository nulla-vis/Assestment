-- Tables ------------------------------------------------------------------------------------------------------

-- CUSTOMER

CREATE TABLE customer (
 id INT AUTO_INCREMENT,
 customer_name VARCHAR (128),
 gender VARCHAR (1),
 PRIMARY KEY(id) 
);

DESCRIBE customer;

INSERT INTO customer(customer_name, gender) 
VALUES ('Chongyun', 'M'),
('Xanglng', 'F'),
('MNngguang', 'F'),
('Zhongl', 'M'),
('Xiao', 'M'),
('Beidou', 'F');


SELECT * FROM customer;
DROP TABLE customer;

-- -----------------------------------------------------------------------
-- TRANSACTION
CREATE TABLE transaction (
 id INT AUTO_INCREMENT,
 customer_id INT,
 quantity INT,
 total INT,
 created_at DATETIME,
 PRIMARY KEY(id) 
);

DESCRIBE transaction;

INSERT INTO transaction (customer_id, quantity, total, created_at) 
VALUES (1,3,210000, CURRENT_TIMESTAMP()),
(2,1,150000, '2021-03-19 09:12:50'),
(3,8,870000, '2021-03-19 07:05:15'),
(6,1,140000, '2021-03-19 05:05:15'),
(6,1,140000, '2021-03-19 05:04:15'),
(1,1,65000, CURRENT_TIMESTAMP()),
(1,1,65000, CURRENT_TIMESTAMP()),
(1,1,65000, CURRENT_TIMESTAMP());

SELECT * FROM transaction;

DROP TABLE transaction;
-- --------------------------------------------------------------------------------------------------------------------------

-- PRODUCT
CREATE TABLE product (
 id INT AUTO_INCREMENT,
 product_name VARCHAR (128),
 price INT,
 PRIMARY KEY(id) 
);

INSERT INTO product(product_name, price) 
VALUES('Tas', 80000 ),
('Topi', 65000),
('Baju', 150000 ),
('Celana', 140000 );

DESCRIBE product;
SELECT * FROM product;
-- -----------------------------------------------------------------

-- TRANSACTION DETAIL
CREATE TABLE transactionDetail (
 id INT AUTO_INCREMENT,
 transaction_id INT,
 product_id INT,
 quantity INT,
 sub_total INT,
 PRIMARY KEY(id) 
);

INSERT INTO transactionDetail (transaction_id, product_id, quantity, sub_total)
VALUES (1,1,1,80000),
(1,2,2,130000),
(2,3,1,150000),
(3,1,2,160000),
(3,2,2,130000),
(3,3,3,540000),
(3,4,4,560000),
(4,4,1,140000),
(5,4,1,140000),
(6,2,1,65000),
(7,2,1,65000),
(8,2,1,65000);

DESCRIBE transactionDetail;   
DROP TABLE transactionDetail;
SELECT * FROM transactionDetail;



-- Queries -----------------------------------------------------------------------------------------------------

--Best Seller Female
SELECT customer.gender, product.id AS product_id, product.product_name AS product_name, sum(transactionDetail.quantity) AS quantity
FROM transactionDetail JOIN transaction
ON transactionDetail.transaction_id = transaction.id JOIN product
ON product.id = transactionDetail.product_id JOIN customer
ON customer.id = transaction.customer_id
WHERE customer.gender = 'F'
GROUP BY product_name
ORDER BY quantity DESC
LIMIT 1
;

--Best Seller Male
SELECT customer.gender, product.id AS product_id, product.product_name AS product_name, sum(transactionDetail.quantity)AS quantity
FROM transactionDetail JOIN transaction
ON transactionDetail.transaction_id = transaction.id JOIN product
ON product.id = transactionDetail.product_id JOIN customer    
ON customer.id = transaction.customer_id
WHERE customer.gender = 'M'
GROUP BY product_name
ORDER BY quantity DESC
LIMIT 1
;

--Customer spend most money
SELECT customer.customer_name, SUM(transaction.total) as total
FROM customer JOIN transaction
ON customer.id = transaction.customer_id
GROUP BY customer.customer_name
ORDER BY total DESC
LIMIT 1
;

--number of transaction every 2 hours
SELECT COUNT(created_at)
FROM transaction
GROUP BY DATE(created_at), HOUR(created_at) DIV 2
;

