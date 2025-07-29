## Team Members

| Name                     | GitHub Handle                                  |
|--------------------------|-----------------------------------------------|
| Carlton Francis          | [Carlton756](https://github.com/Carlton756)                                 |
| Karunesh Sehgal          | [sehgal71](https://github.com/sehgal71)  |
| Abdulmalik Alegimenlen   | [Abdulmalik198](https://github.com/Github_Abdulmalik198) |
| Oluebubechi Anyahara     | [Ebube22](https://github.com/Github_Ebube22)           |


  
# RDAMP_LMS_Analytics_RCHG
Rychtenshane Community Housing Group (RCHG) is a social housing provider based in Chester. This project is geared towards creating RCHGs first Learning Management System (LMS), capable of centralizing learning efforts and utilizing data-driven insights to improve staff training, compliance, and performance outcomes.

## 1. Data Cleaning

### Tool used for cleaning
#### Excel and Power BI
-  Standardized column names
-  Formatted all date columns as some of the dates were not formatted properly - utilized text to column method in excel and then converted date to date format(MM-DD-YYY)
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
