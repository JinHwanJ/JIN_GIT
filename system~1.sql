select lower('Hello World'), upper('Hello World'), initcap('Hello World')
from dual;

select length('korea'),length('대한민국'),lengthb('korea'),lengthb('대한민국')
from dual;

select concat(ename, concat('work as a', job))
from emp;


#substr :문자열의 일부분을 뗴어내는 기능을 하는 함수
select substr('Hello World', 7), substr('Hello World', 2, 4), substr('Hello World', -5)
from dual;

#INSTR(string, search_string,position, occurrence):대상 문자열을 찾아 그 위치를 반환하는 함수
select ename, instr(ename,'L'), instr(ename,'L',1,2), instr(ename,'L',4,1)
from emp;


select empno, ename, job, sal, deptno
from emp
where substr(ename,1,1) > 'k'and substr(ename,1,1)<'Y'
order by ename;

#LPAD(expr1, n, [expr2]): expr1을 n 자리만큼 문자열 길이로 만들어 반환하는 함수
#RPAD(expr1, n, [expr2])

select sal, lpad(sal, 10, '$'), rpad(sal, 10, '$')
from emp;

#LTRIM(char[,set]) 파라미터인 char에서 set으로 지정된 문자를 가장 왼쪽 끝에서 제거한 결과를 반환

select ltrim('Hello World', 'H'), ltrim('Hello World', 'e'), rtrim('Hello World', 'd'), rtrim('Hello World', 'l')
from dual;

#TRIM([LEADING, TRAILING<BOTH],[,trim_char][from]trim_source)

select length('   h  e   ll o   '), trim('   h  e   ll o'), length(trim('   h  e   ll o   '))
from dual;

#TRANSLATE(expr, from_string, to_string) : 문자열 하나를 일대일로 반환하는 작업을 수행
#REPLACE(char, search_string, replace_string) : cahr 문자열에서 search_string 값으로 들어온 문자를 replace_string 값으로 대체하여 이 결과를 반환

select replace('JACK and JUE','J','BL')
from dual;

select translate('SQL*plus', 'SQL*', '_s3#')
feom dual;

select trim(leading 'A' from 'AABDCADD'), trim('A' from 'AABDCADD'), trim(trailing 'D' from 'AABDCADD')
from dual;

#Q>EMP 테이블에서 20번 부서의 사원에 대하여 담당 업무 중 좌측에 'A'를 삭제하고 급여 중 좌측의 1을 삭제하여 출력하여라.
select  ename, job,ltrim(job,'A'),sal, ltrim(sal, 1)
from emp
where deptno = 20;

Q> EMP 테이블에서 10번 부서의 사원에 대하여 담당 업무 중 우측에 'T'를 삭제하고 급여 중 우측의 0을 삭제하여 출력하여라
select  ename, job,rtrim(job,'T'),sal, rtrim(sal, 0)
from emp
where deptno = 10;

Q> REPACE함수를 사용하여 사원이름에 SC문자열을 *?로 변경해서 조회하라
select ename,replace(ename,'SC','*?')
from emp
where deptno = 20;

Q> TRANSLATE함수를 사용하여 사원이름에 SC문자열을 *?로 변경해서 조회하라
select ename,translate(ename,'SC','*?')
from emp
where deptno = 20;

#######################################################

#ROUND(n,[m]) 반올림
#TRUNC(n,[m]) 버림
#SIGN(n) n이 0보다 클 경우 1,0 보다 작을경우 -1,0 일 경우 0을 반환한다.
#POWER(n1, n2) n1의 n2 제곱값을 구하는 함수
#MOD(n1, n2) n1을 n2로 나누어 남을 값을 반환


#Q emp테이블에서 급여를 30으로 나눈 나머지 구하여 출력
select  ename, sal, mod(sal, 30)
from emp


#Q emp테이블에서 사번이 홀수인 사원정보출력
select empno, ename, sal
from emp
where mod(empno,2)=1;

select ename, sal, sign(sal-3000)
from emp
where deptno = 20;

#########################################################
날짜함수
#date
#TIMESTAMP  date+10억 1초 단위까지 표현 및 저장
#TIMESTAMP WITH TIMEZONE (+9:00)
#INTERVAL YEAR TO MONTH 기간
#INTERVAL DAY TO SECOND(TIMESTAMP) 기간

#SYSDATE: 데이터베이스 서버의 현재 날짜 및 시간을 반환하는 날짜 함수
#SYSTIMESTAMP: 데이터베이스 서버의 현재 날짜와 시간을 TIMESTAMP WITH TIMEZONE 데이터 유형의 값으로 반환
#CURRENT_DATE : session의 timezone 기반으로 현재 날까 및 시간을 반환하는 날짜 함수
#CURRENT_TIMESTAMP: session의 timezone 기반으로 현재 날짜와 시간을 TIMESTAMP WITH TIMEZONE 데이터 유형의 값으로 반환

select sysdate, systimestamp, current_date, current_timestamp, sessiontimezone
from dual;


Q> EMP테이블에서 현재까지의 근무일수가 몇 주 몇일인가를 조회한다
select ename, hiredate, sysdate, sysdate-hiredate "Total Days",trunc((sysdate-hiredate)/7,0)Weeks, round(mod((sysdate-hiredate),7),0)DAYS
from emp;

#EXTRACT : datetime 필드를 이용해서 년도, 월, 일, 시, 분, 초를 추출해서 numeric값으 반환

select extract(day from sysdate),  extract(month from sysdate),  extract(year from sysdate) 
from dual;

select extract(timezone_region from current_timestamp), extract(timezone_abbr from current_timestamp), to_char(systimestamp,'HH24')
from dual
select current_timestamp from dual;

#MONTHS_BETWEEN(date1, date2): 두 날짜 사이의 개월 수 반환
#ADD_MONTHS(date, integer): 날짜에 개월 수를 더한 뒤 그 결과를 반환
#NEXT_DAY(date, char): 지정한 date 이후의 날짜 중에서 char로 명시된 요일에 해당되는 첫 번째 일자를 반환
#RONUD(date, fmt)
#ROUND(date, fmt)

#날짜관련 fmt(format text)는 TEAR, YYYY, YYY, YY, Y, Q, MONTH, MON, MM, DD, HH, MI, SS

Q>EMP 테이블에서 10번 부서 사원의 현재까지의 근무 월수를 계산하여 조회한다.
select ename, hiredate, sysdate, months_between(sysdate, hiredate)m_between, trunc(months_between(sysdate, hiredate),0)t_between
from emp
where deptno = 10;

Q> EMP 테이블에서 입사 일자로부터 5개월이 지난 후 날짜를 계산하여 출력
select ename, hiredate, add_months(hiredate, 5)a_month
from emp;

Q> EMP 테이블에서 입사 일자로부터 돌아오는 금요일, 토요일을 계산하여 조회
select ename, hiredate, next_day(hiredate, 금)n_6, next_day(hiredate, 토)n_7
from emp;




#####################################################
CONVERSION 함수


select 10||10 
from dual;

select '10'+'10' 
from dual;

select sal, to_char(sal, '$999,999.000') from emp;

select to_number('$12,334.50','$99,999.00') from dual;

select to_date('2022년 1월 3일', 'YYYY"년" MM"월" dd"일"' )
from dual;

Q> 오늘날짜가 1년 중 몇번째 주인지 조회한다.
select to_char(sysdate,'WW')
from dual;

sysdate :시스템상 날짜
WW :일년중 몇번째 주인지
## 날짜와 문자 데이터는 ' '감싸줘서 표현
##alias에서 대소문자 구별하거나 공백 포함하고 싶은 경우 "alias"
##변환함수에 fmt string에 유효하지 않는 문자를 포함하려면  'yyyy "of " month '

select sysdate, sysdate + to_dsinterval('003 11:25:33') as "결과"
from dual;

Q> 사원의 이름, 입사일, 입사일자, 입사일에서 1년6개월 후의 날짜를 조회
select ename, hiredate, hiredate + to_yminterval('01-06')
from emp;

select ename, hiredate, ADD_MONTHS(hiredate, 18)
from emp;

