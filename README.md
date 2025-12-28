Titanic SQL Analysis Project
![status](https://img.shields.io/badge/Status-Completed-brightgreen)

Overview
This project analyzes the Titanic passenger dataset using SQL, progressing from beginner concepts to intermediate analytical techniques. It demonstrates skills in data cleaning, database setup, querying, aggregations, window functions, and CTE‑based analysis.
A full breakdown of the project is available in the /docs folder.

Tools Used
- SQLite
- Python (for ETL)
- DB Browser for SQLite / Azure Data Studio
- Git & GitHub

Folder Structure
SQL-PRACTICE-BEGINNER/
- data/
-    -cleaned_titanic.csv
- scripts/
-    -load_data.py
- sql
-    -create_table.sql
-    -analysis_queries.sql
- docs/
- README.md


How to Run the Project
1. Load the dataset
python scripts/load_data.py


2. Run SQL scripts
- sql/create_table.sql
- sql/load_data.sql
- sql/analysis_queries.sql
3. Explore the database
Open titanic.db in DB Browser for SQLite or Azure Data Studio.

Key Features
- Cleaned and standardized Titanic dataset
- SQL table creation and loading
- Exploratory analysis
- Aggregations and grouping
- Multi‑condition filtering
- Window functions (RANK, PERCENT_RANK)
- CTE‑based analysis

Key Insights (High‑Level)
- Smaller families had higher survival rates
- 1st‑class females over 40 had strong survival outcomes
- 3rd‑class males under 18 had low survival rates
- Fare distribution is heavily skewed
- Missing age values impact demographic analysis
Full insights are documented in /docs/08_key_insights.md.

Next Steps
- Add visualizations (Python or Power BI)
- Add advanced SQL (LAG, LEAD, NTILE)
- Build a dashboard summarizing survival patterns
- Add a Jupyter Notebook for combined SQL + Python analysis

Documentation
Full project breakdown is available in the /docs folder.
