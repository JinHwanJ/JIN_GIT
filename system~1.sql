select lower('Hello World'), upper('Hello World'), initcap('Hello World')
from dual;

select length('korea'),length('���ѹα�'),lengthb('korea'),lengthb('���ѹα�')
from dual;

select concat(ename, concat('work as a', job))
from emp;


#substr :���ڿ��� �Ϻκ��� ���� ����� �ϴ� �Լ�
select substr('Hello World', 7), substr('Hello World', 2, 4), substr('Hello World', -5)
from dual;

#INSTR(string, search_string,position, occurrence):��� ���ڿ��� ã�� �� ��ġ�� ��ȯ�ϴ� �Լ�
select ename, instr(ename,'L'), instr(ename,'L',1,2), instr(ename,'L',4,1)
from emp;


select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1) > 'k'and substr(ename,1,1)<'Y'
order by ename;

#LPAD(expr1, n, [expr2]): expr1�� n �ڸ���ŭ ���ڿ� ���̷� ����� ��ȯ�ϴ� �Լ�
#RPAD(expr1, n, [expr2])

select sal, lpad(sal, 10, '$'), rpad(sal, 10, '$')
from emp;

#LTRIM(char[,set]) �Ķ������ char���� set���� ������ ���ڸ� ���� ���� ������ ������ ����� ��ȯ

select ltrim('Hello World', 'H'), ltrim('Hello World', 'e'), rtrim('Hello World', 'd'), rtrim('Hello World', 'l')
from dual;

#TRIM([LEADING, TRAILING<BOTH],[,trim_char][from]trim_source)

select length('   h  e   ll o   '), trim('   h  e   ll o'), length(trim('   h  e   ll o   '))
from dual;

#TRANSLATE(expr, from_string, to_string) : ���ڿ� �ϳ��� �ϴ��Ϸ� ��ȯ�ϴ� �۾��� ����
#REPLACE(char, search_string, replace_string) : cahr ���ڿ����� search_string ������ ���� ���ڸ� replace_string ������ ��ü�Ͽ� �� ����� ��ȯ

select replace('JACK and JUE','J','BL')
from dual;

select translate('SQL*plus', 'SQL*', '_s3#')
feom dual;

select trim(leading 'A' from 'AABDCADD'), trim('A' from 'AABDCADD'), trim(trailing 'D' from 'AABDCADD')
from dual;

#Q>EMP ���̺��� 20�� �μ��� ����� ���Ͽ� ��� ���� �� ������ 'A'�� �����ϰ� �޿� �� ������ 1�� �����Ͽ� ����Ͽ���.
select  ename, job,ltrim(job,'A'),sal, ltrim(sal, 1)
from emp
where deptno = 20;

Q> EMP ���̺��� 10�� �μ��� ����� ���Ͽ� ��� ���� �� ������ 'T'�� �����ϰ� �޿� �� ������ 0�� �����Ͽ� ����Ͽ���
select  ename, job,rtrim(job,'T'),sal, rtrim(sal, 0)
from emp
where deptno = 10;

Q> REPACE�Լ��� ����Ͽ� ����̸��� SC���ڿ��� *?�� �����ؼ� ��ȸ�϶�
select ename,replace(ename,'SC','*?')
from emp
where deptno = 20;

Q> TRANSLATE�Լ��� ����Ͽ� ����̸��� SC���ڿ��� *?�� �����ؼ� ��ȸ�϶�
select ename,translate(ename,'SC','*?')
from emp
where deptno = 20;

#######################################################

#ROUND(n,[m]) �ݿø�
#TRUNC(n,[m]) ����
#SIGN(n) n�� 0���� Ŭ ��� 1,0 ���� ������� -1,0 �� ��� 0�� ��ȯ�Ѵ�.
#POWER(n1, n2) n1�� n2 �������� ���ϴ� �Լ�
#MOD(n1, n2) n1�� n2�� ������ ���� ���� ��ȯ


#Q emp���̺��� �޿��� 30���� ���� ������ ���Ͽ� ���
select  ename, sal, mod(sal, 30)
from emp


#Q emp���̺��� ����� Ȧ���� ����������
select empno, ename, sal
from emp
where mod(empno,2)=1;

select ename, sal, sign(sal-3000)
from emp
where deptno = 20;

#########################################################
��¥�Լ�
#date
#TIMESTAMP  date+10�� 1�� �������� ǥ�� �� ����
#TIMESTAMP WITH TIMEZONE (+9:00)
#INTERVAL YEAR TO MONTH �Ⱓ
#INTERVAL DAY TO SECOND(TIMESTAMP) �Ⱓ

#SYSDATE: �����ͺ��̽� ������ ���� ��¥ �� �ð��� ��ȯ�ϴ� ��¥ �Լ�
#SYSTIMESTAMP: �����ͺ��̽� ������ ���� ��¥�� �ð��� TIMESTAMP WITH TIMEZONE ������ ������ ������ ��ȯ
#CURRENT_DATE : session�� timezone ������� ���� ���� �� �ð��� ��ȯ�ϴ� ��¥ �Լ�
#CURRENT_TIMESTAMP: session�� timezone ������� ���� ��¥�� �ð��� TIMESTAMP WITH TIMEZONE ������ ������ ������ ��ȯ

select sysdate, systimestamp, current_date, current_timestamp, sessiontimezone
from dual;


Q> EMP���̺��� ��������� �ٹ��ϼ��� �� �� �����ΰ��� ��ȸ�Ѵ�
select ename, hiredate, sysdate, sysdate-hiredate "Total Days",trunc((sysdate-hiredate)/7,0)Weeks, round(mod((sysdate-hiredate),7),0)DAYS
from emp;

#EXTRACT : datetime �ʵ带 �̿��ؼ� �⵵, ��, ��, ��, ��, �ʸ� �����ؼ� numeric���� ��ȯ

select extract(day from sysdate),  extract(month from sysdate),  extract(year from sysdate) 
from dual;

select extract(timezone_region from current_timestamp), extract(timezone_abbr from current_timestamp), to_char(systimestamp,'HH24')
from dual
select current_timestamp from dual;

#MONTHS_BETWEEN(date1, date2): �� ��¥ ������ ���� �� ��ȯ
#ADD_MONTHS(date, integer): ��¥�� ���� ���� ���� �� �� ����� ��ȯ
#NEXT_DAY(date, char): ������ date ������ ��¥ �߿��� char�� ��õ� ���Ͽ� �ش�Ǵ� ù ��° ���ڸ� ��ȯ
#RONUD(date, fmt)
#ROUND(date, fmt)

#��¥���� fmt(format text)�� TEAR, YYYY, YYY, YY, Y, Q, MONTH, MON, MM, DD, HH, MI, SS

Q>EMP ���̺��� 10�� �μ� ����� ��������� �ٹ� ������ ����Ͽ� ��ȸ�Ѵ�.
select ename, hiredate, sysdate, months_between(sysdate, hiredate)m_between, trunc(months_between(sysdate, hiredate),0)t_between
from emp
where deptno = 10;

Q> EMP ���̺��� �Ի� ���ڷκ��� 5������ ���� �� ��¥�� ����Ͽ� ���
select ename, hiredate, add_months(hiredate, 5)a_month
from emp;

Q> EMP ���̺��� �Ի� ���ڷκ��� ���ƿ��� �ݿ���, ������� ����Ͽ� ��ȸ
select ename, hiredate, next_day(hiredate, ��)n_6, next_day(hiredate, ��)n_7
from emp;




#####################################################
CONVERSION �Լ�


select 10||10 
from dual;

select '10'+'10' 
from dual;

select sal, to_char(sal, '$999,999.000') from emp;

select to_number('$12,334.50','$99,999.00') from dual;

select to_date('2022�� 1�� 3��', 'YYYY"��" MM"��" dd"��"' )
from dual;

Q> ���ó�¥�� 1�� �� ���° ������ ��ȸ�Ѵ�.
select to_char(sysdate,'WW')
from dual;

sysdate :�ý��ۻ� ��¥
WW :�ϳ��� ���° ������
## ��¥�� ���� �����ʹ� ' '�����༭ ǥ��
##alias���� ��ҹ��� �����ϰų� ���� �����ϰ� ���� ��� "alias"
##��ȯ�Լ��� fmt string�� ��ȿ���� �ʴ� ���ڸ� �����Ϸ���  'yyyy "of " month '

select sysdate, sysdate + to_dsinterval('003 11:25:33') as "���"
from dual;

Q> ����� �̸�, �Ի���, �Ի�����, �Ի��Ͽ��� 1��6���� ���� ��¥�� ��ȸ
select ename, hiredate, hiredate + to_yminterval('01-06')
from emp;

select ename, hiredate, ADD_MONTHS(hiredate, 18)
from emp;

