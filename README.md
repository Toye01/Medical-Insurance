# 🩺 Medical Insurance Data Analysis — PostgreSQL Project

## 📘 Overview
This project demonstrates end-to-end data analysis using **PostgreSQL**, focusing on medical insurance data.  
The objective was to derive meaningful insights into **demographics, income, health risks, and medical activity patterns** using advanced SQL techniques such as aggregations, conditional logic, and window functions.

---

## 🧠 Core Achievements

### 🔹 Data Extraction and Cleaning
- Queried and filtered data by **region**, **age**, **gender**, and **education level** to explore demographic distributions.  
- Identified and isolated critical subsets such as **patients aged 65+** and **those categorized as high-risk**.  
- Extracted the **top 5 income earners** and analyzed income distribution across different demographics.

### 🔹 Analytical Query Development
- Computed **average income**, **average age**, and **risk percentages** using `AVG()`, `SUM()`, and `COUNT()` aggregate functions.  
- Grouped and ordered results with `GROUP BY` and `ORDER BY` to summarize insights per **region**, **education**, and **urban/rural classification**.  
- Applied conditional aggregation using `CASE WHEN` expressions to measure the **percentage of high-risk patients** across locations.

### 🔹 Advanced SQL Implementation
- Leveraged **window functions** (`RANK() OVER (PARTITION BY ... ORDER BY ...)`) to rank patients by income within their education group, providing intra-group comparison insights.  
- Created a **dynamic view (`high_risk_patients`)** that automatically filters individuals with chronic diseases or marked as high risk — enabling reusability and faster reporting.  
- Implemented calculated metrics to identify the **top three regions** with the highest average number of medical procedures.

### 🔹 Business and Health Insights
- Determined which demographic groups had the **highest average income** among high-risk individuals.  
- Compared **risk ratios by gender**, highlighting disparities in health vulnerability.  
- Summarized **regional performance metrics**, supporting data-driven decision-making for resource allocation.

---

## ⚙️ Technical Skills Demonstrated
- **SQL (PostgreSQL 17+)** — Data querying, joins, window functions, conditional logic, and view creation  
- **Database Management** — Schema design, indexing awareness, and structured query optimization  
- **Analytical Thinking** — Translating health and demographic data into quantifiable insights  
- **Data Reporting** — Creating reusable SQL views for recurring business intelligence tasks  

---

## 📊 Outcome
This project showcases the ability to:
- Perform complex, production-level SQL analysis,  
- Transform raw medical data into actionable insights,  
- Use advanced SQL features like **window functions** and **views** to improve data accessibility,  
- And apply **analytical reasoning** to real-world healthcare and insurance datasets.

---

### 👨‍💻 Author
**Ebenezer Akintoye Akinniyi**  
*Data Analyst | SQL | Python | Power BI | Machine Learning*
