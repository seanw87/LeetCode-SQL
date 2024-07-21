CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
      
      select distinct salary from Employee order by salary desc
      limit 1 offset N
      
      # not sure why following sql gives null value
      # select g.salary
      # from (
      #     select salary, row_number() over (partition by id order by salary desc) as salary_rank
      #     from Employee
      # ) g
      # where salary_rank = N
  );
END