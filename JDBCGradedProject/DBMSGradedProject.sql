create database e_commerce;
use e_commerce;
create table supplier
( SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50) NOT NULL);

create table customer
(CUS_ID INT primary key,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR);

create table category
( CAT_ID INT primary key,
CAT_NAME VARCHAR(20) NOT NULL);

create table product
( PRO_ID INT primary key,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT,
foreign key(CAT_ID) references category(CAT_ID));


create table supplier_pricing
(PRICING_ID INT primary key,
PRO_ID INT,
SUPP_ID INT ,
SUPP_PRICE INT DEFAULT 0,
foreign key(PRO_ID) references product(PRO_ID),
foreign key(SUPP_ID) references supplier(SUPP_ID));

create table orders
( ORD_ID INT primary key,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT,
PRICING_ID INT,
foreign key(CUS_ID) references customer(CUS_ID),
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID));

create table rating
( RAT_ID INT primary key,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
foreign key(ORD_ID) references orders(ORD_ID));

desc supplier;
insert into supplier values(1,'Rajesh Retails','Delhi','1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi' ,'8975463285'),
(5,'Mittal Ltd.', 'Lucknow' ,'7898456532');

desc customer;
insert into customer values(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2,'AMAN','9785463215', 'NOIDA','M'),
(3, 'NEHA', '9999999999', 'MUMBAI','F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

desc category;
insert into category values(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

desc product;
insert into product values(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations',5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS','Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans','Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

desc supplier_pricing;
insert into supplier_pricing values(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1,3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

desc orders;
insert into orders values(101, 1500, '2021-10-06', 2, 1),
(102, 1000,'2021-10-12' ,3,5),
(103, 30000,'2021-09-16',5,2),
(104, 1500,'2021-10-05',1,1),
(105, 3000,'2021-08-16',4,3),
(106, 1450,'2021-08-18',1,9),
(107, 789, '2021-09-01',3,7),
(108, 780, '2021-09-07',5,6),
(109, 3000,'2021-09-10',5,3),
(110, 2500, '2021-09-10',2,4),
(111, 1000, '2021-09-15',4,5),
(112, 789, '2021-09-16',4,7),
(113, 31000, '2021-09-16',1,8),
(114, 1000, '2021-09-16',3,5),
(115, 3000, '2021-09-16',5,3),
(116, 99, '2021-09-17' ,2 ,14);

desc rating;
insert into rating values(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

-- 3) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
select * from customer;
select * from orders;

select count(distinct c.cus_id) as total_no_of_customers,c.cus_gender 
from customer c,orders o 
where c.cus_id = o.cus_id and  o.ord_amount>=3000
group by c.cus_gender;

-- 4) Display all the orders along with product name ordered by a customer having Customer_Id=2
select * from orders;
select * from supplier_pricing;
select * from product;

select o.ord_id,p.pro_name 
from orders o
join 
supplier_pricing s 
on o.pricing_id = s.pricing_id 
join product p 
on s.pro_id = p.pro_id 
where o.cus_id = 2;

-- 5) Display the Supplier details who can supply more than one product.
select * from supplier_pricing;
select * from supplier;

select s.supp_id,s.supp_name,s.supp_city,s.supp_phone 
from supplier s, supplier_pricing sp 
where s.supp_id = sp.supp_id
group by s.supp_id,s.supp_name,s.supp_city,s.supp_phone
having count(sp.pro_id) > 1;

-- 6) Create a view as lowest_expensive_product and display the least expensive product from each category and print the table
-- with category id, name, product name and price of the product.

select * from product;
select * from category;
select * from supplier_pricing;

create view lowest_expensive_product as 
SELECT C.CAT_ID, P.PRO_NAME, SP.min_price
FROM Category C
INNER JOIN product P ON C.CAT_ID = P.CAT_ID
INNER JOIN (
    SELECT C.CAT_ID, MIN(SP.SUPP_PRICE) AS min_price
    FROM Category C
    INNER JOIN product P ON C.CAT_ID = P.CAT_ID
    INNER JOIN supplier_pricing SP ON P.PRO_ID = SP.PRO_ID
    GROUP BY C.CAT_ID
) AS SP ON C.CAT_ID = SP.CAT_ID AND P.PRO_ID = (
    SELECT P.PRO_ID
    FROM product P
    INNER JOIN supplier_pricing SP ON P.PRO_ID = SP.PRO_ID
    WHERE C.CAT_ID = P.CAT_ID
    ORDER BY SP.SUPP_PRICE ASC
    LIMIT 1
);

select * from lowest_expensive_product;


-- 7) Display the Id and Name of the Product ordered after “2021-10-05”.

select * from product;
select * from orders;
select * from supplier_pricing;

select p.pro_id,p.pro_name
from product p
join supplier_pricing sp 
on p.pro_id = sp.pro_id 
join orders o 
on sp.pricing_id = o.pricing_id 
where ord_date> '2021-10-05';

-- 8) Display customer name and gender whose names start or end with character 'A'
select * from customer;

select cus_name,cus_gender from customer where cus_name like 'A%' or  cus_name like '%A'; 

-- 9) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
-- Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print
-- “Average Service” else print “Poor Service”. Note that there should be one rating per supplier

DELIMITER $$

CREATE PROCEDURE GetSupplierRatings()
BEGIN
    SELECT 
        s.SUPP_ID,
        s.SUPP_NAME,
        AVG(r.RAT_RATSTARS) AS Rating,
        CASE 
            WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
            WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
            WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM 
        supplier s
    JOIN 
        supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
    JOIN 
        orders o ON sp.PRICING_ID = o.PRICING_ID
    JOIN 
        rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY 
        s.SUPP_ID, s.SUPP_NAME;
END$$

DELIMITER ;

call  GetSupplierRatings();


