CREATE TABLE `bi_muamalat.master_table` AS
SELECT
  o.Date AS order_date,
  pc.CategoryName AS category_name,
  p.ProdName AS product_name,
  p.Price AS product_price,
  o.Quantity AS order_qty,
  (o.Quantity * p.Price) AS total_sales,
  c.CustomerEmail AS cust_email,
  c.CustomerCity AS cust_city
FROM `bi_muamalat.orders` o
  JOIN `bi_muamalat.customers` c
    ON o.CustomerID = c.CustomerID
  JOIN `bi_muamalat.products` p
    ON o.ProdNumber = p.ProdNumber
  JOIN `bi_muamalat.productcategory` pc
    ON p.Category = pc.CategoryID
ORDER BY order_date ASC;
