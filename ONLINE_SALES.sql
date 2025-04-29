CREATE TABLE online_sales (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    product_id INT NOT NULL
);

INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1001, '2023-01-15', 250.00, 1),
(1002, '2023-01-17', 320.00, 2),
(1003, '2023-02-05', 150.00, 1),
(1004, '2023-02-20', 450.00, 3),
(1005, '2023-03-03', 200.00, 2);


SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
WHERE
    order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year,
    order_month;


