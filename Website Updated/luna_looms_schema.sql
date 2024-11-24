-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS luna_looms;

-- Use the created database
USE luna_looms;

-- Create the users table for login and signup functionality
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Auto-incrementing user ID
    firstname VARCHAR(50) NOT NULL,             -- User's first name
    lastname VARCHAR(50) NOT NULL,              -- User's last name
    email VARCHAR(100) UNIQUE NOT NULL,         -- User's unique email
    password VARCHAR(255) NOT NULL,             -- User's password (hashed)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp when user is created
);

-- Create the orders table for the checkout process
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,    -- Auto-incrementing order ID
    user_id INT NOT NULL,                       -- Foreign key linking to the users table
    product_details TEXT NOT NULL,              -- Details of the products in the order
    total_price DECIMAL(10, 2) NOT NULL,        -- Total price of the order
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when order was placed
    FOREIGN KEY (user_id) REFERENCES users(id)  -- Foreign key constraint
);

-- Optional: Add a sample user (you can remove or modify this as needed)
INSERT INTO users (firstname, lastname, email, password)
VALUES
('John', 'Doe', 'john.doe@example.com', PASSWORD('john1234')); -- Sample user with hashed password
