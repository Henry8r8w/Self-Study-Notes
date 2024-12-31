### Product Sales Analysis III
Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
```sql
-- top 58% approach
With Sales_rank AS (
    SELECT *, 
    RANK() OVER (Partition BY product_id ORDER BY year) as rw -- mutate for another column that group by product id and order by year and assign ranks
FROM Sales
)

SELECT product_id, year AS first_year, quantity,  price
FROM Sales_rank
WHERE rw = 1

-- top 0.38% approach
select product_id, year as first_year, quantity, price 
from Sales
where (product_id, year) in 
    (select product_id, min(year) 
        from Sales
        group by product_id);
```


### Number of Unique Subjects Taught by Each Teacher
Write a solution to calculate the number of unique subjects each teacher teaches in the university

```sql
SELECT teacher_id, COUNT(DISTINCT subject_id) as cnt 
FROM Teacher
GROUP BY teacher_id
```