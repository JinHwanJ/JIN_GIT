Q> 사원의 이름, 입사일, 입사일자, 입사일에서 1년6개월 후의 날짜를 조회
select ename, hiredate, hiredate + to_yminterval('01-06')
from emp;

select ename, hiredate, ADD_MONTHS(hiredate, 18)
from emp;

select comm, sal, comm+sal, nvl(comm,'No Commission')
from emp;

select comm, sal, nvl2(comm, sal+comm, sal*1.1)
from emp;

select comm, sal, nvl2(comm, sal+comm, 'sal*1.1')
from emp;

select comm, sal, nvl2(comm, 'sal+comm', 'sal*1.1')
from emp;

select coalesce('a', null, null, 'b')


select nullif('A',100)
from dual;

# Q) emp 사원의 담당업무가 ANALYST 인 경우 급여는 10% 증가, CLERK 인 경우 급여는 20% 증가, MANAGER인 경우 30% 증가 
         PRESIDENT 인 경우 급여 40% 증가, SALESMAN 인 경우 50%증가 그 외엔 기존급여값
         
select  ename, sal, job,  case   job  when  'ANALYST'  then  sal*1.1 
                      		 when  'CLERK' then sal*1.2
                       		when 'PRESIDENT' then sal*1.4
                      		when 'SALESMAN' then sal*1.5
                    		 else  sal end   "Increase Salary"
from emp;




select ename, sal, job, DECODE(job, 'ANALYST', sal*1.1 
                       		       ,  'CLERK', sal*1.2
                      		      , 'PRESIDENT', sal*1.4
                    		      , 'SALESMAN', sal*1.5, sal)
 from emp;


문> 사원번호, 이름, 급여, 급여의 세금을 출력하시오 (decode와 case when then 사용)

select empno, ename, sal, 
       case when sal < 1000 then 0
       when sal >= 1000 and sal < 2000 then sal *0.03
       when sal >= 2000 and sal < 3000 then sal *0.06
       when sal >= 3000 and sal < 4000 then sal *0.09
       when sal > 4000 then sal *0.12 
       end as "TAX"
       from emp;
       

select empno, ename, sal,
       decode(trunc(sal/1000),0,0,
                    1, sal*0.03,
                    2, sal*0.06
                    3, sal*0.09
                    sal*0.12) "TAX"
                    from emp;
       
select min(ename), max(ename), min(hiredate), max(hiredate)
from emp;

select count(*)c1, count(comm) c2, count(deptno)c3, count(distinct deptno)c4
from emp; - 전체 행수, 커미션 받는 사원수, 부서가 배정된 사원수, 사원이 소속된 부서 종류의 수

## 그룹함수는 null을 제외한다(무시)

select ~ column, 표현식, 그룹함수표현식 ,
from ~ ------1
[where ~] -----2 filter  조건
[group by ~] -----3 컬럼 선언, (alias, column position  선언 불가)
[order by ~] -----5 컬럼, 표현식, alias, column position

문:> emp 테이블에서 부서별로 인원수, 평균, 급여, 최저 급여, 최고 급여, 급여의 합을 구하여 출력
select deptno, count(*), trunc(avg(sal),1), min(sal), max(sal), sum(sal)
from emp;

## select  절에서 그룹함수와 그룹함수를 적용하지 않은 걸럼을 함께 선언하는 경우, 그룹함수를 선언하지 않은 컬럼은 반드시 group by 절에 선언해야 합니다. 

select deptno, count(*), trunc(avg(sal),1), min(sal), max(sal), sum(sal)  -----3
from emp         ----1
group by deptno; ----2 hash 방식/ hash 방식은 수행결과 정렬 X, sorting 방식으로 수행되면 정렬 보장

##group by 절에 선언된 컬럼은 select절에 반드시 선언되어야 하는 것은 아님(필수아님)

문> 전체 사원의 커미션 평균을 출력
select avg(nvl(comm,0)), sum(comm)/count(*)
from emp;  ---null을 포함한 컬럼의 avg함수 적용은 반드시 null 처리 후에 적용해야 합니다. 

문> EMP 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하여라
select 
from emp;

##where 절에서는 group 힘수 적용 불가, group by절 보다 먼저 수행하는 필터 조건

select ~ column, 표현식, 그룹함수표현식 , -------5
from ~ ------1
[where ~] -----2 filter  조건
[group by ~] -----3 컬럼 선언, (alias, column position  선언 불가)
[having 그룹함수 적용 조건] ----4
[order by ~] -----6 컬럼, 표현식, alias, column position

문> EMP 테이블에서 부서별 최고 급여가 2900 이상인 부서에 대해서 부서번호,평균급여, 급여의 합을 조회한다