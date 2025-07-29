--- Dimension of Employees
CREATE TABLE Dim_Employee (
    EmployeeID VARCHAR(10) PRIMARY KEY,
    Team VARCHAR(50),
    Role VARCHAR(100),
    Location VARCHAR(100)
);

--- Dimension of Course
CREATE TABLE Dim_Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseTitle VARCHAR(150),
    CourseCategory VARCHAR(50),
    IsMandatory VARCHAR(3),
    CourseProvider VARCHAR(20)
);

--- Dimension of Skill
CREATE TABLE Dim_Skill (
    SkillID SERIAL PRIMARY KEY,
    SkillScore_Communication SMALLINT,
    SkillScore_TechEfficiency SMALLINT,
    SkillScore_Teamwork SMALLINT,
    SkillGapFlag VARCHAR(3),
	Total_SkillScore SMALLINT,
    SkillScore_Category VARCHAR(20)
);

--- Dimension of Completion
CREATE TABLE Dim_CompletionStatus (
    StatusID SERIAL PRIMARY KEY,
    CompletionStatus VARCHAR(20),
    Score INTEGER,
    DurationMinutes INTEGER,
    CourseCompletionTime INTEGER,
	CompletionMonthYear VARCHAR(15),
    IsMandatory VARCHAR(3)
);

--- Dimension of Usage
CREATE TABLE Dim_Usage (
    UsageID SERIAL PRIMARY KEY,
    LastAccessDate DATE,
    AccessedViaDevice VARCHAR(50),
    UsedScreenReader VARCHAR(3)
);

--- Dimension of Feedback
CREATE TABLE Dim_Feedback (
    FeedbackID SERIAL PRIMARY KEY,
    FeedbackComment TEXT,
    FeedbackRating SMALLINT
);
