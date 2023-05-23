CREATE DATABASE banks_portal;
USE banks_portal;
CREATE TABLE accounts
(
accountId INT NOT NULL AUTO_INCREMENT,
ownername VARCHAR(45) NOT NULL,
owner_snn INT NOT NULL,
balance DECIMAL(10,2) DEFAULT 0.00,
account_status VARCHAR(45),
PRIMARY KEY(accountId)
);
CREATE TABLE IF NOT EXISTS transactions
( 
transactionId INT NOT NULL AUTO_INCREMENT,
accountId INT NOT NULL,
transactiontype VARCHAR(45) NOT NULL,
transactionamount DECIMAL(10,2) NOT NULL,
PRIMARY KEY(transactionId)
);
INSERT INTO accounts 
(ownerName, owner_ssn, balance, account_status)
VALUES (1, "Maria Josef", 123456789, 10000.00, "active"),
(2, "Linda Jones", 987654327, 2600.00, "inactive"),
(3, "John McGrail", 222222222, 100.50, "active"),
(4, "Patty Luna", 111111111, 509.75, "inactive");

SELECT * FROM accounts;

INSERT INTO transactions 
(accountId, transactionType, transactionAmount)
VALUES (1, "deposit", 650.98),
(3, "withdraw", 899.87),
(3, "deposit", 350.00);

SELECT * FROM transactions;

DELIMITER //
CREATE PROCEDURE accountTransactions(IN accountID INT)
BEGIN
    SELECT * FROM Transactions
    WHERE accountID = accountID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE deposit(
IN accountID INT,IN amount DECIMAL(10,2))
BEGIN
  INSERT INTO transactions (accountId, transactionType, transactionAmount)
  VALUES (accountID, "deposit", amount);
  
  UPDATE accounts SET balance = balance + amount WHERE accountId = accountID;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE withdraw(IN accountID INT,IN amount DECIMAL(10,2))
BEGIN
  INSERT INTO transactions (accountId, transactionType, transactionAmount)
  VALUES (accountID, "withdraw", amount);
  
  UPDATE accounts SET balance = balance - amount WHERE accountId = accountID;
END//
DELIMITER ;


