select deptno, job, mgr, avg(sal)
from emp
group by grouping sets((deptno, job),(mgr, job),());

문> emp 테이블에서 사원번호가 7521인 사원과 업무가 같고 급여가 7934인 사원보다ㅣ 많은 사원의 사원번호, 이름, 담당업무, 입사일자, 급여를 조회
--where절에서 조건 각각 subquery 가능
select empno, ename, job, hiredate, sal
from emp
where job =(select job from emp 
            where empno =7521)
and sal > (select sal from emp
           where empno = 7934);
           
           
문> emp테이블에서 급여를 제일 많이 받는 사원의 이름, 부서번호, 급여, 입사일을 조회하라
---subquery에 그룹함수 사용 가능

select ename, deptno, sal, hiredate
from emp
where sal = (select max(sal) from emp);

문> emp 테이블에서 급여의 평균보다 적은 급여를 받은 사원의 사원번호, 이름, 담당업무,급여,부서번호조회출력
select empno, ename, job,sal, deptno
from emp
where sal<(select avg(sal) from emp);

문> emp 테이블에서 부서별 최소급여가 20번 부서의 최소급여보다 높은 부서를 조회 출력(부서번호와 최소급여)
select deptno, min(sal)
from emp
group by deptno
having min(sal)>(select min(sal) from emp where deptno = 20);

문> 각 부서별 최고 급여를 받는 사원의 사원번호, 이름, 급여, 부서번호를 조회 ㅍ출력
select empno, ename,sal, deptno
from emp
where sal in (select max(sal) from emp group by deptno);

update emp set deptno=10, sal=3000
where empno =7000;
commit;

select empno, ename,sal, deptno
from emp
where (deptno,sal) in (select deptno, max(sal) from emp group by deptno); --multiple column subquery, pair-wise 비교

문> 직무가 salesman 이 아닌 사원 중에서 업무가 salesman인 최소 한 명 이상의 사원보다 급여를 많이 받는 사원의 이름, 급여, 업무를 조회
select ename, sal, job
from emp
where job != 'salesman'
and sal> any(select sal from emp where job='salesman');

문> 직무가 salesman 이 아닌 사원 중에서 업무가 salesman인 모든 사원의 급여보다 급여를 많이 받는 사원의 이름, 급여, 업무를 조회
select ename, sal, job
from emp
where job != 'salesman'
and sal> all(select sal from emp where job='salesman');


select sysdate(sysdate, 'dd-mm-yy')
from dual;

SELECT extract ( day from sysdate) , 
          extract ( month from sysdate) ,
          extract ( year from sysdate) 
 FROM dual ;

문> ford 또는 blake  사원과 관리자 및 부서가 동일한 사원의 정보 조회

select *
from emp
where(mgr, deptno) in (select mgr, deptno from emp where ename in ('ford','blake'))
and ename not in ('ford','blake');

select *
from emp
where mgr in (select mgr from emp where ename in ('ford','blake'))
and deptno in (select deptno from emp where ename in ('ford','blake'))
and ename not in ('ford','blake');

select ename, sal
from emp
order by sal desc
fetch next 2 rows with ties; ---마미