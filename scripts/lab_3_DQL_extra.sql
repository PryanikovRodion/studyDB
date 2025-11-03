-- DQL: Агрегація (COUNT + GROUP BY)
-- Рахуємо кількість товарів у кожній категорії
SELECT
  `categoryid`,
  COUNT(*) AS `total_products`
FROM
  plants.`Product`
GROUP BY
  `categoryid`;

-- DQL: Агрегація (SUM)
-- Рахуємо загальну вартість всіх товарів на складі
SELECT
  SUM(`price` * `quantity`) AS `totalStockValue`
FROM
  plants.`Product`;

-- DQL: Агрегація (AVG, MIN, MAX)
-- Аналітика цін по категорії "Зернова кава"
SELECT
  AVG(`price`) AS `averagePrice`,
  MIN(`price`) AS `minPrice`,
  MAX(`price`) AS `maxPrice`
FROM
  plants.`Product`
WHERE
  `categoryId` = 1;

-- DQL: Агрегація (GROUP BY + JOIN)
-- Рахуємо загальну суму витрат для кожного клієнта
SELECT
  c.name,
  SUM(oc.productQuantity * oc.productPrice ) AS totalSpent
FROM
  plants.`Client` AS c
JOIN
  plants.`Order` AS o ON c.id  = o.clientId 
JOIN
  plants.`OrderContent` AS oc ON o.id = oc.orderId
GROUP BY
  c.id, c.name -- Групуємо за ID та іменем
ORDER BY
  totalSpent desc; -- Сортуємо, щоб бачити топ-клієнтів
  -- Крапка з комою в кінці відсутня навмисно.
  
-- Знаходимо клієнтів, які витратили більше 1000
SELECT
  c.name,
  SUM(oc.productQuantity * oc.productPrice ) AS totalSpent
FROM
  plants.`Client` AS c
JOIN
  plants.`Order` AS o ON c.id  = o.clientId
JOIN
  plants.`OrderContent` AS oc ON o.id = oc.orderId
GROUP BY
  c.id, c.name -- Групуємо за ID та іменем
HAVING
  totalSpent > 100 -- Фільтруємо результати агрегації
ORDER BY
  totalSpent desc;
  
-- DQL: INNER JOIN
SELECT
  c.name AS customerName,
  p.name AS productName,
  oc.productQuantity ,
  o.status
FROM
  plants.`Client` AS c
INNER JOIN
  plants.`Order` AS o ON c.id = o.clientId 
INNER JOIN
  plants.`OrderContent` AS oc ON o.id = oc.orderId
INNER JOIN
  plants.`Product` AS p ON oc.productId = p.id
WHERE
  o.status = 'ready' -- Наприклад, показуємо тільки готові
ORDER BY
  c.name;
  
-- DQL: LEFT JOIN
-- Знайти всіх користувачів, та їхні замовлення (якщо вони є)
SELECT
  c.name AS customerName,
  o.id AS orderId
FROM
  plants.`Client` AS c
LEFT JOIN
  plants.`Order` AS o ON c.id = o.clientId
ORDER BY
  c.name;
  
-- DQL: Підзапит (Subquery)
-- Знайти товари, які ніколи не купували
SELECT
  p.name
FROM
  plants.`Product` AS p
WHERE
  p.id NOT IN (
      -- Внутрішній запит:
      -- Отримуємо унікальний список ID всіх куплених товарів
      SELECT DISTINCT oc.productId FROM plants.`OrderContent` AS oc
  );

 -- DQL: Комбінування вибірок (UNION)
-- Отримати єдиний список імен клієнтів та назв категорій
SELECT
  c.name AS itemName,
 'Client' as itemType
FROM
  plants.`Client` AS c

UNION

SELECT
  ct.name AS itemName,
  'Category' as itemType
FROM
  plants.`Category` AS ct
ORDER BY
  itemType, itemName;
