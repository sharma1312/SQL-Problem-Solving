CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
     with d1 as (select id, salary, dense_rank() over(order by salary desc) as drk from employee)
    select distinct salary from d1 where drk=N
        


  );
END