create database sample;
use sample;
create table sam(id int , name varchar(50), dept varchar(50));
insert into sam(id,name,dept) values(22,"Sudhan","AIDS");
select * from sam;
insert into sam(id,name,dept) values(23,"Sam","AIDS");
insert into sam(id,name,dept) values(24,"Gop","AIDS"),(25,"Som","CSE"),(26,"Arul","AIDS");
insert into sam(id,name,dept) values(27,"Ram","CSE"),(28,"Ron","AIDS"),(29,"John","CSE"),(30,"Love","IT"),(31,"Nike","IT"),(32,"Joe","IT");
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO products (product_name, category, price) VALUES
('Smartphone', 'Electronics', 15000),
('Laptop', 'Electronics', 55000),
('Washing Machine', 'Home Appliances', 25000),
('Book', 'Books', 500),
('Headphones', 'Electronics', 2000);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO customers (customer_name, city) VALUES
('Ravi', 'Chennai'),
('Anjali', 'Mumbai'),
('Kiran', 'Bangalore'),
('Meera', 'Delhi');
select product_name from products where price > 50000;

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 2, '2024-05-01'),
(1, 2, 1, '2024-05-05'),
(2, 4, 5, '2024-05-03'),
(3, 1, 1, '2024-05-04'),
(3, 5, 2, '2024-05-10'),
(4, 3, 1, '2024-05-06');

select * from orders where order_date between '2024-05-01' and '2024-05-06' order by quantity desc;

select customer_id, sum(quantity) as tty_qt
from orders group by customer_id;

SELECT o.order_id, c.customer_name, p.product_name, o.quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Simulate RIGHT JOIN
SELECT o.order_id, c.customer_name
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id;



