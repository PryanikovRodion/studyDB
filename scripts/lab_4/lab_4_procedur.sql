use `plants`;
DELIMITER //

-- 1. Створення процедури "Додати Новий Товар"
CREATE PROCEDURE `procedureAddNewProduct`(
    IN p_name VARCHAR(128),         -- "IN" означає вхідний параметр
    IN p_description TEXT,
    IN p_price DECIMAL(10,2),
    IN p_quantity INT,
    IN p_category_id INT
)
BEGIN
    -- Тіло процедури:
    -- Виконуємо звичайний INSERT з даними,
    -- які ми отримали через параметри
    INSERT INTO `Product`
        (`name`, `description`, `price`, `quantity`, `categoryId`)
    VALUES
        (p_name, p_description, p_price, p_quantity, p_category_id);
END //
-- Закінчили процедуру нашим новим роздільником "//"

-- Повертаємо стандартний роздільник ";"
DELIMITER ;
