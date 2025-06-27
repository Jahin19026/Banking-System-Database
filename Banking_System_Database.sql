--- Create the database
CREATE DATABASE IF NOT EXISTS Banking_System;
USE Banking_System;

--- Table: Branches
CREATE TABLE Branches (
    branch_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    contact_number VARCHAR(20)
);

--- Table: Customers
CREATE TABLE Customers (
    customer_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(100) UNIQUE,
    address TEXT,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

--- Table: Employees
CREATE TABLE Employees (
    employee_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    branch_id SMALLINT,
    position VARCHAR(100),
    hire_date DATE,
    FOREIGN KEY (branch_id)
        REFERENCES Branches (branch_id)
);

--- Table: Accounts
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id SMALLINT,
    branch_id SMALLINT,
    account_type ENUM('Savings', 'Checking') NOT NULL,
    balance DECIMAL(15 , 2 ) DEFAULT 0.00,
    opened_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id)
        REFERENCES Customers (customer_id),
    FOREIGN KEY (branch_id)
        REFERENCES Branches (branch_id)
); 


-- Table: Loans
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id SMALLINT,
    branch_id SMALLINT,
    loan_amount DECIMAL(15,2) NOT NULL,
    loan_type ENUM('Home', 'Auto', 'Personal') NOT NULL,
    issue_date DATE,
    status ENUM('Pending', 'Approved', 'Rejected', 'Closed') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

-- Table: Transactions
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

--- Insert statements for all 6 tables
INSERT INTO Branches (branch_name, location, contact_number) VALUES
('Uttara Branch', 'Dhaka', '01711111111'),
('Motijheel Branch', 'Dhaka', '01722222222'),
('Chittagong Branch', 'Chittagong', '01833333333'),
('Sylhet Branch', 'Sylhet', '01644444444'),
('Khulna Branch', 'Khulna', '01955555555'),
('Rajshahi Branch', 'Rajshahi', '01566666666'),
('Barisal Branch', 'Barisal', '01377777777'),
('Mymensingh Branch', 'Mymensingh', '01488888888'),
('Comilla Branch', 'Comilla', '01799999999'),
('Jessore Branch', 'Jessore', '01800000000');


INSERT INTO Customers (first_name, last_name, email, address, registration_date) VALUES
('Rahim', 'Uddin', 'rahim@example.com', 'Dhaka', '2023-01-05 10:15:00'),
('Karim', 'Ahmed', 'karim@example.com', 'Chittagong','2023-02-14 09:00:00'),
('Fatema', 'Begum', 'fatema@example.com', 'Sylhet', '2023-03-22 14:30:00'),
('Nasrin', 'Sultana', 'nasrin@example.com', 'Khulna', '2023-04-18 12:00:00'),
('Sajjad', 'Hossain', 'sajjad@example.com', 'Rajshahi', '2023-05-25 16:45:00'),
('Nadia', 'Khan', 'nadia@example.com',  'Mymensingh', '2023-07-01 11:20:00'),
('Imran', 'Ali', 'imran@example.com', 'Barisal', '2023-08-09 10:10:00'),
('Munna', 'Hasan', 'munna@example.com', 'Comilla','2023-10-15 15:00:00'),
('Rafi', 'Chowdhury', 'rafi@example.com', 'Dhaka','2023-11-05 17:30:00'),
('Ayesha', 'Rahman', 'ayesha@example.com', 'Jessore','2024-01-12 13:40:00');


INSERT INTO Employees (first_name, last_name, branch_id, position, hire_date) VALUES
('Tanvir', 'Rahman', 1, 'Manager', '2020-01-15'),
('Lamia', 'Khatun', 2, 'Assistant Manager', '2021-03-20'),
('Hasib', 'Ahmed', 3, 'Officer', '2019-07-10'),
('Sadia', 'Parvin', 4, 'Cashier', '2022-01-05'),
('Jewel', 'Mia', 5, 'IT Support', '2018-11-12'),
('Rima', 'Sultana', 6, 'Manager', '2020-08-08'),
('Sabbir', 'Hossain', 7, 'Officer', '2021-12-01'),
('Nusrat', 'Jahan', 8, 'Cashier', '2022-06-25'),
('Farhan', 'Khan', 9, 'Clerk', '2023-02-14'),
('Munni', 'Begum', 10, 'Officer', '2023-04-30');


INSERT INTO Accounts (customer_id, branch_id, account_type, balance) VALUES
(1, 1, 'Savings', 50000.00),
(2, 2, 'Checking', 30000.00),
(3, 3, 'Checking', 100000.00),
(4, 4, 'Savings', 45000.00),
(5, 5, 'Savings', 25000.00),
(6, 6, 'Checking', 35000.00),
(7, 7, 'Savings', 20000.00),
(8, 8, 'Savings', 18000.00),
(9, 9, 'Checking', 120000.00),
(10, 10, 'Savings', 60000.00);


INSERT INTO Loans (customer_id, branch_id, loan_amount, loan_type, issue_date, status) VALUES
(1, 1, 200000.00, 'Home', '2023-01-15', 'Approved'),
(2, 2, 150000.00, 'Auto', '2023-03-10', 'Approved'),
(3, 3, 50000.00, 'Personal', '2023-05-20', 'Pending'),
(4, 4, 80000.00, 'Auto', '2023-07-05', 'Approved'),
(5, 5, 100000.00, 'Home', '2023-09-12', 'Rejected'),
(6, 6, 90000.00, 'Personal', '2023-11-30', 'Closed'),
(7, 7, 60000.00, 'Auto', '2024-01-10', 'Approved'),
(8, 8, 300000.00, 'Home', '2024-02-18', 'Pending'),
(9, 9, 40000.00, 'Personal', '2024-04-01', 'Approved'),
(10, 10, 250000.00, 'Home', '2024-05-25', 'Approved');


INSERT INTO Transactions (account_id, transaction_type, amount, description) VALUES
(1, 'Deposit', 10000.00, 'Initial Deposit'),
(2, 'Withdrawal', 5000.00, 'ATM Withdrawal'),
(3, 'Transfer', 15000.00, 'Online Transfer to another account'),
(4, 'Deposit', 20000.00, 'Cash Deposit'),
(5, 'Withdrawal', 10000.00, 'ATM Withdrawal'),
(6, 'Transfer', 5000.00, 'Transfer to another bank'),
(7, 'Deposit', 8000.00, 'Mobile banking'),
(8, 'Transfer', 3000.00, 'Sent to friend'),
(9, 'Deposit', 25000.00, 'FD Maturity'),
(10, 'Withdrawal', 7000.00, 'POS payment');



