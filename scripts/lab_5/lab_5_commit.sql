use `plants`;
-- 1. Дивимося на ціну "ДО"
SELECT * FROM `Product` WHERE `id` = 7;

-- 2. Починаємо транзакцію
START TRANSACTION;

-- 3. Виконуємо нашу DML-операцію
UPDATE `Product`
SET `price` = 666.66 -- Нова ціна
WHERE `id` = 7;

-- 4. Завершуємо транзакцію ТА ЗБЕРІГАЄМО ЗМІНИ
COMMIT;

-- 5. Дивимося на ціну "ПІСЛЯ"
SELECT * FROM `Product` WHERE `id` = 7;
