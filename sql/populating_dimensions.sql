INSERT INTO Dim_Employee (EmployeeID, Team, Role, Location)
SELECT DISTINCT EmployeeID, Team, Role, Location
FROM lms_data
ON CONFLICT (EmployeeID) DO NOTHING;

INSERT INTO Dim_Course (CourseID, CourseTitle, CourseCategory, IsMandatory, CourseProvider)
SELECT DISTINCT CourseID, CourseTitle, CourseCategory, IsMandatory, CourseProvider
FROM lms_data
ON CONFLICT (CourseID) DO NOTHING;

INSERT INTO Dim_Skill (SkillScore_Communication, SkillScore_TechEfficiency, SkillScore_Teamwork, SkillGapFlag, Total_SkillScore, SkillScore_Category)
SELECT DISTINCT SkillScore_Communication, SkillScore_TechEfficiency, SkillScore_Teamwork, SkillGapFlag, Total_SkillScore, SkillScore_Category
FROM lms_data

INSERT INTO Dim_CompletionStatus (CompletionStatus, Score, DurationMinutes, CourseCompletionTime, CompletionMonthYear, IsMandatory)
SELECT DISTINCT CompletionStatus, Score, DurationMinutes, CourseCompletionTime, CompletionMonthYear, IsMandatory
FROM lms_data;

INSERT INTO Dim_Usage (LastAccessDate, AccessedViaDevice, UsedScreenReader)
SELECT DISTINCT LastAccessDate, AccessedViaDevice, UsedScreenReader
FROM lms_data

INSERT INTO Dim_Feedback (FeedbackComment, FeedbackRating)
SELECT DISTINCT FeedbackComment, FeedbackRating
FROM lms_data
WHERE FeedbackComment IS NOT NULL;