# Database Setup

This document explains how the SQLite database was created, how the cleaned Titanic dataset was loaded, and how the SQL environment for this project is structured.

---

## Overview
This project uses a **pre‑cleaned Titanic dataset**, allowing the focus to remain on SQL analysis rather than data preparation.  
The database setup consists of:

- Creating a SQLite database  
- Defining the table schema  
- Loading the cleaned CSV into the database using Python and SQL  
- Verifying the data load  

---

## Dataset Used

The dataset used in this project is:
/data/cleaned_titanic.csv


This dataset was cleaned prior to the start of the project. The following transformations had already been applied:

- Dropped the `Cabin` column (mostly NULL)
- Renamed columns for clarity:
  - `SibSp` → `Siblings_Spouses`
  - `Parch` → `Parents_Children`
  - `Pclass` → `Passenger_Class`
- Standardized column names to snake_case
- Ensured numeric types for `Age`, `Fare`, and `Survived`

Because the dataset was already cleaned, this project focuses entirely on SQL analysis and database operations.

---

## Database File

Running the ETL script generates the SQLite database:
titanic.db


This file contains a single table:
titanic


---

## Table Schema

The schema is defined in:
/sql/create_table.sql


### Schema Fields

| Column              | Type    | Description                                 |
|---------------------|---------|---------------------------------------------|
| Passenger_Id        | INTEGER | Unique identifier                           |
| Survived            | INTEGER | 0 = No, 1 = Yes                             |
| Passenger_Class     | INTEGER | Ticket class (1, 2, or 3)                   |
| Name                | TEXT    | Passenger name                              |
| Sex                 | TEXT    | Male or Female                              |
| Age                 | REAL    | Passenger age                               |
| Siblings_Spouses    | INTEGER | Number of siblings/spouses aboard           |
| Parents_Children    | INTEGER | Number of parents/children aboard           |
| Fare                | REAL    | Ticket fare                                 |
| Embarked            | TEXT    | Port of embarkation (C, Q, S)               |

This schema mirrors the cleaned dataset exactly.

---

## Data Loading

Data is loaded into the database using:

- `sql/load_data.sql`  
- `scripts/load_data.py` (Python ETL script)

### Python ETL Workflow

The ETL script performs the following steps:

1. Reads `cleaned_titanic.csv`
2. Connects to `titanic.db`
3. Creates the table if it does not already exist
4. Inserts all rows from the CSV into the database

Run the script with:
/scripts/load_data.py


This ensures the database is reproducible and can be rebuilt at any time.

---

## Verifying the Load

After running the ETL script, you can verify the data load with:

```sql
SELECT COUNT(*) FROM titanic;

-- You should see the expected number of rows from the cleaned dataset.
