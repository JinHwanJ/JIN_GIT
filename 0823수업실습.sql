select deptno, job, mgr, avg(sal)
from emp
group by grouping sets((deptno, job),(mgr, job),());

��> emp ���̺��� �����ȣ�� 7521�� ����� ������ ���� �޿��� 7934�� ������٤� ���� ����� �����ȣ, �̸�, ������, �Ի�����, �޿��� ��ȸ
--where������ ���� ���� subquery ����
select empno, ename, job, hiredate, sal
from emp
where job =(select job from emp 
            where empno =7521)
and sal > (select sal from emp
           where empno = 7934);
           
           
��> emp���̺��� �޿��� ���� ���� �޴� ����� �̸�, �μ���ȣ, �޿�, �Ի����� ��ȸ�϶�
---subquery�� �׷��Լ� ��� ����

select ename, deptno, sal, hiredate
from emp
where sal = (select max(sal) from emp);

��> emp ���̺��� �޿��� ��պ��� ���� �޿��� ���� ����� �����ȣ, �̸�, ������,�޿�,�μ���ȣ��ȸ���
select empno, ename, job,sal, deptno
from emp
where sal<(select avg(sal) from emp);

��> emp ���̺��� �μ��� �ּұ޿��� 20�� �μ��� �ּұ޿����� ���� �μ��� ��ȸ ���(�μ���ȣ�� �ּұ޿�)
select deptno, min(sal)
from emp
group by deptno
having min(sal)>(select min(sal) from emp where deptno = 20);

��> �� �μ��� �ְ� �޿��� �޴� ����� �����ȣ, �̸�, �޿�, �μ���ȣ�� ��ȸ �����
select empno, ename,sal, deptno
from emp
where sal in (select max(sal) from emp group by deptno);

update emp set deptno=10, sal=3000
where empno =7000;
commit;

select empno, ename,sal, deptno
from emp
where (deptno,sal) in (select deptno, max(sal) from emp group by deptno); --multiple column subquery, pair-wise ��

��> ������ salesman �� �ƴ� ��� �߿��� ������ salesman�� �ּ� �� �� �̻��� ������� �޿��� ���� �޴� ����� �̸�, �޿�, ������ ��ȸ
select ename, sal, job
from emp
where job != 'salesman'
and sal> any(select sal from emp where job='salesman');

��> ������ salesman �� �ƴ� ��� �߿��� ������ salesman�� ��� ����� �޿����� �޿��� ���� �޴� ����� �̸�, �޿�, ������ ��ȸ
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

��> ford �Ǵ� blake  ����� ������ �� �μ��� ������ ����� ���� ��ȸ

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
fetch next 2 rows with ties; ---����