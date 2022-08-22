Q> ����� �̸�, �Ի���, �Ի�����, �Ի��Ͽ��� 1��6���� ���� ��¥�� ��ȸ
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

# Q) emp ����� �������� ANALYST �� ��� �޿��� 10% ����, CLERK �� ��� �޿��� 20% ����, MANAGER�� ��� 30% ���� 
         PRESIDENT �� ��� �޿� 40% ����, SALESMAN �� ��� 50%���� �� �ܿ� �����޿���
         
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


��> �����ȣ, �̸�, �޿�, �޿��� ������ ����Ͻÿ� (decode�� case when then ���)

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
from emp; - ��ü ���, Ŀ�̼� �޴� �����, �μ��� ������ �����, ����� �Ҽӵ� �μ� ������ ��

## �׷��Լ��� null�� �����Ѵ�(����)

select ~ column, ǥ����, �׷��Լ�ǥ���� ,
from ~ ------1
[where ~] -----2 filter  ����
[group by ~] -----3 �÷� ����, (alias, column position  ���� �Ұ�)
[order by ~] -----5 �÷�, ǥ����, alias, column position

��:> emp ���̺��� �μ����� �ο���, ���, �޿�, ���� �޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� ���
select deptno, count(*), trunc(avg(sal),1), min(sal), max(sal), sum(sal)
from emp;

## select  ������ �׷��Լ��� �׷��Լ��� �������� ���� �ɷ��� �Բ� �����ϴ� ���, �׷��Լ��� �������� ���� �÷��� �ݵ�� group by ���� �����ؾ� �մϴ�. 

select deptno, count(*), trunc(avg(sal),1), min(sal), max(sal), sum(sal)  -----3
from emp         ----1
group by deptno; ----2 hash ���/ hash ����� ������ ���� X, sorting ������� ����Ǹ� ���� ����

##group by ���� ����� �÷��� select���� �ݵ�� ����Ǿ�� �ϴ� ���� �ƴ�(�ʼ��ƴ�)

��> ��ü ����� Ŀ�̼� ����� ���
select avg(nvl(comm,0)), sum(comm)/count(*)
from emp;  ---null�� ������ �÷��� avg�Լ� ������ �ݵ�� null ó�� �Ŀ� �����ؾ� �մϴ�. 

��> EMP ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����Ͽ���
select 
from emp;

##where �������� group ���� ���� �Ұ�, group by�� ���� ���� �����ϴ� ���� ����

select ~ column, ǥ����, �׷��Լ�ǥ���� , -------5
from ~ ------1
[where ~] -----2 filter  ����
[group by ~] -----3 �÷� ����, (alias, column position  ���� �Ұ�)
[having �׷��Լ� ���� ����] ----4
[order by ~] -----6 �÷�, ǥ����, alias, column position

��> EMP ���̺��� �μ��� �ְ� �޿��� 2900 �̻��� �μ��� ���ؼ� �μ���ȣ,��ձ޿�, �޿��� ���� ��ȸ�Ѵ�