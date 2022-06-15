
--- CREATE TABLES ---
CREATE TABLE Trade(
	TradeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ValueTrade FLOAT, 
	ClientSector VARCHAR(100))
GO
 

CREATE TABLE Risk(
	RiskID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	RiskName VARCHAR(100))
GO



CREATE TABLE TradeCategorie(
	TradeCategorieID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	RiskPK int NOT NULL,
	TradePK int NOT NULL,

	CONSTRAINT FK_TradeCategorie_TradePK FOREIGN KEY (TradePK)     
    REFERENCES dbo.Trade (TradeID),

	CONSTRAINT FK_TradeCategorie_RiskPK FOREIGN KEY (RiskPK)     
    REFERENCES dbo.Risk (RiskID)     
    ON DELETE NO ACTION    
    ON UPDATE NO ACTION


);
GO
 



 --- PROCEDURE TO POPULATE TABLE TRADE ---

CREATE PROCEDURE PopulateTables
AS
BEGIN
 
INSERT INTO Trade (ValueTrade, ClientSector)
VALUES 
  (2000000,'Private'),
  (400000,'Public'),
  (500000,'Public'),
  (3000000,'Public');


INSERT INTO Risk (RiskName)
VALUES 
  ('LOWRISK'),
  ('MEDIUMRISK'),
  ('HIGHRISK');

END

GO




--- PROCEDURE TO CALSSIFY THE TRADES ---

CREATE PROCEDURE ClassifyTrade
AS
BEGIN
	
	INSERT INTO TradeCategorie 
	SELECT (SELECT RiskID FROM Risk WHERE RiskName='LOWRISK'), 
		   TradeID
	FROM   Trade 
	WHERE  ValueTrade < 1000000 AND ClientSector = 'Public';

	INSERT INTO TradeCategorie 
	SELECT (SELECT RiskID FROM Risk WHERE RiskName='MEDIUMRISK'), 
		   TradeID
	FROM   Trade 
	WHERE  ValueTrade > 1000000 AND ClientSector = 'Public';

	INSERT INTO TradeCategorie 
	SELECT (SELECT RiskID FROM Risk WHERE RiskName='HIGHRISK'), 
		   TradeID
	FROM   Trade 
	WHERE  ValueTrade > 1000000 AND ClientSector = 'Private';

END

GO


--- PROCEDURE TO SHOW THE TRADES CLASSIFIED ---

CREATE PROCEDURE ShowTrade
AS
BEGIN

	SELECT RiskName
	FROM TradeCategorie
	INNER JOIN Risk
	ON TradeCategorie.RiskPK = Risk.RiskID
	INNER JOIN Trade
	ON TradeCategorie.TradePK = Trade.TradeID
	ORDER BY TradeCategorie.TradePK

END

GO






