# RDAMP_LMS_Analytics_RCHG

Rychtenshane Community Housing Group (RCHG) is a social housing provider based in Chester. This project is geared towards creating RCHGs first Learning Management System (LMS), capable of centralizing learning efforts and utilizing data-driven insights to improve staff training, compliance, and performance outcomes.
# Structure of Project
```
RDAMP-LMS_Analytics_RCHG/
│
├── excel/
│   ├── Cleaned Employee Info Dataset_Group2.csv
│   ├── Cleaned LMS Dataset Group2.csv
│   ├── Course Details Group2.csv
│   ├── dim_completionstatus.xlsx
│   ├── dim_course.xlsx
│   ├── dim_employee.xlsx
│   ├── dim_feedback.xlsx
│   ├── dim_skill.xlsx
│   ├── dim_usage.xlsx
│   ├── fact_table.xlsx
│   └── lms_data.xlsx
│
├── Power BI Screenshots/
│   ├── Accessibility Overview.png
│   ├── Engagement Patterns.png
│   ├── Forecasting.png
│   ├── LMS_Dashboard.pbix
│   ├── Performance Analysis.png
│   ├── Performance Score Distribution Across Departments.png
│   ├── Training and Compliance Summary.png
│   └── Team Collaboration Summary
│
├── python/
│   └── Statistical Analysis.ipynb
│
├── sql/
│   ├── Schema.png
│   ├── create_table.sql
│   ├── dimensions.sql
│   ├── fact_table.sql
│   └── populating_dimensions.sql
│
├── Team Collaboration Summary/
│   └──Group2_Team_Collaboration_Summary.docx
│
├── README.md


```

## 1. Data Cleaning

### Tool used for cleaning
#### Excel and Power BI
-  Standardized column names
-  Formatted all date columns as some of the dates were not formatted properly - utilized text to column method in excel and then converted date to date format (MM-DD-YYY)
-  A few of the records within the is_mandatory column had No(30) values - the (30) was replaced with an empty space using CtrlH in excel, so that column would only have Yes and No
-  The feedback_comment column values ended with a fullstop - this was also replaced with an empty space
-  The LMS dataset was enhanced by removing rows with missing values in key fields such as CompletionDate and Score
-  Created Course Completion Time column (calculated as the number of days between EnrollmentDate and CompletionDate)
-  Created CompletionMonth, CompletionQuarter and CompletionYear columns (extracted from CompletionDate for trend analysis)
-  Data types were standardized to ensure accuracy in calculations
-  Categorical fields like IsMandatory and AccessedViaDevice were reviewed for consistency
-  In the Employee Info dataset, a Join Month column was added by extracting the month from the JoinDate, allowing for cohort and tenure-based analysis
-  Added CourseID and CourseProvider to LMS Dataset for comprehensive data for creation of pipelines
-  Added TotalSkillScore and Skill_Category columns for bifurcation of skill level and easy to create visualization
-  Created TotalSkillScore column (total of SkillScore_Communication, SkillScore_TechEfficiency and SkillScore_Teamwork)
-  Course detail dataset - no adjustments were made








  
## 2. Power BI Data Model Overview (Star Schema)

This project utilizes a **Star Schema** data model. At the core of the model lies the `lms_data`, the cleaned Excel dataset, and the `fact_table`, which captures key training and learning activities, surrounded by  **dimension tables** that provide necessary information.

<img alt="Schema" src="https://github.com/user-attachments/assets/114299b7-f8cd-4fbf-8dec-cf6e9d58bb6e" />

---

## Fact Table

### `fact_table`
Captures granular training data, including:

- Course completions  
- Enrollment information  
- Course duration  
- Course and employee IDs  
- Completion timestamps  

---

## Dimension Tables

### `dim_employee`
Contains employee metadata such as:

- `employeeid`  
- `location`  
- `role`  
- `team`  

### `dim_course`
Provides course-specific metadata:

- `courseid`  
- `coursetitle`  
- `coursecategory`  
- `courseprovider`  
- `ismandatory`  

### `dim_feedback`
Contains feedback given for courses:

- `feedbackid`  
- `feedbackcomment`  
- `feedbackrating`  

### `dim_skill`
Holds information on skill development scores:

- `skillid`  
- `skillscope_category`  
- Individual skill scores (e.g., `communication`, `teamwork`)  

### `dim_usage`
Describes access and device usage details:

- `userid`  
- `accessdevice`  
- `lastaccessdate`  
- `usedscreenreader`  

### `dim_completion`
Provides additional completion-level attributes:

- `statusid`  
- `completionstatus`  
- `durationminutes`  
- `ismandatory`  

### `Overdue Summary`
A summary table containing:

- `CompletionDate`, `CompletionStatus`, `EmployeeID`, `Team`, etc.  
- Used for analytical aggregation  

### `Team and Completion Summary`
Another aggregation-friendly table with:

- `EnrollmentDate`, `CompletionMonth`, `Team`, etc.  

---

## Relationships

- `fact_table[employeeid]` → `dim_employee[employeeid]`  
- `fact_table[courseid]` → `dim_course[courseid]`  

---

This data model is designed to support interactive dashboards, advanced analytics, and actionable insights into employee training and development. By separating facts from dimensions and leveraging Power BI’s in-memory engine, it ensures fast query performance, easy scalability, and clear structure for report users.
Regular updates to the dimension and fact tables, along with well-defined relationships, help maintain data integrity and support evolving business requirements.

# Power BI Visuals
-  ![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/df6394483e47ee9c27e7b55cf6d0ed55e5116bb6/Power%20BI%20Screenshots/Training%20and%20Compliance%20Summary.png)

-  ![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/4fec37c17c9121af05bd0ec5013ff6c6bfbe1d41/Power%20BI%20Screenshots/Performance%20Analysis.png)

-  ![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/9bfa7665acb5570409a47a3c343d6e32f5171429/Power%20BI%20Screenshots/Engagement%20Patterns.png)

-  ![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/5347fed06dcb80870799a7fe7a3571986b823399/Power%20BI%20Screenshots/Performance%20Score%20Distribution%20Across%20Departments.png)

-  ![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/9265d55ce25a27d6fac97d672070f6fc5b1853f3/Power%20BI%20Screenshots/Accessibility%20Overview.png)

- [<img width="579" height="323" alt="Forecasting" src="https://github.com/user-attachments/assets/ed267477-e436-47d3-b906-a88dbdeb7cb9" />](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/main/Power%20BI%20Screenshots/Forecasting.png)






## Team Members

| Name                     | GitHub Handle                                  |
|--------------------------|-----------------------------------------------|
| Carlton Francis          | [Carlton756](https://github.com/Carlton756)                                 |
| Karunesh Sehgal          | [sehgal71](https://github.com/sehgal71)  |
| Abdulmalik Alegimenlen   | [Abdulmalik198](https://github.com/AbdulMalik198) |
| Oluebubechi Anyahara     | [Ebube22](https://github.com/Ebube22)           |
