CREATE TABLE fact_table (
    FactID SERIAL PRIMARY KEY,
    EmployeeID VARCHAR(10),
    CourseID VARCHAR(10),
    SkillID INTEGER,
    StatusID INTEGER,
    UsageID INTEGER,
    FeedbackID INTEGER,
    EnrollmentDate DATE,
    CompletionDate DATE,
    CompletionMonthYear VARCHAR(15),
    Score INTEGER,
    DurationMinutes INTEGER,
    CourseCompletionTime INTEGER
);

INSERT INTO fact_table (
    EmployeeID, CourseID, SkillID, StatusID, UsageID, FeedbackID,
    EnrollmentDate, CompletionDate, CompletionMonthYear,
    Score, DurationMinutes, CourseCompletionTime
)
SELECT
    e.EmployeeID,
    c.CourseID,
    s.SkillID,
    cs.StatusID,
    u.UsageID,
    f.FeedbackID,
    lms.EnrollmentDate,
    lms.CompletionDate,
    lms.CompletionMonthYear,
    lms.Score,
    lms.DurationMinutes,
    lms.CourseCompletionTime
FROM lms_data lms
JOIN Dim_Employee e ON lms.EmployeeID = e.EmployeeID
JOIN Dim_Course c ON lms.CourseID = c.CourseID
JOIN Dim_Skill s ON lms.SkillScore_Communication = s.SkillScore_Communication
                 AND lms.SkillScore_TechEfficiency = s.SkillScore_TechEfficiency
                 AND lms.SkillScore_Teamwork = s.SkillScore_Teamwork
                 AND lms.SkillGapFlag = s.SkillGapFlag
                 AND lms.Total_SkillScore = s.Total_SkillScore
                 AND lms.SkillScore_Category = s.SkillScore_Category
JOIN Dim_CompletionStatus cs ON lms.CompletionStatus = cs.CompletionStatus
                            AND lms.Score = cs.Score
                            AND lms.DurationMinutes = cs.DurationMinutes
                            AND lms.CourseCompletionTime = cs.CourseCompletionTime
                            AND lms.CompletionMonthYear = cs.CompletionMonthYear
                            AND lms.IsMandatory = cs.IsMandatory
JOIN Dim_Usage u ON lms.LastAccessDate = u.LastAccessDate
                AND lms.AccessedViaDevice = u.AccessedViaDevice
                AND lms.UsedScreenReader = u.UsedScreenReader
LEFT JOIN Dim_Feedback f ON lms.FeedbackComment = f.FeedbackComment
                       AND lms.FeedbackRating = f.FeedbackRating;