CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

WITH ItemCounts AS (
    SELECT item, COUNT(*) as count
    FROM item_bought
    GROUP BY item
),
MaxMinCounts AS (
    SELECT MAX(count) as max_count, MIN(count) as min_count
    FROM ItemCounts
)
SELECT item
FROM ItemCounts
WHERE count NOT IN (SELECT max_count FROM MaxMinCounts)
  AND count NOT IN (SELECT min_count FROM MaxMinCounts);