# BigquerySQL_demo
**BigQuery SQL Analytics Portfolio**

This repository contains a collection of SQL analytics projects built on Google BigQuery, focusing on data cleaning, transformation, and analytical reporting using realistic business datasets.
The project demonstrates strong SQL fundamentals, advanced BigQuery features, and clear analytical thinking suitable for Data Analyst / Analytics Engineer roles.

**Repository Structure**
.
├── database
│   ├── K308
│   │   ├── game_profile.csv
│   │   ├── user_event.csv
│   │   ├── user_profile.csv
│   │   └── Table Explanation.docx
│   │
│   └── mydatabase
│       ├── Ex_19.csv
│       └── sales_tab.csv
│
├── result
│   ├── clean_rev_cost_transaction
│   │   ├── 20251127_Clean_rev_cost_transaction_result.csv
│   │   └── 20251127_Clean_rev_cost_transaction_result.png
│   │
│   ├── final_test
│   │   ├── final_test_result_1.csv
│   │   ├── final_test_result_2.csv
│   │   ├── final_test_result_3.csv
│   │   ├── final_test_result_4.csv
│   │   ├── final_test_result_5.csv
│   │   ├── final_test_result_6.csv
│   │   ├── final_test_result_7.csv
│   │   ├── final_test_result_8.csv
│   │   ├── final_test_result_9.csv
│   │   └── final_test_result_10.csv
│   │
│   └── staff_performance
│       ├── 20251128_staff_performance_result_1.csv
│       ├── 20251128_staff_performance_result_1.png
│       ├── 20251128_staff_performance_result_2.csv
│       └── 20251128_staff_performance_result_2.png

**Dataset Overview**

***K308 Dataset (Game Analytics)***
Located in database/K308/
	•	user_profile.csv
User demographic information (user_id, country, date_of_birth, joined_date)
	•	user_event.csv
Event-level activity log (login, play_start, play_end, purchase, etc.)
	•	game_profile.csv
Game metadata (game_id, game_title, platform, version)
	•	Table Explanation.docx
Detailed explanation of table schema and relationships

***Practice Dataset***

Located in database/mydatabase/
	•	sales_tab.csv
Sales transaction data for revenue analysis
	•	Ex_19.csv
Task-based staff performance dataset (used for window function and cumulative logic exercises)

**Key Analytical Projects**

1️⃣ Revenue & Cost Cleaning and Transformation

📂 result/clean_rev_cost_transaction/

*Goal*
	•	Standardize revenue and cost data
	•	Combine income and expenses into a unified reporting table
	•	Allocate combo revenue proportionally to atomic items

*Techniques*
	•	CTEs
	•	UNNEST
	•	Conditional aggregation
	•	Date formatting
	•	Window functions

*Outputs*
	•	Clean monthly revenue & cost table (CSV + visualization)

⸻

2️⃣ Staff Performance & Behavioral Analysis

📂 result/staff_performance/

*Goal*
	•	Analyze staff task sequences
	•	Detect late-task patterns
	•	Track cumulative behavior and performance thresholds

*Techniques*
	•	ROW_NUMBER()
	•	DENSE_RANK()
	•	Cumulative SUM() OVER
	•	Conditional logic

*Outputs*
	•	Performance result tables
	•	Visual snapshots of query results

⸻

3️⃣ Advanced SQL Practice & Business Analytics

📂 result/final_test/

Includes
	•	Retention & churn analysis
	•	Active user definition
	•	Cohort-based analysis
	•	Ranking & Top-N problems
	•	Time-based window logic

Outputs
	•	Multiple CSV result files corresponding to different analytical questions

**Skills Demonstrated**
	•	Advanced SQL
	•	CTEs
	•	Window functions
	•	Conditional aggregation
	•	Ranking & cumulative logic
	•	BigQuery
	•	Nested data handling
	•	UNNEST
	•	Time & date functions
	•	Analytics-ready query design
	•	Analytics Thinking
	•	Business-oriented metrics
	•	Clean, explainable logic
	•	Reproducible results

⸻

**How to Use**
	1.	Upload datasets in database/ to BigQuery
	2.	Run corresponding SQL queries
	3.	Compare query outputs with CSV files in result/
	4.	Review .png files for visual confirmation
