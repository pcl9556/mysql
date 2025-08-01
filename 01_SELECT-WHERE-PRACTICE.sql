-- 2 
select
        emp_name
       , emp_id
       from employee;
  
-- 3
select
       dept_code 
 from employee
 where dept_code = 'D9';
 -- 4      
select
        EMP_NAME
		,salary
   from employee
   where salary > 3000000;
   
-- 5
select
       EMP_NAME
       ,dept_code
       ,salary
  from employee
  where DEPT_CODE = 'D6'
  and SALARY >2000000;
  
-- 6


-- 7
select
      EMP_NAME
      ,EMP_ID
      ,salary
      ,DEPT_CODE
      ,JOB_CODE
 from employee
 where salary between 3500000 and 5500000;
-- 8
select
      emp_ID
      ,EMP_NAME
      ,HIRE_DATE
  from employee
  where EMP_NAME like '%김%'
  and EMP_ID
  and HIRE_DATE;
 -- 9
 select
       EMP_NAME
       ,EMP_NO
       ,JOB_CODE
  from employee
  where EMP_NAME like '%하%';
  
 -- 10 
 select
       phone
       ,EMP_NO
       ,EMP_NAME
 from employee
 where PHONE;
 
 -- 11
 
      
 
 
-- 12 
 select
       DEPT_CODE
       ,EMP_NAME
       ,SALARY
  from employee      
where  DEPT_CODE in ('D6' or 'D8');
 
       
 -- 13
 select
       EMP_NAME
       ,EMAIL
       ,EMP_NO
 from employee
 where EMP_NAME not like '이%' ;
 
-- 14 
 select
       JOB_CODE
       ,SALARY
       ,EMP_NAME
from employee
where JOB_CODE = 'J7'
or SALARY >=2000000
and JOB_CODE = 'J2';
         

-- ================= JOIN ================== --
-- 1
select
       JOB_CODE
       ,LOCAL_NAME;
       
       
       
       
-- 2. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 전씨인 직원의 이름, 주민등록번호, 부서명, 직급명을 조회하세요
       
       
-- 3. 이름에 '형'자가 들어가는 직원의 사번, 이름, 직급명을 조회하세요.
select
       a.EMP_NAME 
       ,a.EMP_ID
       ,b.JOB_NAME
 from employee a
 right join job b on a.EMP_NAME = b.JOB_NAME like '%형%';  
	   
-- 4 해외영업팀에 근무하는 직원의 이름, 직급명, 부서코드, 부서명을 조회하세요.
select
       b.DEPT_ID
       ,a.EMP_NAME
       ,a.DEPT_CODE
from employee a
left join department b on ('D5','D6','D7');

-- 5. 보너스포인트를 받는 직원의 이름, 보너스, 부서명, 지역명을 조회하세요.
select
       BONUS
       ,EMP_NAME
       ,DEPT_ID;
       
-- 6. 부서코드가 D2인 직원의 이름, 직급명, 부서명, 지역명을 조회하세오.
select
      a.DEPT_CODE
      ,EMP_NAME
      ,JOB_NAME
      ,DEPT_TITLE
      ,NATIONAL_NAME
from employee
cross join DEPT_CODE a on 'D2';      
