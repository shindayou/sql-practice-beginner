# SQL Analysis Breakdown

This document explains the purpose, logic, and insights behind each major query used in the project.  
All SQL code referenced here is located in:
/sql/analysis_queries.sql


The breakdown below follows the **exact order** of the queries in that file.

---

# 1. Overall Survival Rate  
**Reference:** Query 1

### What it accomplishes  
Calculates the overall survival rate across the entire dataset.

### Why it matters  
This establishes a baseline for all other survival comparisons.

---

# 2. Survival Rate by Passenger Class  
**Reference:** Query 2

### What it accomplishes  
Computes survival rates for 1st, 2nd, and 3rd class passengers.

### Why it matters  
Passenger class is one of the strongest predictors of survival.

---

# 3. Average Age of Survivors vs. Non‑Survivors  
**Reference:** Query 3

### What it accomplishes  
Compares the average age of those who survived vs. those who did not.

### Why it matters  
Age influences mobility, evacuation priority, and survival likelihood.

---

# 4. Gender‑Based Survival Comparison  
**Reference:** Query 4

### What it accomplishes  
Calculates survival rates for males and females.

### Why it matters  
Gender was a major factor in evacuation priority (“women and children first”).

---

# 5. Survival Rate by Embarkation Port  
**Reference:** Query 5

### What it accomplishes  
Shows survival rates for passengers who boarded at Cherbourg, Queenstown, and Southampton.

### Why it matters  
Embarkation port correlates with socioeconomic status and cabin location.

---

# 6. Fare Statistics by Passenger Class  
**Reference:** Query 6

### What it accomplishes  
Calculates average fare per class.

### Why it matters  
Fare is a proxy for wealth and cabin quality.

---

# 7. Age Distribution Summary  
**Reference:** Query 7

### What it accomplishes  
Provides minimum, maximum, and average age.

### Why it matters  
Gives a demographic overview of the passengers.

---

# 8. Count of Missing Age Values  
**Reference:** Query 8

### What it accomplishes  
Counts how many passengers have no recorded age.

### Why it matters  
Missing age values affect age‑based analysis reliability.

---

# 9. Count of Missing Fare Values  
**Reference:** Query 9

### What it accomplishes  
Counts missing fare entries.

### Why it matters  
Fare is essential for class and wealth analysis.

---

# 10. Count of Missing Embarkation Values  
**Reference:** Query 10

### What it accomplishes  
Counts missing embarkation port values.

### Why it matters  
Embarkation port influences demographic patterns.

---

# 11. Percentage of Missing Age Values  
**Reference:** Query 11

### What it accomplishes  
Calculates the proportion of the dataset missing age values.

### Why it matters  
Helps determine whether age‑based insights are statistically reliable.

---

# 12. Survival Rate by Number of Siblings/Spouses  
**Reference:** Query 12

### What it accomplishes  
Analyzes survival rates based on the number of siblings/spouses aboard.

### Why it matters  
Family structure influences evacuation behavior and survival.

---

# 13. Survival Rate by Number of Parents/Children  
**Reference:** Query 13

### What it accomplishes  
Evaluates survival rates for passengers traveling with parents or children.

### Why it matters  
Family responsibilities can affect survival outcomes.

---

# 14. Derived Family Size Survival Rate  
**Reference:** Query 14

### What it accomplishes  
Creates a combined family size metric and calculates survival rates.

### Why it matters  
Total family size is more informative than individual family columns.

---

# 15. Survival Rate for 3rd‑Class Males Under 18  
**Reference:** Query 15

### What it accomplishes  
Analyzes a vulnerable demographic group.

### Why it matters  
This group historically had low survival priority.

---

# 16. Survival Rate for 1st‑Class Females Over 40  
**Reference:** Query 16

### What it accomplishes  
Analyzes a demographic with historically high survival priority.

### Why it matters  
Shows how class and gender intersect in survival outcomes.

---

# 17. Count of Survivors Who Embarked at Southampton  
**Reference:** Query 17

### What it accomplishes  
Counts survivors who boarded at the Southampton port.

### Why it matters  
Southampton was the primary boarding location; patterns here matter.

---

# 18. Count of Passengers with Fare > 100  
**Reference:** Query 18

### What it accomplishes  
Identifies high‑fare passengers.

### Why it matters  
High fare correlates with wealth and survival likelihood.

---

# 19. Rank Passengers by Fare (Window Function)  
**Reference:** Query 19

### What it accomplishes  
Ranks passengers from highest to lowest fare.

### Why it matters  
Highlights economic extremes and fare distribution.

---

# 20. Percent Rank of Fare (Window Function)  
**Reference:** Query 20

### What it accomplishes  
Shows each passenger’s percentile position in the fare distribution.

### Why it matters  
Reveals how skewed the fare distribution is.

---

# 21. Survival Rate by Class (CTE)  
**Reference:** Query 21

### What it accomplishes  
Uses a CTE to calculate survival rates by class in a clean, modular way.

### Why it matters  
Demonstrates intermediate SQL structuring techniques.

---

# 22. Age Buckets + Survival Rates (CTE)  
**Reference:** Query 22

### What it accomplishes  
Groups passengers into age buckets (child, teen, adult, senior) and calculates survival rates.

### Why it matters  
Age is a major factor in survival probability.

---

# Summary

This breakdown demonstrates:

- Clear analytical reasoning  
- Understanding of SQL fundamentals and intermediate concepts  
- Ability to structure queries for readability  
- Ability to extract meaningful insights from structured data  

For the full SQL code, see:
/sql/analysis_queries.sql
