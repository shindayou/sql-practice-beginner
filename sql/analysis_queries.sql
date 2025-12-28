-- Core Survival Analysis
-- Overall survival rate
SELECT AVG(Survived) AS survival_rate FROM titanic;

-- Survival by passenger class
SELECT Passenger_Class, AVG(Survived) AS survival_rate
FROM titanic
GROUP BY Passenger_Class

-- Average age of survivors vs non-survivors
SELECT Survived, AVG(Age) AS avg_age
FROM titanic
GROUP BY Survived;

-- Gender survival comparison
SELECT Sex, AVG(Survived) AS survival_rate
FROM titanic
GROUP BY Sex;

-- Embarkation port breakdown
SELECT Embarked, COUNT(*) AS count
FROM titanic
GROUP BY Embarked;

-- Survival rate by class and gender
SELECT Passenger_Class, Sex, AVG(Survived) AS survival_rate
FROM titanic
Group BY Passenger_Class, Sex;

-- Survival rate for women in 3rd class
SELECT AVG(Survived) AS survival_rate
FROM titanic
WHERE Sex = 'female'
AND Passenger_CLass = 3;

-- Survival rate for men in 1st class
SELECT AVG(Survived) AS survival_rate
FROM titanic
WHERE Sex = 'male'
AND Passenger_Class = 1;

-- Survival rate for passengers under 18
SELECT AVG(Survived) AS survival_rate
FROM titanic
WHERE Age < 18;

-- Survival rate by family size (derived column)
SELECT 
    (Siblings_Spouses + Parents_Children + 1) AS family_size,
    AVG(Survived) AS survival_rate
FROM titanic
GROUP BY family_size
ORDER BY family_size;

-- Fare & Ticket Analysis
-- Average fare by passenger class
SELECT Passenger_Class, AVG(Fare) AS avg_fare
FROM titanic
GROUP BY Passenger_Class;

-- Average fare by survival status
SELECT Survived, AVG(Fare) AS avg_fare
FROM titanic
GROUP BY Survived;

-- top 10 highest fares
SELECT PassengerId, Fare
FROM titanic
ORDER BY Fare DESC
LIMIT 10;

-- Fare distribution by class (min, max, avg)
SELECT 
    Passenger_Class, 
    MIN(Fare) AS min_fare, 
    MAX(Fare) AS max_fare, 
    AVG(Fare) AS avg_fare
FROM titanic
GROUP BY Passenger_Class
ORDER BY Passenger_Class;

-- Median fare (using window functions or subqueries)
SELECT AVG(Fare) AS median_fare
FROM (
    SELECT Fare
    FROM titanic
    ORDER BY Fare
    LIMIT 2 - (SELECT COUNT(*) FROM titanic) % 2
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM titanic)
);

-- Age-Based Analysis
-- Average age by passenger class
SELECT Passenger_Class, AVG(Age) AS avg_age
FROM titanic
GROUP BY Passenger_Class;

-- Average age by gender
SELECT 
    Sex,
    AVG(Age) AS avg_age
FROM titanic
GROUP BY Sex;

-- Age distribution buckets (child < 12, teen 12-17, adult 18-49, senior 50+)
SELECT
    CASE
        WHEN Age < 12 THEN 'child'
        WHEN Age BETWEEN 12 AND 17 THEN 'teen'
        WHEN Age BETWEEN 18 AND 49 THEN 'adult'
        WHEN Age >= 50 THEN 'senior'
    END AS age_bucket,
    COUNT(*) AS count
FROM titanic
GROUP BY age_bucket;

--Survival rate by age bucket
SELECT
    CASE
        WHEN Age < 12 THEN 'child'
        WHEN Age BETWEEN 12 AND 17 THEN 'teen'
        WHEN Age BETWEEN 18 AND 49 THEN 'adult'
        WHEN Age >= 50 THEN 'senior'
    END AS age_bucket,
    AVG(Survived) AS survival_rate
FROM titanic
GROUP BY age_bucket;

-- Family Structure Analysis
-- Survival rate by number of siblings/spouses aboard
SELECT Siblings_Spouses, AVG(Survived) AS survival_rate
FROM titanic
GROUP BY Siblings_Spouses;

-- Survival rate by number of parents/children aboard
SELECT 
    Parents_Children, 
    AVG(Survived) AS survival_rate
FROM titanic
GROUP BY Parents_Children;

-- Create family_size = SibSp + Parch + 1
SELECT
    Siblings_Spouses + Parents_Children + 1 AS family_size
FROM titanic;

-- Survival rate by family size
SELECT
    Siblings_Spouses + Parents_Children + 1 AS family_size,
    AVG(Survived) AS survival_rate
FROM titanic
GROUP BY family_size;

-- Most common family sizes on board
SELECT
    Siblings_Spouses + Parents_Children + 1 AS family_size,
    COUNT(*) AS count
FROM titanic
GROUP BY family_size
ORDER BY count DESC;

-- Multi-Condition Queries
-- Count of passengers who embarded at Southampton AND survived
SELECT COUNT(*) AS survived_southampton
FROM titanic
WHERE Embarked = 'S'
  AND Survived = 1;

-- Survival rate for 3rd-class males under 18
SELECT AVG(Survived) AS survival_rate
FROM titanic
WHERE Age < 18 
  AND Passenger_Class = 3
  AND Sex = 'male';

-- Survival rate for 1st-class females over age 40
SELECT AVG(Survived) AS survival_rate
FROM titanic
WHERE Age > 40 
  AND Passenger_Class = 1
  AND Sex = 'female';

-- Count of passengers with fare > 100
SELECT COUNT(*) AS count_fare_over_100
FROM titanic
WHERE Fare > 100;

-- Count of passengers with age missing (NULL)
SELECT COUNT(*) AS count_age_null
FROM titanic
WHERE Age IS NULL;

-- Data Quality & Null Checks
-- Count of NULL ages
SELECT COUNT(*) AS count_age_null
FROM titanic
WHERE Age IS NULL;

-- Count of NULL fares
SELECT COUNT(*) AS count_fare_null
FROM titanic
WHERE Fare IS NULL;

-- Count of NULL embarkation ports
SELECT COUNT(*) AS count_embarked_null
FROM titanic
WHERE Embarked IS NULL;

-- Percentage of rows with missing age
SELECT 
    (COUNT(*) * 1.0 / (SELECT COUNT(*) FROM titanic)) AS pct_age_missing
FROM titanic
WHERE Age IS NULL;

-- Additional Analysis
-- Window Function: rank passengers by fare
SELECT
    Passenger_Id,
    Fare,
    RANK() OVER (ORDER BY Fare DESC) AS fare_rank
FROM titanic;

-- Window Function: percent rank of fare
SELECT
    Passenger_Id,
    Fare,
    PERCENT_RANK() OVER (ORDER BY Fare) AS fare_percent_rank
FROM titanic;

-- CTE: calculate survival rate by class using a CTE
WITH class_rates AS (
    SELECT
        Passenger_Class,
        AVG(Survived) AS survival_rate
    FROM titanic
    GROUP BY Passenger_Class
)
SELECT *
FROM class_rates;

-- CTE: calculate age buckets and survival rates
WITH age_buckets AS (
    SELECT
        CASE
            WHEN Age < 12 THEN 'child'
            WHEN Age BETWEEN 12 AND 17 THEN 'teen'
            WHEN Age BETWEEN 18 AND 49 THEN 'adult'
            WHEN Age >= 50 THEN 'senior'
        END AS age_bucket,
        Survived
    FROM titanic
)
SELECT 
    age_bucket,
    AVG(Survived) AS survival_rate
FROM age_buckets
GROUP BY age_bucket;