SELECT 
    u.name,
    s.company_name,
    SUM((t.sell_price - t.buy_price) * t.quantity) AS profit_loss,
    ROUND(
        (SUM((t.sell_price - t.buy_price) * t.quantity) / 
        SUM(t.buy_price * t.quantity)) * 100, 2
    ) AS profit_percentage
FROM transactions t
JOIN users u ON t.user_id = u.user_id
JOIN stocks s ON t.stock_id = s.stock_id
GROUP BY u.name, s.company_name;

SELECT 
    u.name,
    s.company_name,
    t.buy_price,
    m.current_price,
    (m.current_price - t.buy_price) AS price_change
FROM transactions t
JOIN users u ON t.user_id = u.user_id
JOIN stocks s ON t.stock_id = s.stock_id
JOIN market_data m ON t.stock_id = m.stock_id;

SELECT 
    s.company_name,
    m.current_price,
    CASE 
        WHEN m.current_price > 3000 THEN 'High Value'
        WHEN m.current_price BETWEEN 2000 AND 3000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS risk_level
FROM market_data m
JOIN stocks s ON m.stock_id = s.stock_id;

SELECT 
    u.name,
    s.company_name,
    t.buy_price,
    m.current_price,
    CASE 
        WHEN m.current_price > t.buy_price THEN 'BUY'
        WHEN m.current_price < t.buy_price THEN 'SELL'
        ELSE 'HOLD'
    END AS recommendation
FROM transactions t
JOIN users u ON t.user_id = u.user_id
JOIN stocks s ON t.stock_id = s.stock_id
JOIN market_data m ON t.stock_id = m.stock_id;

SELECT 
    u.name,
    s.company_name,
    SUM((t.sell_price - t.buy_price) * t.quantity) AS profit_loss,
    CASE 
        WHEN AVG(m.current_price) > AVG(t.buy_price) THEN 'BUY'
        WHEN AVG(m.current_price) < AVG(t.buy_price) THEN 'SELL'
        ELSE 'HOLD'
    END AS recommendation
FROM transactions t
JOIN users u ON t.user_id = u.user_id
JOIN stocks s ON t.stock_id = s.stock_id
JOIN market_data m ON t.stock_id = m.stock_id
GROUP BY u.name, s.company_name;

ALTER TABLE transactions 
MODIFY transaction_id INT AUTO_INCREMENT;
