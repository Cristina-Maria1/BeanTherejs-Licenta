CREATE DATABASE BeanThereDB;
USE BeanThereDB;

 
CREATE TABLE Users (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role ENUM('consumer', 'business') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- -scop de analiza, debugging
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
    
    CREATE TABLE Shops (
    shop_id INT AUTO_INCREMENT PRIMARY KEY,
    business_id INT NOT NULL, 
    shop_name VARCHAR(255) NOT NULL,
    latitudine DECIMAL(10, 6) NOT NULL,
    longitudine DECIMAL(10, 6) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(20),
    opening_hour VARCHAR(255),
    closing_hour VARCHAR(255),
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
    );
    
    CREATE TABLE Consumer (
    consumer_id INT AUTO_INCREMENT PRIMARY KEY,
    consumer_name VARCHAR(255) NOT NULL,
    available_balance FLOAT,
    favorite_drink VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
    );
    
    CREATE TABLE Subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, 
    shop_id INT NOT NULL, 
    start_date DATE NOT NULL,
    number_of_drinks INT NOT NULL,
    remaining_drinks INT NOT NULL,
    payment_status VARCHAR(50) NOT NULL,
    transaction_id VARCHAR(255), --  payment gateway transaction 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (shop_id) REFERENCES Shops(shop_id)
);

CREATE TABLE ShopsInventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    shop_id INT NOT NULL, 
    object VARCHAR(255) NOT NULL, 
    quantity INT NOT NULL,
    measure_unit VARCHAR(50), 
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (shop_id) REFERENCES Shops(shop_id),
    UNIQUE KEY (shop_id, object) 
);
    
    
