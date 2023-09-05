/* Write your T-SQL query statement below */

select t1.name from Employee t1
join Employee t2 
on t1.id=t2.managerId
group by t1.id, t1.name
having count(t1.id) >= 5