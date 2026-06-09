INSERT INTO users VALUES
(1, 'Amirtha', 'Medium', 100000),
(2, 'Rahul', 'High', 200000);

INSERT INTO stocks VALUES
(101, 'TCS', 'IT'),
(102, 'Reliance', 'Energy'),
(103, 'HDFC Bank', 'Finance');

INSERT INTO transactions (user_id, stock_id, buy_price, sell_price, quantity, transaction_date)
SELECT 
    FLOOR(1 + RAND()*2), 
    ELT(FLOOR(1 + RAND()*3), 101,102,103),
    ROUND(1000 + RAND()*3000,2),
    ROUND(1000 + RAND()*3000,2),
    FLOOR(1 + RAND()*10),
    DATE_ADD('2025-01-01', INTERVAL FLOOR(RAND()*90) DAY)
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) a,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) b,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) c;
INSERT INTO market_data (stock_id, current_price, volume, timestamp)
SELECT 
    stock_id,
    ROUND(1000 + RAND()*3000,2),
    FLOOR(500000 + RAND()*1000000),
    NOW()
FROM stocks;

INSERT INTO users VALUES
(3, 'Priya', 'Low', 80000),
(4, 'Arjun', 'Medium', 120000),
(5, 'Sneha', 'High', 250000),
(6, 'Kiran', 'Low', 60000),
(7, 'Vikram', 'Medium', 150000);
