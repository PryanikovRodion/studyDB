-- 1. Викликаємо процедуру, щоб додати новий товар
CALL plants.`procedureAddNewProduct`(
    'Spetc',
    'жовтий',
    1250.00,
    20,
    1
);
-- 2. Перевіряємо, чи з'явився товар у таблиці
SELECT 
p.name,
p.id as productId,
p.description,
p.price,
p.quantity,
c.name as category

FROM plants.`Product` as p
join plants.`category` as c on p.categoryId = c.id 
where p.name = "Spetc";
