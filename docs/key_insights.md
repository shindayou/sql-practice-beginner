# Key Insights

This document summarizes the most important findings from the SQL analysis performed on the Titanic dataset.  
These insights reflect patterns in survival, demographics, socioeconomic status, and family structure.

---

## 1. Passenger Class Strongly Influenced Survival
Survival rates varied dramatically by class:

- **1st class** passengers had the highest survival rates.
- **3rd class** passengers had the lowest survival rates.
- Class acted as a proxy for cabin location, wealth, and evacuation priority.

**Interpretation:**  
Socioeconomic status played a major role in survival outcomes.

---

## 2. Gender Was a Major Determinant of Survival
Female passengers had significantly higher survival rates than males.

**Interpretation:**  
Evacuation procedures prioritized women and children, aligning with historical accounts.

---

## 3. Family Size Affected Survival Probability
Analysis of siblings/spouses, parents/children, and derived family size revealed:

- **Small families (1–3 people)** had the best survival outcomes.
- **Large families (6+ people)** had extremely low survival rates.
- Solo travelers had mixed outcomes depending on class and gender.

**Interpretation:**  
Family dynamics influenced evacuation behavior and survival chances.

---

## 4. Age Played a Meaningful Role in Survival
Age‑based analysis showed:

- **Children** had moderate survival rates.
- **Adults** had lower survival rates.
- **Seniors** had the lowest survival rates.

**Interpretation:**  
Mobility, physical ability, and evacuation priority likely contributed to these patterns.

---

## 5. Fare Distribution Was Highly Skewed
Window function analysis revealed:

- A small number of passengers paid extremely high fares.
- Most passengers paid relatively low fares.
- Fare percentile ranking highlighted clear economic stratification.

**Interpretation:**  
Wealthier passengers had better cabins and better access to lifeboats.

---

## 6. Embarkation Port Correlated With Survival
Passengers who boarded at different ports showed different survival patterns.

**Interpretation:**  
Embarkation port often reflects socioeconomic background and cabin assignment.

---

## 7. Missing Data Impacts Certain Analyses
A notable portion of passengers had missing age values.

**Interpretation:**  
Age‑based insights should be interpreted with caution, as missing data may skew results.

---

## 8. CTEs and Window Functions Provided Deeper Analytical Clarity
Using intermediate SQL techniques allowed for:

- Cleaner logic separation  
- More readable analysis  
- Better understanding of distribution patterns  

**Interpretation:**  
These techniques mirror real‑world analytics workflows and demonstrate SQL proficiency.

---

# Summary

The Titanic dataset reveals clear patterns in survival based on:

- Class  
- Gender  
- Age  
- Family size  
- Fare  
- Embarkation port  

This project demonstrates the ability to:

- Build and query a relational database  
- Apply both foundational and intermediate SQL techniques  
- Extract meaningful insights from structured data  
- Document analytical reasoning clearly and professionally  

For detailed query explanations, see `sql_analysis_breakdown.md`.
