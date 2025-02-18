 /*

 BACKGROUND:
 
 The following schema is a subset of a relational database of a grocery store
 chain. This chain sells many products of different product classes to its
 customers across its different stores. It also conducts many different
 promotion campaigns.
 
 The relationship between the four tables we want to analyze is depicted below:
 
       # sales                                # products
       +------------------+---------+         +---------------------+---------+
       | product_id       | INTEGER |>--------| product_id          | INTEGER |
       | store_id         | INTEGER |    +---<| product_class_id    | INTEGER |
       | customer_id      | INTEGER |    |    | brand_name          | VARCHAR |
  +---<| promotion_id     | INTEGER |    |    | product_name        | VARCHAR |
  |    | store_sales      | DECIMAL |    |    | is_low_fat_flg      | TINYINT |
  |    | store_cost       | DECIMAL |    |    | is_recyclable_flg   | TINYINT |
  |    | units_sold       | DECIMAL |    |    | gross_weight        | DECIMAL |
  |    | transaction_date | DATE    |    |    | net_weight          | DECIMAL |
  |    +------------------+---------+    |    +---------------------+---------+
  |                                      |
  |    # promotions                      |    # product_classes
  |    +------------------+---------+    |    +---------------------+---------+
  +----| promotion_id     | INTEGER |    +----| product_class_id    | INTEGER |
       | promotion_name   | VARCHAR |         | product_subcategory | VARCHAR |
       | media_type       | VARCHAR |         | product_category    | VARCHAR |
       | cost             | DECIMAL |         | product_department  | VARCHAR |
       | start_date       | DATE    |         | product_family      | VARCHAR |
       | end_date         | DATE    |         +---------------------+---------+
       +------------------+---------+

 */ 
 /*
 PROMPT:
 -- What percent of all products in the grocery chain's catalog
 -- are both low fat and recyclable?
 

 EXPECTED OUTPUT:
 Note: Please use the column name(s) specified in the expected output in your solution.
 +----------------------------+
 | pct_low_fat_and_recyclable |
 +----------------------------+
 |         15.384615384615385 |
 +----------------------------+

 -------------- PLEASE WRITE YOUR SQL SOLUTION BELOW THIS LINE ---------------- 
 */
 
/* Answer using AVG and CASE:
SELECT 
    AVG(CASE
           WHEN is_low_fat_flg = 1 AND is_recyclable_flg = 1 THEN 100.0 
           ELSE 0 
        END) AS pct_low_fat_and_recyclable
    FROM products;
*/

/* How many products are in the grocery store’s catalog? 
SELECT COUNT(product_id) as number_of_products_in_catalog from products;
*/

/* What percentage of all products are recyclable? 
SELECT (COUNT(*) * 100/ (SELECT COUNT(*) FROM products)) AS pct_recyclable_products FROM products WHERE is_recyclable_flg = 1;
*/

/* What percentage of products are classified as low-fat?
SELECT
    AVG(CASE
            WHEN is_low_fat_flg = 1 THEN 100.0
            ELSE 0
        END) AS pct_low_fat_products
    FROM products;
*/

/* What is the total store sales across all stores? 
SELECT SUM(store_sales) AS total_store_sales_across_all_stores FROM sales;
*/

/* Calculate the total number of units sold for each product. 
SELECT product_id, SUM(units_sold) AS total_units_sold_across_all_stores
FROM sales GROUP BY product_id;
*/

/* Add Product Name to the search results above 
SELECT p.product_name, p.product_id, COALESCE(SUM(s.units_sold), 0) AS total_units_sold_across_all_stores
FROM products p LEFT JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name;
*/

/* Find the average store sales for each store. */ 



/* Which product has the highest total units sold? */



/* What is the total store sales for each product category? */



/* Which promotion resulted in the highest total store sales? */



/* Find the top 5 customers based on total spending (store_sales). */


