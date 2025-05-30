CREATE TABLE Farmers (
    FarmerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Age INT,
    FarmSize DECIMAL(10, 2),
    Address VARCHAR(255)
);

CREATE TABLE Crops (
    CropID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE NOT NULL, 
    Type VARCHAR(50),
    PlantingSeason VARCHAR(50),
    HarvestingSeason VARCHAR(50),
    ExpectedYield DECIMAL(10, 2)
);

CREATE TABLE LandDetails (
    LandID INT PRIMARY KEY,
    FarmerID INT,
    CropID INT,
    SoilType VARCHAR(50),
    CultivatedLand DECIMAL(10, 2),
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID),
    FOREIGN KEY (CropID) REFERENCES Crops(CropID)
);

CREATE TABLE FarmingActivities (
    ActivityID INT PRIMARY KEY,
    FarmerID INT,
    ActivityType VARCHAR(50),
    Description TEXT,
    Date DATE,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);

CREATE TABLE Harvest (
    FarmerID INT,
    LandID INT,
    Quantity DECIMAL(10, 2),
    Date DATE,
    Notes TEXT,
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID),
    FOREIGN KEY (LandID) REFERENCES LandDetails(LandID)
);

CREATE TABLE MarketSales (
    SaleID INT PRIMARY KEY,
    CropID INT,
    FarmerID INT,
    Date DATE,
    QuantitySold DECIMAL(10, 2),
    PricePerUnit DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    FinancialStatus VARCHAR(20),
    FOREIGN KEY (CropID) REFERENCES Crops(CropID),
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);


INSERT INTO Farmers (FarmerID, Name, Phone, Age, FarmSize, Address)
VALUES (1, 'John Doe', '123-456-7890', 42, 10.5, '123 Main St'),
   	(2, 'Jane Smith', '555-123-4567', 38, 5.2, '456 Elm St'),
   	(3, 'Michael Lee', '987-654-3210', 28, 2.8, '789 Oak St'),
   	(4, 'Sarah Garcia', '456-789-0123', 55, 15.0, '1011 Maple Ave'),
   	(5, 'David Hernandez', '876-543-2109', 35, 8.7, '1213 Pine Blvd'),
   	(6, 'Emily Jones', '234-567-8901', 62, 7.1, '1415 Spruce Ln'),
   	(7, 'William Brown', '789-012-3456', 48, 12.3, '1617 Birch Rd'),
   	(8, 'Ashley Miller', '345-678-9012', 25, 4.5, '1819 Poplar Way'),
   	(9, 'Daniel Davis', '901-234-5678', 32, 6.8, '2021 Willow Dr'),
   	(10, 'Jennifer Garcia', '678-901-2345', 50, 9.2, '2223 Elm St');

INSERT INTO Crops (CropID, Name, Type, PlantingSeason, HarvestingSeason, ExpectedYield)
VALUES (1, 'Wheat', 'Grain', 'Fall', 'Summer', 5.2),
   	(2, 'Corn', 'Grain', 'Spring', 'Fall', 7.8),
   	(3, 'Soybeans', 'Legume', 'Spring', 'Fall', 3.5),
   	(4, 'Tomatoes', 'Vegetable', 'Spring', 'Summer', 12.0),
   	(5, 'Lettuce', 'Vegetable', 'Spring/Fall', 'Spring/Fall', 8.5),
   	(6, 'Potatoes', 'Vegetable', 'Spring', 'Fall', 10.2),
   	(7, 'Apples', 'Fruit', 'Spring', 'Fall', 15.0),
   	(8, 'Oranges', 'Fruit', 'Winter', 'Spring', 8.7),
   	(9, 'Strawberries', 'Fruit', 'Spring', 'Summer', 6.1),
   	(10, 'Grapes', 'Fruit', 'Spring', 'Fall', 9.9);

INSERT INTO LandDetails (LandID, FarmerID, CropID, SoilType, CultivatedLand)
VALUES (1, 1, 1, 'Loam', 2.5),
   	(2, 2, 2, 'Sandy Loam', 1.8),
   	(3, 3, 3, 'Clay Loam', 0.9),
   	(4, 4, 4, 'Silty Clay', 4.2),
   	(5, 5, 5, 'Peat', 1.5),
   	(6, 1, 6, 'Loamy Sand', 3.1),     
	(7, 2, 7, 'Sandy Clay Loam', 2.7),
   	(8, 3, 8, 'Silty Clay Loam', 1.3),
   	(9, 4, 1,  'Loam', 2.5),
   	(10, 5, 9, 'Clay', 0.8);
 
INSERT INTO FarmingActivities (ActivityID, FarmerID, ActivityType, Description, Date, Cost)
VALUES (1, 1, 'Plowing', 'Preparation for wheat planting', '2024-03-15', 85.00),
   	(2, 2, 'Planting', 'Planting corn seeds', '2024-04-10', 42.50),
   	(3, 3, 'Irrigation', 'Watering soybean crops', '2024-04-05', 37.00),
   	(4, 4, 'Fertilizing', 'Applying fertilizer to tomato plants', '2024-03-20', 68.75),
   	(5, 5, 'Weeding', 'Removing weeds from lettuce beds', '2024-04-12', 25.25),
   	(6, 1, 'Pest control', 'Spraying potato plants for insects', '2024-04-08', 51.00),  
   	(7, 2, 'Harvesting', 'Picking apples from orchard', '2023-10-12', 120.50),
   	(8, 3, 'Harvesting', 'Collecting oranges from trees', '2024-02-18', 98.25),
   	(9, 4, 'Irrigation', 'Watering strawberry plants', '2024-04-02', 22.00),
   	(10, 1, 'Fertilizing', 'Applying fertilizer to wheat crop', '2024-03-25',   59.95);  
 
INSERT INTO Harvest (FarmerID, LandID, Quantity, Date, Notes)
VALUES (1, 1, 4.8, '2024-07-10', 'Good yield, minimal crop loss'),
   	(2, 2, 6.2, '2024-10-05', 'Higher than expected yield'),
   	(3, 3, 2.1, '2024-09-18', 'Lower yield due to dry weather'),
   	(4, 4, 10.5, '2024-08-22', 'Excellent harvest, healthy tomato plants'),
   	(5, 5, 7.8, '2024-05-15', 'Successful first harvest of lettuce'),
   	(6, 1, 2.8, '2024-06-01', 'Lower quantity due to pest damage'),
   	(7, 2, 12.5, '2023-10-20', 'Excellent harvest, large apples'),
   	(8, 3, 7.1, '2024-02-25', 'Average harvest'),
   	(9, 4, 4.8, '2024-04-10', 'Early harvest, smaller strawberries'),
   	(10, 5, 6.5, '2024-05-20', 'Second harvest of lettuce, good yield'); 
 
 
 
INSERT INTO MarketSales (SaleID, CropID, FarmerID, Date, QuantitySold, PricePerUnit, TotalPrice, FinancialStatus)
VALUES (1, 1, 1, '2024-07-15', 3.8, 12.50, 47.50, 'profit'),
   	(2, 2, 2, '2024-10-10', 5.5, 11.75, 65.13, 'profit'),
   	(3, 3, 3, '2024-09-20', 1.8, 10.25, 18.45, 'loss'),
    (4, 4, 4, '2024-08-25', 8.2, 14.00, 114.80, 'profit'), 
   	(5, 5, 5, '2024-05-20', 6.5, 8.50, 55.25, 'profit'),
   	(6, 6, 1, '2024-06-01', 2.0, 9.25, 18.50, 'loss'), 
   	(7, 7, 2, '2023-10-20', 10.5, 15.75, 165.38, 'profit'),
   	(8, 8, 3, '2024-02-25', 5.8, 13.50, 78.30, 'profit'),
   	(9, 9, 4, '2024-04-15', 3.2, 11.00, 35.20, 'loss'), 
   	(10, 1, 5, '2024-08-01', 1.0, 12.50, 12.50, 'loss');  


-- 1)       Sub Quries:
-- Query 1: Retrieve the names of farmers who have a FarmSize greater than the average FarmSize.
SELECT Name
FROM Farmers
WHERE FarmSize > (SELECT AVG(FarmSize) FROM Farmers);


-- Query 2: Retrieve the total cost of all farming activities for a specific farmer.
SELECT FarmerID, SUM(Cost) AS TotalCost
FROM FarmingActivities
WHERE FarmerID = 1
GROUP BY FarmerID;


-- 2)	Aggregate Functions:
-- Query 1: Calculate the total cultivated land area for each farmer.
 
SELECT FarmerID, SUM(CultivatedLand) AS TotalCultivatedLand
FROM LandDetails
GROUP BY FarmerID;

-- Query 2: Calculate the average ExpectedYield for all crops.
 
SELECT AVG(ExpectedYield) AS AverageExpectedYield
FROM Crops;

-- 3)     Joins:
-- Query 1: Retrieve the total quantity of harvest and the corresponding crop names for each farmer.
-- SELECT F.Name, H.Quantity, C.Name AS CropName
-- FROM Farmers F
-- JOIN Harvest H ON F.FarmerID = H.FarmerID
-- JOIN Crops C ON H.CropID = C.CropID;

-- Query 2: Retrieve the total sales amount for each farmer by joining MarketSales and Crops tables.
 
SELECT F.Name, SUM(MS.QuantitySold * MS.PricePerUnit) AS TotalSalesAmount
FROM Farmers F
JOIN MarketSales MS ON F.FarmerID = MS.FarmerID
JOIN Crops C ON MS.CropID = C.CropID
GROUP BY F.Name;


--       VIEWS:
-- 1)    Farmer View:
CREATE VIEW FarmersView AS
SELECT FarmerID AS "ID", Name AS "Name", Phone AS "Phone Number", FarmSize AS "Farm Size", Address AS "Address"
FROM Farmers;

-- 2)    Crops View:
CREATE VIEW CropsView AS
SELECT CropID, Name, Type, PlantingSeason, HarvestingSeason, ExpectedYield
FROM Crops;

-- 3)    LandDetails View:
CREATE VIEW LandDetailsView AS
SELECT 
    ld.LandID,
    f.Name AS FarmerName,
    c.Name AS CropName,
    ld.SoilType,
    ld.CultivatedLand
FROM LandDetails ld
INNER JOIN Farmers f ON ld.FarmerID = f.FarmerID
INNER JOIN Crops c ON ld.CropID = c.CropID;



-- 4)   FarmingActivities View:
CREATE VIEW FarmingActivitiesView AS
SELECT ActivityID, f.Name AS FarmerName, ActivityType, Description, DATE_FORMAT(Date, '%Y-%m-%d') AS Date, Cost
FROM FarmingActivities fa
INNER JOIN Farmers f ON fa.FarmerID = f.FarmerID;


-- 5)    Harvest View:
CREATE VIEW HarvestView AS
SELECT h.FarmerID, ld.LandID, f.Name AS FarmerName, c.Name AS CropName, Quantity, DATE_FORMAT(h.Date, '%Y-%m-%d') AS Date, Notes
FROM Harvest h
INNER JOIN LandDetails ld ON h.LandID = ld.LandID
INNER JOIN Farmers f ON h.FarmerID = f.FarmerID
INNER JOIN Crops c ON ld.CropID = c.CropID;

-- 6)    MarketSales View:
CREATE VIEW MarketSalesView AS
SELECT ms.SaleID, c.Name AS CropName, f.Name AS FarmerName, DATE_FORMAT(ms.Date, '%Y-%m-%d') AS Date, QuantitySold, PricePerUnit
FROM MarketSales ms
INNER JOIN Crops c ON ms.CropID = c.CropID
INNER JOIN Farmers f ON ms.FarmerID = f.FarmerID;
