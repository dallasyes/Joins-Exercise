/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT product.Name AS productName, categories.Name AS categoryName 
FROM products 
JOIN categories ON products.CategoryID = categories.CategoryID 
WHERE categories.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name AS productName, products.Price AS productPrice, reviews.Rating AS productRating
FROM products
JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

 /* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
 SELECT employee.FirstName, SUM(sales.Quantity) AS TotalSales
 FROM employee
 JOIN sales ON employee.EmployeeID = sales.EmployeeID
 GROUP BY employee.EmployeeID, employee.FirstName 
 ORDER BY TotalSales DESC
 LIMIT 1;
 

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name IN ('Appliances', 'Games');


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name, SUM(sales.Quantity) = TotalQuantitySold, SUM(sales.Quantity * products.Price) AS TotalPriceSold
 FROM products
 JOIN sales ON products.ProductID = sales.ProductID
 WHERE products.Name = 'Eagles: Hotel California'
 GROUP BY products.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name = 'Visio TV'
AND reviews.Rating = (
SELECT MIN(reviews.Rating)
FROM reviews
JOIN products on products.ProductID = reviews.ProductID
WHERE products.Name = 'Visio TV');


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */