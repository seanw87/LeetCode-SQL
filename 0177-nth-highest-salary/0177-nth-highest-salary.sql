CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  # SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
      
      # select distinct salary from Employee order by salary desc
      # limit 1 offset N
      
      # using window function
      select distinct g.salary
      from (
          select salary, dense_rank() over (order by salary desc) as salary_rank
          from Employee
      ) g
      where g.salary_rank = N
  );
END