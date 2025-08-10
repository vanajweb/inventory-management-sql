--  Total Inventory Value
SELECT SUM(stock_quantity * purchase_price) AS total_inventory_value
FROM inventory;

--  Total Units Sold per Product
SELECT i.item_name, SUM(s.quantity_sold) AS total_sold
FROM sales s
JOIN inventory i ON s.item_id = i.item_id
GROUP BY i.item_name;

--  Remaining Stock per Product
SELECT i.item_name, i.stock_quantity,
       (i.stock_quantity - COALESCE(SUM(s.quantity_sold),0)) AS remaining_stock
FROM inventory i
LEFT JOIN sales s ON i.item_id = s.item_id
GROUP BY i.item_name, i.stock_quantity;

--  Profit Calculation
SELECT 
  i.item_id,
  i.item_name,
  SUM(s.quantity_sold) AS total_units_sold,
  SUM(s.sale_price) AS total_sales_amount,
  SUM(p.total_cost) AS total_purchase_cost,
  AVG(p.unit_cost) AS avg_unit_cost,
  (AVG(p.unit_cost) * SUM(s.quantity_sold)) AS total_estimated_cost,
  (SUM(s.sale_price) - (AVG(p.unit_cost) * SUM(s.quantity_sold))) AS estimated_profit
FROM 
  sales s
JOIN 
  inventory i ON s.item_id = i.item_id
JOIN 
  purchases p ON p.item_id = s.item_id
GROUP BY 
  i.item_id, i.item_name;

