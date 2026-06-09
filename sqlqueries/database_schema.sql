CREATE DATABASE stock_project;
USE stock_project;

-- USERS
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    risk_level VARCHAR(10),
    investment_budget DECIMAL(10,2)
);

-- STOCKS
CREATE TABLE stocks (
    stock_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    sector VARCHAR(50)
);

-- TRANSACTIONS (AUTO INCREMENT FIX)
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    stock_id INT,
    buy_price DECIMAL(10,2),
    sell_price DECIMAL(10,2),
    quantity INT,
    transaction_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);

-- MARKET DATA (FIXED)
CREATE TABLE market_data (
    stock_id INT,
    current_price DECIMAL(10,2),
    volume BIGINT,
    timestamp DATETIME,
    FOREIGN KEY (stock_id) REFERENCES stocks(stock_id)
);
