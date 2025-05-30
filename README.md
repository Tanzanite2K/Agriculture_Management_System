# Agriculture_Management_System
This project is a comprehensive Farmers Crop Management System designed to help manage and analyze agricultural data effectively. It provides a structured database schema to store information about farmers, crops, land details, farming activities, harvests, and market sales.The system supports tracking of farming activities, yield, and financial transactions, enabling farmers and stakeholders to make informed decisions to optimize crop production and sales.

**Key features include:**
  - Detailed records of farmers and their farms
  - Crop management with planting and harvesting seasons
  - Monitoring of land usage and soil types
  - Logging farming activities with costs and dates
  - Tracking harvest quantities and market sales
  - Useful views for summarizing and analyzing data
  - Sample queries demonstrating aggregate functions, joins, and subqueries

This project is ideal for agricultural data management, farm analytics, and decision support for farmers and agribusiness professionals.

# Sample Queries & Outputs
**Query #1**

    -- 1. Get names of farmers with farm size greater than average
    SELECT Name FROM Farmers WHERE FarmSize > (SELECT AVG(FarmSize) FROM Farmers);
| Name            |
| --------------- |
| John Doe        |
| Sarah Garcia    |
| David Hernandez |
| William Brown   |
| Jennifer Garcia |
**Query #2**

    -- 2. Total cost of farming activities for FarmerID 1
    SELECT FarmerID, SUM(Cost) AS TotalCost FROM FarmingActivities WHERE FarmerID = 1 GROUP BY FarmerID;
| FarmerID | TotalCost |
| -------- | --------- |
| 1        | 195.95    |
**Query #3**

    -- 3. Total cultivated land for each farmer
    SELECT FarmerID, SUM(CultivatedLand) AS TotalCultivatedLand FROM LandDetails GROUP BY FarmerID;

| FarmerID | TotalCultivatedLand |
| -------- | ------------------- |
| 1        | 5.60                |
| 2        | 4.50                |
| 3        | 2.20                |
| 4        | 6.70                |
| 5        | 2.30                |
**Query #4**

    -- 4. Average expected yield of all crops
    SELECT AVG(ExpectedYield) AS AverageExpectedYield FROM Crops;
| AverageExpectedYield |
| -------------------- |
| 8.690000             |
**Query #5**

    -- 5. Total harvest quantity per farmer with crop names
    SELECT f.Name, SUM(h.Quantity) AS TotalHarvest, c.Name AS CropName
    FROM Farmers f
    JOIN Harvest h ON f.FarmerID = h.FarmerID
    JOIN Crops c ON h.LandID = (SELECT LandID FROM LandDetails WHERE CropID = c.CropID LIMIT 1)
    GROUP BY f.Name, c.Name;
| Name            | TotalHarvest | CropName |
| --------------- | ------------ | -------- |
| Ashley Miller   | 7.10         | Soybeans |
| Daniel Davis    | 4.80         | Tomatoes |
| David Hernandez | 7.80         | Lettuce  |
| Emily Jones     | 2.80         | Wheat    |
| Jane Smith      | 6.20         | Corn     |
| Jennifer Garcia | 6.50         | Lettuce  |
| John Doe        | 4.80         | Wheat    |
| Michael Lee     | 2.10         | Soybeans |
| Sarah Garcia    | 10.50        | Tomatoes |
| William Brown   | 12.50        | Corn     |
**Query #6**

    -- 6. Total sales amount for each farmer
    SELECT f.Name, SUM(ms.QuantitySold * ms.PricePerUnit) AS TotalSalesAmount
    FROM Farmers f
    JOIN MarketSales ms ON f.FarmerID = ms.FarmerID
    GROUP BY f.Name;
| Name            | TotalSalesAmount |
| --------------- | ---------------- |
| David Hernandez | 67.7500          |
| Jane Smith      | 230.0000         |
| John Doe        | 66.0000          |
| Michael Lee     | 96.7500          |
| Sarah Garcia    | 150.0000         |

