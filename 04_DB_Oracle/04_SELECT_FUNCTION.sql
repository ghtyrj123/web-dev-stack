/*
    함수 : 컬럼값을 읽어서 가공된 값을 반환 
    
    -단일행 함수 : N개의 값을 받아서 N개의 결과 반환
    -그룹 함수 : N개의 값을 받아서 1개의 결과 반환
    
    >> 단일행 함수와 그룹 함수는 SELECT 절에서 함께 사용할 수 없음!
    >> 함수를 사용할 수 있는 위치: SELECT, WHERE, ODDER BY, GROUP BY, HAVING
    

*/

-- 단일행 함수
/*
    문자 처리 함수  
    
    LENGTH : 문자 수 반환
    -한글 1글자 -> 1
    -영문자/숫자/특수문자 -> 1
    
    
    LENGTHB : 바이트 수 반환
    -한글 1글자 >3바이트
    - 영문자/숫자/특수문자 ->1바이트
*/

SELECT
    LENGTH('데이터베이스'), LENGTHB('데이터베이스'),
    LENGTH('database'), LENGTHB('database')
    FROM DUAL; --가상 테이블
    
    /*
        INSTR (컬럼, 찾을문자, 시작위치, 몇변째)
        - 특정 문자가 몃 번째 위치하는지 반환
        - 없으면 0 반환
        - 시작위치 : 1 (앞에서부터), -1 (뒤에서부터)
        */

SELECT 
    INSTR('AABAACAABBAA', 'B', -1, 2), --뒤에서부터 2번째에 있는 B
    INSTR('AABAACAABBAA', 'D')
    FROM DUAL;
    
-- USER_INFO에서 각 전화번호(CONTACT)에서 앞에서부터 5가 들어간 위치 조회

SELECT NAME, CONTACT,
    INSTR(CONTACT, 5)
    FROM USER_INFO;

--EMPLOYEE에서 's'가 포함되어 있는 이메일 중 @위치 조회
SELECT EMAIL,
    INSTR(EMAIL, '@')
    FROM EMPLOYEE
    WHERE EMAIL LIKE '%s%';
    
    /*
        LPAD / RPAD(컬럼, 최종적으로 반환할 문자의 길이, 덧붓이거자 하는 문자)
        - 문자열을 조회 시 통일감있게 조회하고자 할 때 사용
        
    */
SELECT 
    LPAD('HELLO', 10), LPAD('HELLO', 10, 'A'),
    RPAD('HELLO', 10),  RPAD('HELLO', 10, 'A')
    FROM DUAL;
    
    
    /*
        LTRIM / RTRIM(컬럼, 재거하고자 하는 문자들)
        -문자열에서 특정 문자를 제거한 나머지를 반환
    */
SELECT
    LTRIM('     K H     '), -- <-- 왼쪽 공백 재거
    LTRIM('ACBAACCCKH', 'ABC'), -- 왼쪽에서 ABC에 행당하는 문자들 제거 
    RTRIM('46548518KH54568', '0123456789') -- 오른쪽에서 해당하는 숫자들 제거
    FROM DUAL;
    
    /*
        TRIM(LEADING | TRAILING | BOTH 제거하고자 하는 문자들 FROM 컬럼)
        문자열 양쪽(앞/뒤) 에 있는 지정한 문자들을 제거한 나머지 문자열 반환
        */
        
SELECT  
    TRIM(LEADING 'Z' FROM 'ZZZKHZZZ'), --LTRIM
    TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ'), -- RTRIM
    TRIM(BOTH 'Z' FROM 'ZZZKHZZZ'), -- 양족 모두 제거
    TRIM('        KH        ')
FROM DUAL;


/*
    SUBSTR(컬럼, 시작위치, 추출 길이)
    -문자열에서 특정 부분을 잘라서 추출
    */
SELECT 
    SUBSTR('PROGRAMMING', 5, 2), --RA
    SUBSTR('PROGRAMMING', 1, 6), -- PROGRA
    SUBSTR('PROGRAMMING', -8, 3) -- GRA
    FROM DUAL;
    
    
-- USER_INFO에서 전화번호(CONTACT)에서 가운데 번호 4자리만 조회 \
SELECT NAME,
 SUBSTR(CONTACT, INSTR(CONTACT, '-') + 1, 4),
 INSTR(CONTACT, '-') + 1
 FROM USER_INFO;

    


-- EMPLOYEE에서 이메일에서 아이디만 (@ 앞에) 조회
SELECT EMP_NAME, 
INSTR(EMIAL, '@'),SUBSTR(EMIAL, 1, INSTR(EMIAL, '@') -1)
FROM EMPLOYEE;

SELECT EMAIL, REPLACE(EMAIL, '@kh.or.kr', '')
FROM USER_INFO;

   
   


-- 주민 등록번호(EMP_NO)를 000000-0****** 로 조회
SELECT EMP_NAME, EMP_NO, 

RPAD(SUBSTR(EMP_NO, 1 ,INSTR(EMP_NO, '-')+1),14, '*'),
SUBSTR(EMP_NO, 1, 8) || '******',
INSTR(EMP_NO, '-') + 1



     
FROM EMPLOYEE;


SELECT EMP_NO,
REPLACE (EMP_NO,SUBSTR(EMP_NO, -6, 6) , '******')

FROM EMPLOYEE;

-- 남자 사원들만 조회
SELECT EMP_NAME, EMP_NO ,
 INSTR(EMP_NO, '-') +1, 
 SUBSTR(EMP_NO, INSTR(EMP_NO, '-')+1, 1)
 FROM EMPLOYEE
 WHERE  SUBSTR(EMP_NO, INSTR(EMP_NO, '-')+1, 1) =1;
 
 /*
    LOWER : 다소문자로 변경
    UPPER : 다 대문자로 변경
    
    
 
 */
 SELECT LOWER('WELCOME'), UPPER('WELCOME')
 FROM DUAL;
 
 /*
    CONCAT(문자열, 문자열)
    - 문자열 두 개 전달받아 하나로 합친 후 결과 반환
 */

-- 가나다라, 1234를 합치기

SELECT CONCAT('가나다라', '1234')
FROM DUAL;
SELECT '가나다라' || '1234' FROM DUAL;
-- 가나다라 ,ABCD, 1234를 합치기
SELECT '가나다라' || ' ABCD' || ' 1234'
FROM DUAL;
SELECT CONCAT(CONCAT('가나다라', 'ABCD'), '1234')
FROM DUAL;

/*
    REPLACE(컬럼, 바꾸고 싶은 문자열, 바꿀 문자열)
    - 특정 문자열로 변경
*/

SELECT REPLACE('서울시 강남구 역삼동', '역삼동', '삼성동') FROM DUAL;

---USER _INFO에서 서울이신 분들을 모두 경기로 바꾸기
SELECT ADDRESS,
REPLACE(ADDRESS, '서울', '경기') 
FROM USER_INFO;

-- EMPLOYEE에서 사원들의 이메일 kh.or.kr을 gmail.com으로 바꾸기

SELECT EMAIL,
REPLACE(EMAIL, 'kh.or.kr', 'gmall.com')
FROM EMPLOYEE;

/* 
    숫자 처리 함수
    
    ABS : 절대값 변환
    MOD(숫자, 숫자) : 두 수를 나눈 나머지 값 변환
    CEIL : 올림
    FLOOR : 내림
    
*/  

SELECT ABS(5.7), ABS(-10),
MOD(10, 3), --1
CEIL(123.152), FLOOR(123.952)

FROM DUAL;

/*
    ROUND(숫자, 위치)
    - 반올림한 결과 반환
*/
SELECT 
    ROUND(123.456), --123(위ㅣ 생략시 0)
    ROUND(123.456,1), --123.5 소숫점 첫째자리 까지
    ROUND(123.456, -2) --100
    FROM DUAL;
    
/*
    TRUNC(숫자, 위치)
    -위치 지정하여 버림 처리 
*/
SELECT
    TRUNC(123.952), --123
     TRUNC(123.952, 1) --123.9
    FROM DUAL;
    
/*
    날짜 처리 함수
    
    SYSDATE : 시스템의 날짜를 반환 (현재 날짜);
*/

SELECT SYSDATE FROM DUAL;

--날짜 포맷 변경


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
ALTER SESSION SET NLS_DATE_FORMAT ='DD/MM/YY'; -- 원래 포맷
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD HH24:MI:SS';

/*
    MONTHS_BETWEEN(날짜, 날짜)
    - 입력받은 두 날짜 사이의 개월 수 변환
*/
SELECT FLOOR(MONTHS_BETWEEN('20251216', SYSDATE)) FROM DUAL; -- 6개월 남음

--USER_INFO에서 몃개월생인지 조회 (BLRTHDATE)
SELECT BIRTHDATE,
FLOOR(MONTHS_BETWEEN(SYSDATE, BIRTHDATE))

FROM USER_INFO;

/*
    ADD_MONTHS(날자, 숫자)
    - 특정 날짜에 입력받는 숫자만큼 개월 수를 더한 날짜 반환
*/

SELECT ADD_MONTHS(SYSDATE, 2)
FROM DUAL;

-- USER_INFO에서 해당 태어난 날짜부터 20년이 지났을 경우

SELECT BIRTHDATE,
ADD_MONTHS(BIRTHDATE, 240)
FROM USER_INFO;

/*
    NEXT_DAY(날짜, 요일(문자/숫자))
    -특정 날짜에서 구하려는 요일의 가장 가까운 날짜 리턴
    -요일 : 1 - 일요일, 2 - 월요일 ,... 7 - 토요일

*/

SELECT SYSDATE, NEXT_DAY(SYSDATE, 'MONDAY') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '금') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 1) FROM DUAL;

-- 언어 변경
ALTER SESSION SET NLS_LANGUAGE = KOREAN;
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;

/*
    LAST_DAY(날짜)
    -행당 월의 마지막 날짜 반환

*/
SELECT 
    LAST_DAY(SYSDATE), LAST_DAY('20250815'), LAST_DAY('25/12/16')
    FROM DUAL;

/*
    EXTRACT(YEAR|MONTH|DAY FROM 날짜)
    - 특정 날짜에서 연도, 월, 일 정보를 추출
    
*/

--USER_INFO에서 DIRTHDATE로 연도, 월, 일 따로 조회
SELECT BIRTHDATE,
EXTRACT (YEAR FROM BIRTHDATE) 연도,
EXTRACT (MONTH FROM BIRTHDATE) 월,
EXTRACT (DAY FROM BIRTHDATE) 일
FROM USER_INFO;


/*
    형 변환 함수
    
    TO_CHAR(날짜 | 숫자, 포맷)
    - 날짜 또는 숫자형 데이터를 문자 타입으로 변환

*/
SELECT TO_CHAR(1234, 'L99,999') FROM DUAL; --현제 설정된 화폐 단위

ALTER SESSION SET NLS_CURRENCY = '$';

--EMPLOYEE에서 연봉을 TO_CHAR를 이용해서 조회 (,)
SELECT 
TO_CHAR(SALARY * 12, '999,999,999') 연봉
FROM EMPLOYEE
ORDER BY 연봉; --별칭으로도 정렬 가능

-- 날자 --> 문자
SELECT 
    TO_CHAR(SYSDATE, 'YYYY'), --년 : YYYY, YY, RRRR, RR, YEAR
    TO_CHAR(SYSDATE, 'MM'), --월 : MM, MON, MONTH, RM
    TO_CHAR(SYSDATE, 'DD'), --일 : D -주 (일-1, ..),DD -월, DDD - 년 기준 
    TO_CHAR(SYSDATE, 'DAY'), --요일 : DY, DAY
    TO_CHAR(SYSDATE, 'PM:HH:MI:SS'), --시분초
    TO_CHAR(SYSDATE, 'AM:HH24:MI:SS')
    FROM DUAL;
    
-- BIRTHDATE를 '2025년 06월 04일 수요일' 포멧으로 조회

SELECT BIRTHDATE,
TO_CHAR(BIRTHDATE,  'YYYY"년" MM"월" DD"일" DAY')
FROM USER_INFO;

/*
    TO_DATE(숫자|문자,포맷)
    -숫자 또는 문자형 데이터를 날짜 타임으로 변환
*/
-- 숫자 -> 날짜
SELECT TO_DATE(20250604) FROM DUAL;
SELECT TO_DATE(20250604164230, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
    
--문자 --> 날짜
SELECT TO_DATE('20250604') FROM DUAL;
SELECT TO_DATE('20250604164230', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

/*
    TO_NUMBER(문자, 포맷)
    - 문자형 데이터를 숫자 타입으로 변환
*/
SELECT '100000' + '550000' FROM DUAL;
SELECT TO_NUMBER('100,000', '999,999') + TO_NUMBER('550,000', '999,999') FROM DUAL;

/*
    AUL 처리 함수
    
    NVL/COALESCE(값, 값2)
    - 값1이 NULL이 아니면 값1을 반환하고, 값1이 NULL이면 값 2를 반환한다.
*/

-- USER_INFO에서 MBTI가 NULL인 경우 'MBTI 모름 처리'
SELECT MBTI,
NVL(MBTI, 'MBTI 모름')
FROM USER_INFO;

-- CONALESCE (값1, 값2, ....)
--MBTI가 NULL이 아니면 MBTI, NULL이면 HOBBY, 이것또한  NULL이면  '모름' 값을 여러게 처리 가능

SELECT 
COALESCE(MBTI, HOBBY, '모름')
FROM USER_INFO;

/*
    NVL2(값1, 값2, 값3)
    - 값1이 NULL이 아니면 값2, NULL이면 값3
    
*/

-- EMPLOYEE에서 부서코드(DEPT_CODE)가 잇으면 '부서있음' , 없으면 '부서없음'
SELECT 
NVL2(DEPT_CODE,'부서있음', '부서없음')
FROM EMPLOYEE;

/*
    NULLIF(값1, 값2)
    - 두 개의 값이 동일하면 NULL, 동일하지 않으면 값1
    */
    
SELECT NULLIF('123', '123'), NULLIF('123','456')
FROM DUAL;

/*
    선택 함수 : 여러가지 경우에 선택할 수있는 기능을 제공
    
    DECODE(값, 조건값1, 결과값1, 조건값2, 결과값2, ....)
    - 비교하고자 하는 값이 조건값과 일치하는 경우 그에 해당하는 결과값 반환 
    
    CASE WHEN 조건식1 THEN 결과값1
    WHEN 조건식2 THEN 결과값2
    .....
    ELSE 결과값N 
    
    END
*/

-- EMPLOYEE에서 주민번호(EMP_NO)로 성별(남, 여) 조회
SELECT EMP_NO,
SUBSTR(EMP_NO,8,1),
DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여')
FROM EMPLOYEE;


SELECT EMP_NO,
SUBSTR(EMP_NO,8,1), -- 몃번째 문자 // 추출할 번호 갯수
INSTR(EMP_NO, 1, 1)  -- 찾을 문자// 시작위치
FROM EMPLOYEE;

-- 직급 코드가 j7인 사원은 급여를 10%인상
SELECT JOB_CODE,SALARY,
DECODE(JOB_CODE, 'J7', SALARY *1.1, 'J6', SALARY * 1.15, 'J5' , SALARY * 1.2, SALARY * 1.05) "인상된 급여"
FROM EMPLOYEE
ORDER BY JOB_CODE, "인상된 급여" DESC;

SELECT 
EMP_NAME, EMP_NO,
    CASE WHEN SUBSTR(EMP_NO,8,1) =1 THEN '남'
        WHEN SUBSTR(EMP_NO,8,1)= 2 THEN '여'
        END
FROM EMPLOYEE;



-- 직급 코드가 j6인 사원은 급여를 15% 인상
-- 직급 코드가 j5인 사원은 급여를 20%인상
--그외 직급 사원은 급여를 5%인상
-- 정렬 : 직급코드(JOB_CODE) J1부터, 인상된 급여 높은 순서대로



SELECT EMP_NAME, SALARY,
CASE WHEN SALARY > 5000000 THEN '1등급'
    
       WHEN   SALARY > 3500000   THEN '2등급'
     
      WHEN   SALARY > 2000000 THEN '3등급'
      ELSE '4등급'
      END

FROM EMPLOYEE;


SELECT 
    CASE JOB_CODE WHEN  'J7' THEN SALARY * 1.1
      WHEN  'J6' THEN SALARY * 1.15
      WHEN  'J5' THEN SALARY * 1.12
      ELSE SALARY * 1.05 
        
    END "총 인상된 급여"
    FROM EMPLOYEE;

-- 급여가 500만원 초과일 경우 1등급
--급여가 500만원 이하 350만원 초과일 경우 2등급
--급여가 350만원 이하 200만원 초과일 경우 3등급





