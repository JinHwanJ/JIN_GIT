#### 연습문제 2 
 문> 함수 12
 select rpad(last_name||'', length(last_name||'')+trunc(salary/1000), '*')employees_and_their_salaries
 from employees
 order by salary desc
 
 그룹함수7>
 select count(distinct manager_id)"Number of Manager"
 from employees;
 
 주이
 
 그룹함수 10> 
 select count(*)total , sum(decode(to_char(hire_date,'YYYY'),'1995',1))"1995"
                      , sum(decode(to_char(hire_date,'YYYY'),'1996',2))"1996"
                      , sum(decode(to_char(hire_date,'YYYY'),'1997',3))"1997"
 from employees;