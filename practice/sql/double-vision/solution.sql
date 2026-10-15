SELECT email, COUNT(email) as occourance_count, MIN(signup_date) as earliest_signup, MAX(signup_date) as latest_signup
FROM users
GROUP BY 1
HAVING COUNT(email) > 1
