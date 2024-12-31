
1789. Primary Department for Each Employee
Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.

Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.

Return the result table in any order.


Employee table:
+-------------+---------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+---------------+--------------+
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |
+-------------+---------------+--------------+
Output: 
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
| 1           | 1             |
| 2           | 1             |
| 3           | 3             |
| 4           | 3             |
+-------------+---------------+


```sql
-- my submission
SELECT DISTINCT e1.employee_id, e1.department_id -- Select unique combinations of employee_id and department_id from e1
FROM Employee e1
LEFT JOIN Employee e2 
    ON e1.employee_id = e2.employee_id -- Join e1 with e2 on employee_id, matching records where e2.primary_flag = 'Y'
    AND e2.primary_flag = 'Y' -- Only keep matches where e2's primary_flag is 'Y'
WHERE e1.primary_flag = 'Y' -- Include records where e1's primary_flag is 'Y'
    OR e2.employee_id IS NULL; -- Also include records from e1 that have no matching e2 with primary_flag = 'Y'

-- top coder submission
select employee_id, department_id
from Employee
where primary_flag="Y" or
employee_id in (select employee_id from Employee group by employee_id having count(employee_id)=1);-- your employee_id is selected by either primary_flag = 'y' or employee_id of the once of select of a grouped employee_id, which should contain only one occurecne, for they do not have primary key

-- top coder submission
SELECT e1.employee_id, e1.department_id 
FROM Employee e1 
WHERE e1.primary_flag = 'Y'  
UNION  
SELECT e2.employee_id, e2.department_id 
FROM Employee e2 
GROUP BY e2.department_id 
HAVING COUNT(e2.department_id ) = 1;

```

1204. Last Person to Fit in the Bus
There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.

Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.

```sql
SELECT current_person.person_name
FROM Queue AS current_person 
JOIN Queue AS accumulated_person 
ON current_person.turn >= accumulated_person.turn -- Compare turns to accumulate weights up to the current person's turn
GROUP BY current_person.turn -- Group by the current person's turn to aggregate weights
HAVING SUM(accumulated_person.weight) <= 1000 -- Filter groups where the accumulated weight does not exceed 1000
ORDER BY SUM(accumulated_person.weight) DESC -- Sort by the accumulated weight in descending order
LIMIT 1; -- Limit the result to one person with the highest accumulated weight within the 1000 threshold


```

Here's the Markdown representation of the tables:

### Original Queue Table

| turn | person_name | weight |
|------|-------------|--------|
| 1    | Alice       | 300    |
| 2    | Bob         | 400    |
| 3    | Charlie     | 200    |
| 4    | David       | 150    |

---

### Intermediate Table for Alice

| person_current_turn | person_current_name | person_prior_turn | person_prior_name | weight |
|---------------------|----------------------|-------------------|-------------------|--------|
| 1                   | Alice               | 1                 | Alice             | 300    |

---

### Intermediate Table for Bob

| person_current_turn | person_current_name | person_prior_turn | person_prior_name | weight |
|---------------------|----------------------|-------------------|-------------------|--------|
| 2                   | Bob                 | 1                 | Alice             | 300    |
| 2                   | Bob                 | 2                 | Bob               | 400    |

---

### Intermediate Table for Charlie

| person_current_turn | person_current_name | person_prior_turn | person_prior_name | weight |
|---------------------|----------------------|-------------------|-------------------|--------|
| 3                   | Charlie             | 1                 | Alice             | 300    |
| 3                   | Charlie             | 2                 | Bob               | 400    |
| 3                   | Charlie             | 3                 | Charlie           | 200    |

---

### Intermediate Table for David

| person_current_turn | person_current_name | person_prior_turn | person_prior_name | weight |
|---------------------|----------------------|-------------------|-------------------|--------|
| 4                   | David               | 1                 | Alice             | 300    |
| 4                   | David               | 2                 | Bob               | 400    |
| 4                   | David               | 3                 | Charlie           | 200    |
| 4                   | David               | 4                 | David             | 150    |

---

These tables show how each `person_current` joins with all prior people (including themselves) to calculate the cumulative weight for filtering and sorting in the SQL query.


1. Triangle Judgement
Report for every three line segments whether they can form a triangle.
Return the result table in any order.

```sql
-- beats 59.55
SELECT x, y, z,
    CASE 
        WHEN x + y > z 
        AND y + z > x 
        AND z + x > y THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;

-- top coder approach
SELECT *, 
    IF(x+y>z and y+z>x and z+x>y, "Yes", "No") as triangle FROM Triangle
```