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

## 3. Power BI Visuals


## Training and Compliance Summary
![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/df6394483e47ee9c27e7b55cf6d0ed55e5116bb6/Power%20BI%20Screenshots/Training%20and%20Compliance%20Summary.png)

This dashboard highlights employee training performance across departments.

### Key Metrics:
- **Departments Covered**: 6
- **Completed Training Count**: 1598
- **Overdue Count**: 402
- **Overall Completion Rate**: 79.90%

### Key Insights:
- **Highest Overdue Month**: July (41 overdue), which is 78.26% higher than the lowest (September, 23 overdue).
- **Monthly Overdue Range**: 23 to 41
- **Top Contributing Month to Overdues**: July (10.2%)

### Visuals:
- **Completion Rate by Department & Location**: Doughnut chart showing department-wise completion performance.
- **Mandatory vs Non-Mandatory Completion**: Bar chart indicating the majority of completed trainings were mandatory.
- **Overdue Trend Over Time**: Bar chart showing the monthly trend of overdue trainings.
- **Completed vs Overdue**: Doughnut chart comparing completed and overdue training counts.

## Performance Overview

![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/4fec37c17c9121af05bd0ec5013ff6c6bfbe1d41/Power%20BI%20Screenshots/Performance%20Analysis.png)

This dashboard evaluates skill development and performance across departments and roles.

### Key Metrics:
- **Skill Gap Rate**: 76.53%
- **Departments Assessed**: 6

### Visuals:
- **Review Frequency**: Bar chart detailing how often reviews are conducted by department/role/location.
- **ARS (Assessment Review Score)**: Uniformly high ARS across all Departments.
- **Average Skill Score by Department**: Minor variation across departments such as IT, Finance, Repairs, etc.
- **Average Skill Score by Role**: Bar chart with role-based skill score comparison — includes roles like Housing Officer, Electrician, Cleaner, etc.

## Engagement Patterns
![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/c1998e4f032fc316fde1ef6f392cb676652a0ed0/Power%20BI%20Screenshots/Engagement%20Patterns.png)

This dashboard focuses on how employees interact with training content.

### Key Metrics:
- **Total Minutes Spent on Courses**: 119.40 min
- **Average Time Spent on Courses**: 74.72 min
- **Locations**: 4
- **Roles**: 18

### Visuals:
- **Device Usage Breakdown**:
  - Desktop: Most used
  - Mobile & Tablet: Moderately used

- **Course Access Delay**: Displayed by department, role, and location in bar format.

- **Time Spent by Role**: 
  - Maintenance Technician: 78 min
  - Housing Officer: 77.48 min
  - Lettings Coordinator: 77.06 min

- **Time Spent by Location**: 
  - Northfield Office: 77.04 min
  - Wythenshawe Central: 74.57 min
  - Civic Centre Hub: 74.37 min
  - Trafford Branch: 72.92 min

## Performance Score Distribution

![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/5347fed06dcb80870799a7fe7a3571986b823399/Power%20BI%20Screenshots/Performance%20Score%20Distribution%20Across%20Departments.png)

This chart displays the distribution of performance scores across various teams.

### Key Insights:
- **Teams Included**: IT, Customer Support, Housing Management, Repairs, Facilities, Finance  
- **Performance Range**: Most teams show a similar spread between scores 1.0 and 5.0.  
- **Median Score**: Consistently around 3.0 for all teams.  
- **Outliers**: Minimal to none; uniform distribution indicates similar performance dynamics across departments.

## Accessibility Overview
![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/9265d55ce25a27d6fac97d672070f6fc5b1853f3/Power%20BI%20Screenshots/Accessibility%20Overview.png)

This dashboard highlights performance and feedback variations by accessibility usage.

### Key Metrics:
- **Average Score (Yes)**: 81.08  
- **Average Score (No)**: 79.88  
- **Accessibility Devices Tracked**: 3

### Visuals:
- **Screen Reader Usage Performance**: Users with screen readers slightly outperform those without.  
- **Feedback Score by Device**: Similar satisfaction levels across Desktop, Mobile, and Tablet devices.

## Completion Forecast

![image](https://github.com/Carlton756/RDAMP_LMS_Analytics_RCHG/blob/main/Power%20BI%20Screenshots/Forecasting.png)

This forecast analyzes historical training completion trends and projects future numbers.

### Key Observations:
- **Historical Trends**: High variability in completions from 2018 to 2024, peaking in early 2022.  
- **2025 Drop**: Sharp decline observed in 2025.  
- **Forecast (2025–2026)**: Modest recovery expected, but not to previous peak levels.

---

## 4. Business Insight

### Executive Summary

#### Key Findings Aligned with RCHG’s Learning and Compliance Goals

- **Training Completion**: Out of 2000 tracked training instances, 1598 were completed, giving an overall completion rate of **79.90%**.
- **Skill Gaps**: A **76.53% skill gap rate** highlights critical training needs across departments.
- **Departmental Consistency**: Performance scores across IT, Finance, Repairs, etc., show consistent medians (~3.0), indicating uniformity in learning outcomes.
- **Accessibility Advantage**: Users with screen readers achieved higher average scores (81.08) than non-users (79.88), emphasizing the impact of inclusive tools.
- **Engagement**: Desktop is the primary device used for course interaction; highest time spent by role was Maintenance Technicians (~78 minutes).
- **Forecast Concerns**: A steep drop in training completions is projected in 2025, threatening compliance unless corrective action is taken.

---

### Insight Narratives

#### Trends, Risks, and Opportunities Derived from Dashboards

- **Trend**: Uniform skill and performance scoring across departments indicates a standardized training framework, though not necessarily high performance.
- **Risk**: A spike in overdue training in **July** (41 overdue, highest month) and a projected decline in completions pose risks to compliance targets.
- **Opportunity**: Accessibility tools appear to improve user outcomes — an opportunity to scale inclusive design across the LMS.
- **Trend**: Mandatory training completions significantly outnumber non-mandatory, reflecting compliance-driven engagement rather than skill-focused learning.
- **Trend**: The time invested in training varies slightly by role and location, which may inform role-specific learning path adjustments.

---

### Advanced Analytics Section

#### Forecast Model Interpretation

- The **forecast graph** (2018–2026) reveals a dramatic decline in completions by **2025**, followed by slight recovery in **2026**.
- Past patterns show cyclical trends, with peaks in early 2020 and 2022, suggesting possible alignment with compliance cycles or new policy rollouts.

### Regression & ANOVA

Based on the regression analysis between **training time**, **frequency**, and **performance scores**, the results indicate:

- **Training Duration**: The **p-value** for training duration (`0.172`) is greater than `0.05`, suggesting that training duration does not have a **statistically significant impact** on performance scores.
  
- **Training Frequency**: The **p-value** for training frequency (`0.151`) is also greater than `0.05`, indicating that training frequency does not have a **statistically significant impact** on performance scores.

#### In conclusion, **neither training duration nor training frequency** has a statistically significant effect on performance scores based on the current data.
---

### Strategic Recommendations

#### Addressing Skill Gaps and Improving Learning Engagement

1. **Targeted Skill Development**:
   - Deploy microlearning for high-gap roles identified in the Performance Overview.
   - Prioritize departments with lower completion consistency and higher overdue counts (e.g., July spike).

2. **Accessibility-First Design**:
   - Expand screen reader and alternative format support, leveraging evidence of higher performance from accessibility users.

3. **Predictive Intervention**:
   - Use forecasting insights to implement preemptive reminders or gamified learning incentives in Q4 2024 to offset the 2025 drop.

4. **Role-Based Learning Paths**:
   - Adjust training durations and content delivery styles for roles, based on engagement patterns.

---


## 5. Team Collaboration

## Team Members

| Members                 | GitHub Handle                                      | Responsibilities                                 |
|-------------------------|----------------------------------------------------|--------------------------------------------------|
| Abdulmalik Alegimenlen | [https://github.com/AbdulMalik198](https://github.com/AbdulMalik198) | Data Cleaning                                    |
| Carlton Francis         | [https://github.com/Carlton756](https://github.com/Carlton756)       | Dashboard Creation                               |
| Karunesh Sehgal         | [https://github.com/sehgal71](https://github.com/sehgal71)           | Data Modeling (Star Schema) and Statistical Analysis |
| Oluebubechi Anyahara    | [https://github.com/Ebube22](https://github.com/Ebube22)             | Creation of Visuals                              |

#### Responsibility Allocation:
Tasks were assigned based on each member’s strengths, interests, and prior experience. This helped ensure efficiency and mutual learning.

## Strengths & Contributions:

- **Abdulmalik Alegimenlen**: Ensured deadlines were met, maintaining communication and deliverables. Cleaned the patchy data and created calculated columns for better analysis.  
- **Carlton Francis**: Delivered visuals for storytelling with data, creating compelling dashboards and KPIs in Power BI.  
- **Karunesh Sehgal**: Brought SQL and database skills, for building schemas and data dimensions. Applied statistical techniques using python to uncover hidden trends and relationships between variables.  
- **Oluebubechi Anyahara**: Collaborated with Carlton for enhanced visualizations and better dashboard creation.  

Each team member collaborated actively and supported one another throughout the project, stepping in to fill any gaps and ensure collective success.

## Weaknesses & Gaps:

- Limited experience with forecasting and regression analysis initially led to slower dashboard and visuals development.  
- Time management became challenging when balancing different time zones of team members and various delays with project deadlines.

## Team Workflow & Communication:

- **Methodology**: Agile  
We followed Agile workflow, working in daily sprints with check-ins with updates on the status of workflow.

- **Tools Used**:  
  - GitHub – Source control and collaboration  
  - Slack – Daily communication

<img width="1369" height="642" alt="image" src="https://github.com/user-attachments/assets/a14d764b-1e71-4a28-b4a8-9c7b1568f886" />


## Challenges Faced:

| Challenge                    | Solution                                                                       |
|-----------------------------|--------------------------------------------------------------------------------|
| Inconsistent data formats   | Developed standardized data cleaning rules across all Excel files             |
| Time zone and availability issues | Scheduled meetings based on mutual availability and used async check-ins  |
| Dashboard performance in Power BI | Optimized data models and reduced visuals to increase load speed        |

## Lessons Learned:

- **Technical Skills**:  
Learned practical applications of SQL joins, schema design, Power BI DAX formulas, and Jupyter visualizations.

- **Soft Skills**:  
Improved communication, conflict resolution, and remote collaboration skills.

- **Next Time, We Would**:  
  - Use a shared task board from the start. (Git, Google Collab etc.)  
  - Set clearer weekly goals and tighter version control protocols  
  - Allocate more time for final dashboard design and user testing  
  - Early data modelling for better dimension creation and understanding of each aspect of data and how it affects the results  

This project not only strengthened our technical toolkit but also showed us the importance of communication, collaboration, and adaptability in team environments. We are proud of our results and confident in our ability to work as a professional data team in future projects.
