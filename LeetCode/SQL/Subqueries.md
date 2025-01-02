1341 Movie Rating Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically (alphabeitically, numerationally) smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.
```sql
-- Create a Common Table Expression (CTE) to get the user who has rated the most movies
WITH user_rating_counts AS (
    -- Select the user name and count the number of ratings per user
    SELECT 
        u.name, 
        COUNT(*) AS rating_count
    FROM 
        MovieRating mr
    -- Join with the Users table to get the user names
    JOIN 
        Users u ON mr.user_id = u.user_id
    -- Group by user to get individual counts for each user
    GROUP BY 
        u.user_id, u.name
    -- Order by the number of ratings in descending order, and in case of a tie, order by name in ascending order
    ORDER BY 
        rating_count DESC, name ASC
    -- Limit to the first user, since we only need the one with the most ratings
    LIMIT 1
),

-- Create another CTE to calculate average movie ratings for February 2020
feb_2020_avg_ratings AS (
    -- Select movie titles and calculate the average rating for each movie
    SELECT 
        m.title, 
        AVG(mr.rating) AS avg_rating
    FROM 
        MovieRating mr
    -- Join with the Movies table to get the movie titles
    JOIN 
        Movies m ON mr.movie_id = m.movie_id
    -- Filter for ratings created within February 2020
    WHERE  
        mr.created_at >= '2020-02-01' 
        AND mr.created_at < '2020-03-01'
    -- Group by movie to get the average rating per movie
    GROUP BY 
        m.movie_id, m.title
    -- Order by average rating in descending order, and in case of a tie, order by title in ascending order
    ORDER BY 
        avg_rating DESC, title ASC
    -- Limit to the first movie, since we only need the one with the highest average rating
    LIMIT 1
)

-- Combine the results from both CTEs
SELECT 
    name AS results FROM user_rating_counts
-- Use UNION ALL to combine with the second query result
UNION ALL
SELECT 
    title AS results FROM feb_2020_avg_ratings;
```




Restaurant Growth
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.
```sql
-- CTE 1: Find valid end dates for 7-day windows
WITH seven_day_window AS (
    SELECT DISTINCT visited_on 
    FROM Customer 
    WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6 --DATEDIFF denotes the difference in dates: 6 = 7 - 1; visisted_on will contains 7th and above entries
),
-- CTE 2: Create pairs of dates within 7-day windows
rolling_window_data AS (
    SELECT c.*, w.visited_on AS window_end_date
    FROM Customer c 
    JOIN seven_day_window w 
        ON DATEDIFF(w.visited_on, c.visited_on) BETWEEN 0 AND 6
)

SELECT window_end_date AS visited_on, SUM(amount) AS amount, ROUND(SUM(amount) / 7, 2) AS average_amount 
FROM rolling_window_data
GROUP BY window_end_date;

```


1.    Employees Whose Manager Left the Company
Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.

```sql
SELECT employee_id
    FROM Employees 
    WHERE manager_id NOT IN (SELECT employee_id FROM Employees) 
    AND salary < 30000
    ORDER BY employee_id 

-- top 0.13% approach
select
    employee_id
from employees 
where salary <30000
and manager_id not in (select employee_id from employees)
order by 1 -- sort the result by the first column in the SELECT
``` 