# CategorizeBankTrades
## The Problem:
A bank has a portfolio of thousands of trades and they need to be categorized.
A trade is a commercial negotiation between a bank and a client.
Each trade has a value that indicates the transaction amount in dollars and a text indicating if the client´s sector is "Public" or "Private".
Currently, there are three categories rules:
LOWRISK: Trades with value less than 1,000,000 and client from Public Sector
MEDIUMRISK: Trades with value greater than 1,000,000 and client from Public Sector
HIGHRISK: Trades with value greater than 1,000,000 and client from Private Sector
And you need categorize each Trade in LOWRISK,MEDIUMRISK OR HIGHRISK.

## The Solutions:

### Solution1:
Solution 1 is in Question01.py, using python and OOP (Object Oriented Programming).
A class is created for each type of Risk, and it is verified which type of risk the Trade belongs to.
And finally, generating as a result a list with each Risk of the Trades.

### Solution2:
Solution 2 is in Question02.sql, using t-sql.
Three tables are created, one from type of risks, one from the trades, and one from the categories of trades (the result).
And finally are created three procedure calls, one from populate the tables risk and trades, one from classify the trades in your type of risk, and one to show the result.
