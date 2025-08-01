CREATE TABLE LMS_Data (
    EmployeeID VARCHAR(10),
    Team VARCHAR(50),
    Role VARCHAR(100),
    Location VARCHAR(100),
	CourseID VARCHAR(10),
    CourseTitle VARCHAR(150),
	CourseProvider VARCHAR(20),
    CourseCategory VARCHAR(50),
    IsMandatory VARCHAR(3),
    EnrollmentDate DATE,
    CompletionDate DATE,
    CompletionStatus VARCHAR(20),
    Score INTEGER,
    DurationMinutes INTEGER,
    LastAccessDate DATE,
    AccessedViaDevice VARCHAR(20),
    SkillScore_Communication SMALLINT,
    SkillScore_TechEfficiency SMALLINT,
    SkillScore_Teamwork SMALLINT,
    SkillGapFlag VARCHAR(3),
    FeedbackComment TEXT,
    FeedbackRating SMALLINT,
    UsedScreenReader VARCHAR(3),
    CourseCompletionTime INTEGER,
    CompletionMonthYear VARCHAR(15),
    Total_SkillScore SMALLINT,
    SkillScore_Category VARCHAR(20)
);