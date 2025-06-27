CREATE DATABASE Customer;

USE customer;

CREATE TABLE Customers(
Customerid INT PRIMARY KEY,
Name VARCHAR (255),
Email VARCHAR (255),
Phone VARCHAR (255),
Address VARCHAR (255)
);

SELECT * FROM customers;

CREATE TABLE accounts(
Accountid INT PRIMARY KEY,
Customerid INT,
Accounttype VARCHAR(255),
BALANCE DECIMAL(10,2),
FOREIGN KEY (customerid)REFERENCES CUSTOMERS(customerid)
);
  
SELECT * FROM accounts;

CREATE TABLE transactions(
transactionid INT PRIMARY KEY,
accountid INT,
transactiontype VARCHAR(255),
amount DECIMAL (10,2),
transactiondate DATE,
FOREIGN KEY (accountid) REFERENCES accounts (accountid)
);

SELECT * FROM transcations;

INSERT INTO customers(customerid, Name, Email, Phone, Address)
VALUES
(1, "John doe", 'john.doe@example.com', 9540206040, '123 main st'),
(2, "Jone doe", 'jone.doe@examole.com', 9876544321, '456 Eim st');

INSERT INTO Accounts(accountid, customerid, accounttype, Balance)
Values
(1, 1, "CHACKING", 1000.00),
(2,2, "SAVING", 500.00);

INSERT INTO transactions(transactionid, accountid, transactiontype, amount,transactionDate)
VALUES
(1,1, "Deposit", 500.00, '2022-01-01'),
(2,2, "WITHDRAWAL", 200.00, '2022-01-15');

select * from transactions;


START TRANSACTION;
UPDATE account SET balance = balance+500 WHERE accountid =1;
SAVEPOINT MY_SAVEPOINT;
UPDATE account SET balance = balance-200.00 WHERE accountid =2;
ROLLBACK TO my_savepoint;
COMMIT;


GRANT SELECT, UPDATE ON customers TO 'USER1'@'localhost';
GRANT SELECT, UPDATE ON accounts TO 'USER1'@'localhost';
GRANT SELECT, UPDATE ON transactions TO 'USER'@'localhost';

REVOKE INSERT ON customer FROM "USER"@'localhost';




