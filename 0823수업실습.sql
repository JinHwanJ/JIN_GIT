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

