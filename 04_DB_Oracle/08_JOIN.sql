/*
    JOIN
    - 두 개 이상의 테이블에서 데이터를 조회하고자 할 때 사용되는 구문
    - 조회 경과는 하나의 결과물(RESULT SET )으로 나옴
    
    -관계형 데이터베이스는 최소한의 데이터로 각각의 테이블에 담고 있음
    (중복을 최소화 하기위해 최대한 쪼개서 관리함)
    
    부서 데이터는 부서 테이블, 사원 데이터는 사원 테이블, ...
    
    만약 어떤 사원이 어떤 부서에 속해있는지 부서명과 같이 조회하고 싶다면?
    
    => 즉, 관계형 데이터베이스에서 SQL문을 이영한 테이블 간에 "관계"를 맺어 원하는 데이터를 조회하는 방법
    
    "오라클 구문"과 "ANSI 구문"
    ANSI(미국국립표준협회 == 산업표준을 제정하는 단체)
*/

/*
    등가 조인()EQUAL JOIN) / 내부 조인(INNER/NATURAL JOIN)
    - 연결시키는 컬럼의 값이 일치하는 행들만 조인되서 조회
    
    오라클 구문
    SELECT 컬럼, 컬럼 ....
    FROM 테이블1, 테이블2
    WHERE 테이블1.컬럼 = 테이블2.컬럼;
    
    ANSI 구문
    SELECT 컬럼, 컬럼, ...
    FROM 테이블1
    JOIN 테이블1
        JOIN 테이블2 ON (테이블1.컬럼 = 테이블2.컬럼);
    - FROM 절에서 기준이 되는 테이블 기술
    - JOIN 절에서 같이 조회하고자 하는 테이블을 기술 후 매칭시킬 컬럼에 대한 조건을 기술 (USING 또는 ON)
        --> 연결에 사용하는 컬럼명이 같은 경우 USING(컬럼명)


*/
-- EMPLOYEE, DEPARTMENT 조인해서 사번(EMP_ID),사원명 (EMP_NAME) 부서코드(DEPT_CODE), 부서명(DEPT_NAME) 조회
--오라클 구문
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE ;
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;
--오라클 구문
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

--ANSI 구문
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
    JOIN DEPARMENT ON (DEPT_CODE = DEPT_ID);


SELECT * FROM DEPARTMENT; --DEPT_ID, DEPT_TITLE

-- 사번(EMP_ID), 사원명(EMP_NAME), 직급코드(JOB_COED), 직급명(JOB_NAME)
--테이블 : EMPLOYEE, JOB
-- 연결한 두 컬럼이 같은 경우
-- 1. 테이블명을 이용
-- 오라클 구문

SELECT EMP_ID, EMP_NAME, JOB.JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
    WHERE EMPLOYEE.JOB_CODE =JOB_CODE;
    
    --2. 테이블에 별칭을 부여해서 이용
    --ANSI 구문
    
    
    SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
    FROM EMPLOYEE E
    JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);
    
    -- 컬럼명이 같은 경우는 USING 사용을 추천!
    
       
    SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
    FROM EMPLOYEE 
    JOIN JOB  USING ( JOB_CODE);
    
    -- 자연 조인(NATURAL JOIN) : 각 테이블마다 동일한 컬럼이 한 개만 존재할 경우
    SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
    FROM EMPLOYEE 
        NATURAL JOIN JOB;
-- 직급이 대리인 사원의
-- 직급이 대리인 사원의 사번(EMP_ID), 이름(EMP_NAME), 직급명(JOB_NAME), 급여 조회(SALARY) 조회

SELECT * FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME,JOB_CODE, JOB_NAME, SALARY
    FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
    WHERE JOB_NAME = '대리';
    
-- 부서가 인사관리부인 사원들의 사번, 이름, 보너스 조회


SELECT EMP_ID, EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
    JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
    WHERE DEPT_TITLE = '인사관리부';

SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM  LOCATION;

-- DEPARTMEN 랑 LOCATION 참고해서
-- 전체 부서의 부서코드, 부서명, 지역코드, 지역명 조회

SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_NAME
FROM DEPARTMENT 
    JOIN  LOCATION ON (LOCATION_ID = LOCAL_CODE);




-- 부서가 총무부가 아닌 사원들의 사원명, 급여 조회

SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
    WHERE DEPT_TITLE != '총무부';
    


SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;

/*
    포괄 조인 / 외부 조인 (OUT JOIN)
    - 두 테이블 간의 JOIN 시 일피하지 않는 행도 포함시켜서 조회가 가능
    - 단, 반드시 기준이 되는 테이블(컬럼)을 지정해야 한다

*/

-- 사원명, 부서명 조회
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE 
    LEFT JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE);
    --기준 삼는 테이블의 반대 테이블의 컬럼 뒤에 (+)
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID(+) = DEPT_CODE;

-- RIGHT JOIN
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE 
    RIGHT JOIN  DEPARTMENT ON (DEPT_ID = DEPT_CODE);
    
-- FULL JOIN = LEFT + RIGHT
SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYEE 
    FULL JOIN  DEPARTMENT ON (DEPT_ID = DEPT_CODE);


/*
    비등가 조인(NON EQUAL JOIN)
    - 매칭시킬 컬럼에 대한 조건 작성시 '=' (등호)를 사용하지 않는 조인문
    ---> 값에 범위에 포함되는 행동을 연결하는 방식
    -ANSI 구문으로는 JOIN ON으로만 사용가능! (USING 사용 불가)
*/
-- 사원명, 급여, 급여 레벨 조회 (ON BETWEEN 사용)
SELECT SAL_LEVEL, MIN_SAL, MAX_SAL  FROM SAL_GRADE;

SELECT EMP_ID, SALARY, SAL_LEVEL
FROM EMPLOYEE
    JOIN SAL_GRADE ON(SALARY BETWEEN MIN_SAL AND MAX_SAL);
SELECT * FROM EMPLOYEE ; 
---

/*
    자체 조인(SELF JOIN)
    -같은 테이블을 다시 한번 조인하는 경우 (자기 자신과 조인) -> 대댓글
    

*/

-- 사원사번, 사원명, 사원부서코드, 사수사번, 사수명, 사수부서코드 조회

SELECT E.EMP_ID 사번, E.EMP_NAME 사원명, E.DEPT_CODE 사원부서코드, E.MANAGER_ID 사숫사번, M.EMP_NAME 사수명, M.DEPT_CODE 사수부서코드
FROM EMPLOYEE E
JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID);

  

SELECT * FROM EMP_MANAGER, ;

/*
    카테시안곱(CATESIAN PRODUCT) / 교차 조인(CROSS JOIN)
    - 조인되는 모든 테이블의 각 행들이 설 모두 매핑된 데이터가 검색 (곱집합)
    -두 테이블의 행들이 모두 곱해진 행들의 조합이 출력
    -> 방대한 데이터 출력으로 과부하
    

*/

SELECT EMP_NAME, DEPT_TITLE
FROM EMPLOYYE
    CROSS JOIN DEPARYMENT;
    
    SELECT * FROM EMPLOYEE; ---23
    SELECT * FROM DEPARYMENT; ---9

/*
    다중 JOIN
    - 여러 개의 테이블을 조인하는 경우



*/
-- 사원명, 부서명, 직급명 조회
-- EMPLOYEE, DEPARTMENT, JOB

SELECT EMP_NAME, DEPT_TITLE,  JOB_NAME
FROM EMPLOYEE
    JOIN  DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN JOB USING(JOB_CODE);
     
-- 국가명, 지역명, 직급명, 부서명, 사원명, 급여, 급여등급 초회
-- NATIONAL, LOCATION, JOB, DEPARTMENT, EMPLOYEE, SAL_GRADE

SELECT NATIONAL_NAME, LOCAL_NAME, JOB_NAME,DEPT_TITLE, EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE
   
    
   LEFT JOIN JOB USING (JOB_CODE)
    LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
     LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
     LEFT JOIN NATIONAL USING (NATIONAL_CODE)
    LEFT JOIN SAL_GRADE ON (SALARY BETWEEN MIN_SAL AND MAX_SAL);
    


SELECT * FROM    NATIONAL;
SELECT * FROM SAL_GRADE;
SELECT * FROM  DEPARTMENT;
SELECT * FROM LOCATION ;
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;


-- 1. 직급이 대리이면서 ASIA 지역에서 근무하는 직원들의 사번, 직원명, 직급명, 부서명, 근무지역, 급여 조회
SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE, LOCAL_NAME, SALARY
FROM EMPLOYEE
    JOIN JOB USING (JOB_CODE)
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
    WHERE JOB_NAME = '대리' AND LOCAL_NAME  LIKE 'ASIA%';

-- 2. 70년대생 이면서 여자이고, 성이 전씨인 직원들의 직원명, 주민번호, 부서명, 직급명 조회
    SELECT EMP_NAME,EMP_NO, DEPT_TITLE, JOB_NAME
    FROM EMPLOYEE
        JOIN  DEPARTMENT ON (DEPT_CODE = DEPT_ID)
        JOIN  JOB USING (JOB_CODE)
        WHERE EMP_NO LIKE '7_____-2%'AND EMP_NAME LIKE '전%';
-- 3. 보너스를 받는 직원들의 직원명, 보너스, 연봉, 부서명, 근무지역 조회 (단, 부서 배치 안된 사원들도 출력)
SELECT EMP_NAME, BONUS, SALARY * 12, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE
      LEFT  JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
       LEFT JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
       WHERE BONUS IS  NOT NULL;
       
-- 4. 각 부서별 평균 급여를 조회하여 부서명, 평균 급여 조회 (단, 부서 배치 안된 사원들의 평균도 같이)

SELECT
NVL(DEPT_TITLE, '부서없음') 부서,
DEPT_TITLE, TO_CHAR(ROUND(AVG(SALARY)), '999,999,999') 평균급여
FROM EMPLOYEE
   LEFT JOIN  DEPARTMENT ON (DEPT_CODE = DEPT_ID)
   GROUP BY DEPT_TITLE;
    
-- 5. 각 부서별 총 급여의 합이 1000만원 이상인 부서명, 급여의 합 조회
    SELECT DEPT_TITLE, SUM(SALARY)
    FROM EMPLOYEE
        JOIN DEPARTMENT ON (DEPT_CODE =DEPT_ID)
        GROUP BY DEPT_TITLE
        HAVING SUM(SALARY) >= 10000000;

-- 6. 사번, 직원명, 직급명, 급여 등급, 구분 조회
-- 이때 구분은 급여 등급이 S1, S2인 경우 '고급', S3, S4인 경우 '중급', S5, S6인 경우 '초급'

SELECT EMP_ID, EMP_NAME, JOB_NAME, SAL_LEVEL,
 CASE WHEN  SAL_LEVEL = 'S1'
    THEN '고급'
    WHEN  SAL_LEVEL = 'S2'
    THEN '고급'
    WHEN  SAL_LEVEL = 'S3'
    THEN '중급'
  WHEN SAL_LEVEL = 'S4'
    THEN '중급'
    WHEN  SAL_LEVEL = 'S5'
    THEN '초급' 
  WHEN  SAL_LEVEL = 'S6'
    THEN '초급'  END 등급
FROM EMPLOYEE
    JOIN JOB USING (JOB_CODE)
    JOIN SAL_GRADE ON (SALARY BETWEEN MIN_SAL AND MAX_SAL);
   
-- 7. 보너스를 받지 않는 직원들 중 직급 코드가 J4 또는 J7인 직원들의 직원명, 직급명, 급여 조회
    SELECT EMP_NAME, JOB_NAME, SALARY,BONUS
    FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
    WHERE JOB_CODE  IN ('J4', 'J7') AND BONUS IS NULL;
    
-- 8. 부서가 있는 직원들의 직원명, 직급명, 부서명, 근무 지역 조회
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE
 LEFT JOIN JOB USING (JOB_CODE)
   LEFT  JOIN  DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    LEFT JOIN  LOCATION ON (LOCATION_ID = LOCAL_CODE)
    WHERE DEPT_CODE IS NOT NULL ;
    
-- 9. 해외영업팀에 근무하는 직원들의 직원명, 직급명, 부서코드, 부서명 조회
SELECT EMP_NAME, JOB_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
    JOIN  DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    WHERE DEPT_TITLE LIKE '해외영업%';

-- 10. 이름에 '형'자가 들어있는 직원들의 사번, 직원명, 직급명 조회
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE
    JOIN JOB USING (JOB_CODE)
    WHERE EMP_NAME LIKE '%형%';

-- 테이블 : USER_INFO, REVIEW, MOVIE, ACTOR, MOVIE_ACTOR
-- 11. 영화 제목, 감독, 출연한 배우 조회
SELECT TITLE, DIRECTOR, NAME
FROM MOVIE 
JOIN MOVIE USING(MOVIE_ID)
JOIN ACTOR USING(ACTOR_ID);


-- 12. 평점이 3점 이상인 리뷰 영화 제목과 이름, 평점 조회
SELECT TITLE, NAME, RATING
FROM REVIEW
    JOIN USER_INFO USING(USER_ID)
    JOIN MOVIE USING(MOVIE_ID)
    WHERE RATING >= 3;
-- 13. 사용자별 리뷰 수 조회

SELECT NAME USER_ID, COUNT(*)
FROM REVIEW
    JOIN USER_INFO USING(USER_ID)
GROUP BY NAME;

SELECT ;
-- 14. 최동훈 감독의 영화에 출연한 배우 조회

SELECT TITLE, DIRECTOR, ROLE,  NAME
FROM REVIEW
    JOIN MOVIE  USING(MOVIE_ID)
    JOIN MOVIE_ACTOR USING (MOVIE_ID)
    JOIN ACTOR USING (ACTOR_ID)
    WHERE DIRECTOR = '최동훈';
    
    SELECT NAME
    FROM MOVIE_ACTOR
    JOIN MOVIE USING(MOVIE_ID)
    JOIN ACTOR USING(ACTOR_ID)
    WHERE DIRECTOR = '최동훈';
    
-- 15. 하정우가 출연한 영화 제목과 평균 평점 조회
SETECT AVG(RATING),
FROM MOVIE
    JOIN MOVIE_ACTOR USING(MOVIE_ID)
    JOIN ACTOR USING(ARTOR_ID)
    JOIN REVIEW USING(MOICE_ID)
    WHERE NAME = '하정우'
    GROUP BY TITLE;

-- 16. MBTI별 평균 평점 조회
SELECT MBTI, ROUND(AVG(RATING))
FROM REVIEW
JOIN USER_INFO USING(USER_ID)
GROUP BY MBTI;
-- 17. 각 영화별 리뷰 수와 평균 평점 조회 (리뷰 수가 1건이라도 있는 경우부터)
    SELECT TITLE, COUNT("COMMENT"), AVG(RATING)
    FROM REVIEW
    JOIN MOVIE USING(MOVIE_ID)
    GROUP BY TITLE
    HAVING COUNT("COMMENT") >= 1;
-- 18. 각 배우가 출연한 영화 수 조회 (단, 3편 이상인 배우만)
SELECT NAME, TITLE
FROM REVIEW
    JOIN MOVIE USING (MOVIE_ID)
     JOIN MOVIE_ACTOR USING (MOVIE_ID)
    JOIN ACTOR USING (ACTOR_ID);
    WHERE ;
    
    SELECT NAME, COUNT(MOVIE_ID)
    FROM MOVIE_ACTOR
        JOIN MOVIE USING(MOVIE_ID)
        JOIN ACTOR USING(ACTOR_ID)
        GROUP BY NAME
        HAVING COUNT(MOVIE_ID) >= 3;
SELECT * FROM USER_INFO;
SELECT * FROM  REVIEW; --리뷰 
SELECT * FROM  MOVIE; --영화
SELECT * FROM ACTOR; --배우
SELECT * FROM  MOVIE_ACTOR;-- 영화 주인공



SELECT * FROM    NATIONAL;
SELECT * FROM SAL_GRADE;
SELECT * FROM  DEPARTMENT;
SELECT * FROM LOCATION ;
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;










-- SEQUENCES 생성
CREATE SEQUENCE MOVIE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE ACTOR_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- MOVIE 테이블 생성
CREATE TABLE MOVIE (
    MOVIE_ID NUMBER PRIMARY KEY,
    TITLE VARCHAR2(200),
    RELEASE_DATE DATE,
    GENRE VARCHAR2(100),
    DIRECTOR VARCHAR2(100)
);

-- ACTOR 테이블 생성
CREATE TABLE ACTOR (
    ACTOR_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    BIRTHDATE DATE,
    NATIONALITY VARCHAR2(50)
);

-- MOVIE_ACTOR 테이블 생성 (MOVIE, ACTOR 연결)
CREATE TABLE MOVIE_ACTOR (
    MOVIE_ID NUMBER REFERENCES MOVIE(MOVIE_ID),
    ACTOR_ID NUMBER REFERENCES ACTOR(ACTOR_ID),
    ROLE VARCHAR2(100),
    PRIMARY KEY (MOVIE_ID, ACTOR_ID)
);

-- REVIEW 테이블 생성 (USER_INFO, MOVIE 연결)
CREATE TABLE REVIEW (
    REVIEW_ID NUMBER PRIMARY KEY,
    MOVIE_ID NUMBER REFERENCES MOVIE(MOVIE_ID),
    USER_ID NUMBER REFERENCES USER_INFO(USER_ID),
    RATING NUMBER(2,1),
    "COMMENT" VARCHAR2(1000),
    REVIEW_DATE DATE
);

-- MOVIE 테이블에 데이터 삽입
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '명량', TO_DATE('2014-07-30', 'YYYY-MM-DD'), '전쟁, 드라마', '김한민');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '도둑들', TO_DATE('2012-07-25', 'YYYY-MM-DD'), '범죄, 액션', '최동훈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '베테랑', TO_DATE('2015-08-05', 'YYYY-MM-DD'), '액션, 코미디', '류승완');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '광해, 왕이 된 남자', TO_DATE('2012-09-13', 'YYYY-MM-DD'), '사극, 드라마', '추창민');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '7번방의 선물', TO_DATE('2013-01-23', 'YYYY-MM-DD'), '드라마, 코미디', '이환경');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '암살', TO_DATE('2015-07-22', 'YYYY-MM-DD'), '액션, 드라마', '최동훈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '국제시장', TO_DATE('2014-12-17', 'YYYY-MM-DD'), '드라마', '윤제균');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '해운대', TO_DATE('2009-07-22', 'YYYY-MM-DD'), '재난, 드라마', '윤제균');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '신과함께-죄와 벌', TO_DATE('2017-12-20', 'YYYY-MM-DD'), '판타지, 드라마', '김용화');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '부산행', TO_DATE('2016-07-20', 'YYYY-MM-DD'), '액션, 스릴러', '연상호');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '터널', TO_DATE('2016-08-10', 'YYYY-MM-DD'), '드라마, 스릴러', '김성훈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '곡성', TO_DATE('2016-05-12', 'YYYY-MM-DD'), '미스터리, 스릴러', '나홍진');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '택시운전사', TO_DATE('2017-08-02', 'YYYY-MM-DD'), '드라마', '장훈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '1987', TO_DATE('2017-12-27', 'YYYY-MM-DD'), '드라마', '장준환');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '신과함께-인과 연', TO_DATE('2018-08-01', 'YYYY-MM-DD'), '판타지, 드라마', '김용화');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '공조', TO_DATE('2017-01-18', 'YYYY-MM-DD'), '액션, 코미디', '김성훈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '범죄도시', TO_DATE('2017-10-03', 'YYYY-MM-DD'), '액션, 범죄', '강윤성');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '검사외전', TO_DATE('2016-02-03', 'YYYY-MM-DD'), '범죄, 코미디', '이일형');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '내부자들', TO_DATE('2015-11-19', 'YYYY-MM-DD'), '범죄, 드라마', '우민호');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '더 킹', TO_DATE('2017-01-18', 'YYYY-MM-DD'), '범죄, 드라마', '한재림');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '마스터', TO_DATE('2016-12-21', 'YYYY-MM-DD'), '범죄, 액션', '조의석');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '밀정', TO_DATE('2016-09-07', 'YYYY-MM-DD'), '스릴러', '김지운');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '공작', TO_DATE('2018-08-08', 'YYYY-MM-DD'), '스릴러', '윤종빈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '마약왕', TO_DATE('2018-12-19', 'YYYY-MM-DD'), '범죄, 드라마', '우민호');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '암수살인', TO_DATE('2018-10-03', 'YYYY-MM-DD'), '스릴러', '김태균');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '극한직업', TO_DATE('2019-01-23', 'YYYY-MM-DD'), '코미디, 액션', '이병헌');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '기생충', TO_DATE('2019-05-30', 'YYYY-MM-DD'), '드라마', '봉준호');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '백두산', TO_DATE('2019-12-19', 'YYYY-MM-DD'), '액션, 드라마', '이병헌');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '남산의 부장들', TO_DATE('2020-01-22', 'YYYY-MM-DD'), '드라마', '우민호');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '다만 악에서 구하소서', TO_DATE('2020-08-05', 'YYYY-MM-DD'), '액션, 스릴러', '홍원찬');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '서복', TO_DATE('2021-04-15', 'YYYY-MM-DD'), 'SF, 드라마', '이용주');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '모가디슈', TO_DATE('2021-07-28', 'YYYY-MM-DD'), '액션, 드라마', '류승완');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '싱크홀', TO_DATE('2021-08-11', 'YYYY-MM-DD'), '재난, 코미디', '김지훈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '파묘', TO_DATE('2024-02-22', 'YYYY-MM-DD'), '미스터리, 스릴러', '장재현');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '외계+인 2부', TO_DATE('2024-01-10', 'YYYY-MM-DD'), '액션, 드라마, 판타지', '최동훈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '시민덕희', TO_DATE('2024-01-24', 'YYYY-MM-DD'), '드라마', '박영주');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '도그 데이즈', TO_DATE('2024-02-07', 'YYYY-MM-DD'), '드라마', '김덕민');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '히트맨 2', TO_DATE('2025-01-22', 'YYYY-MM-DD'), '코미디', '최원섭');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '검은 수녀들', TO_DATE('2025-01-24', 'YYYY-MM-DD'), '미스터리', '권혁재');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '말할 수 없는 비밀', TO_DATE('2025-01-28', 'YYYY-MM-DD'), '판타지', '서유민');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '브로큰', TO_DATE('2025-02-05', 'YYYY-MM-DD'), '범죄', '김진황');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '스트리밍', TO_DATE('2025-03-21', 'YYYY-MM-DD'), '스릴러', '조창호');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '로비', TO_DATE('2025-04-02', 'YYYY-MM-DD'), '드라마', '하정우');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '마루이 비디오', TO_DATE('2024-04-24', 'YYYY-MM-DD'), '스릴러', '김진환');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '탈출: PROJECT SILENCE', TO_DATE('2024-07-10', 'YYYY-MM-DD'), '스릴러', '김태곤');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '비상선언', TO_DATE('2024-08-21', 'YYYY-MM-DD'), '재난, 드라마', '한재림');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '하이재킹', TO_DATE('2024-05-15', 'YYYY-MM-DD'), '액션, 스릴러', '김성훈');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '노량: 죽음의 바다', TO_DATE('2024-12-20', 'YYYY-MM-DD'), '역사, 전쟁', '김한민');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '귀공자', TO_DATE('2024-06-26', 'YYYY-MM-DD'), '액션, 스릴러', '박훈정');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '보호자', TO_DATE('2024-11-27', 'YYYY-MM-DD'), '드라마, 액션', '정우성');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '밀수', TO_DATE('2024-09-18', 'YYYY-MM-DD'), '범죄, 드라마', '류승완');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '정직한 후보 3', TO_DATE('2024-10-30', 'YYYY-MM-DD'), '코미디', '장유정');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '청춘', TO_DATE('2024-11-13', 'YYYY-MM-DD'), '드라마', '박찬욱');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '헤어질 결심', TO_DATE('2024-10-05', 'YYYY-MM-DD'), '로맨스, 스릴러', '박찬욱');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '드림', TO_DATE('2024-06-01', 'YYYY-MM-DD'), '드라마', '이병헌');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '헌트', TO_DATE('2024-08-03', 'YYYY-MM-DD'), '스릴러', '이정재');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '콘크리트 유토피아', TO_DATE('2024-12-25', 'YYYY-MM-DD'), '드라마, 스릴러', '엄태화');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '소울메이트', TO_DATE('2024-07-22', 'YYYY-MM-DD'), '드라마', '민용근');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '영웅', TO_DATE('2024-10-14', 'YYYY-MM-DD'), '뮤지컬, 드라마', '윤제균');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '경관의 피', TO_DATE('2024-12-13', 'YYYY-MM-DD'), '범죄, 스릴러', '이규만');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '유체이탈자', TO_DATE('2024-10-07', 'YYYY-MM-DD'), '액션, 스릴러', '윤재근');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '담보', TO_DATE('2024-12-29', 'YYYY-MM-DD'), '드라마', '강대규');
INSERT INTO MOVIE (MOVIE_ID, TITLE, RELEASE_DATE, GENRE, DIRECTOR)
VALUES (MOVIE_SEQ.NEXTVAL, '소리도 없이', TO_DATE('2024-08-15', 'YYYY-MM-DD'), '드라마', '홍의정');

-- ACTOR 테이블에 삽입
-- 배우 정보 삽입
INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '최민식', TO_DATE('1962-04-27', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '김윤석', TO_DATE('1968-01-21', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '하정우', TO_DATE('1978-03-11', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '황정민', TO_DATE('1970-09-01', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '류승룡', TO_DATE('1970-11-29', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '송강호', TO_DATE('1967-01-17', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '이병헌', TO_DATE('1970-07-12', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '조진웅', TO_DATE('1976-03-03', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '유해진', TO_DATE('1970-01-04', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '마동석', TO_DATE('1971-03-01', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '정우성', TO_DATE('1973-03-20', 'YYYY-MM-DD'), '대한민국');




INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '이정재', TO_DATE('1972-12-15', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '김혜수', TO_DATE('1970-09-05', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '전지현', TO_DATE('1981-10-30', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '조정석', TO_DATE('1980-12-26', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '김태리', TO_DATE('1990-04-24', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '박보검', TO_DATE('1993-06-16', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '김수현', TO_DATE('1988-02-16', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '수지', TO_DATE('1994-10-10', 'YYYY-MM-DD'), '대한민국');

INSERT INTO ACTOR (ACTOR_ID, NAME, BIRTHDATE, NATIONALITY)
VALUES (ACTOR_SEQ.NEXTVAL, '이정은', TO_DATE('1970-01-06', 'YYYY-MM-DD'), '대한민국');

INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (1, 1, '이순신');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (2, 14, '예니콜');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (2, 12, '뽀빠이');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (3, 4, '서도철');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (3, 9, '조태오');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (4, 6, '광해');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (5, 5, '용구');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (5, 10, '양호');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (6, 14, '안옥윤');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (6, 2, '염석진');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (7, 4, '덕수');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (8, 9, '만식');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (9, 3, '강림');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (9, 5, '해원맥');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (10, 6, '석우');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (11, 4, '정수');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (12, 6, '종구');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (13, 6, '김만섭');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (14, 2, '박처장');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (15, 3, '강림');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (15, 5, '해원맥');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (16, 7, '림철령');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (16, 9, '강진태');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (17, 10, '마석도');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (18, 7, '변재욱');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (19, 7, '안상구');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (20, 7, '박태수');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (21, 7, '김재명');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (22, 2, '이정출');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (23, 7, '박석영');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (24, 6, '이두삼');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (25, 2, '김형민');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (26, 5, '고반장');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (27, 6, '기택');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (28, 7, '조인창');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (29, 2, '김규평');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (30, 7, '인남');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (31, 7, '기헌');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (32, 4, '한신성');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (33, 9, '동원');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (34, 6, '상훈');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (35, 14, '이안');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (36, 13, '덕희');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (37, 3, '주인공');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (38, 3, '준');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (39, 16, '수녀');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (40, 17, '주인공');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (41, 18, '형사');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (42, 19, '주인공');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (43, 3, '로비스트');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (44, 20, '주인공');
INSERT INTO MOVIE_ACTOR (MOVIE_ID, ACTOR_ID, ROLE) VALUES (45, 3, '주인공');

COMMIT;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
SELECT * FROM REVIEW;
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 1, 3, 4.5, '긴장감 넘치는 전투 장면!', TO_DATE('2024-05-25', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 5, 8, 3.0, '감동적이지만 조금 지루했음.', TO_DATE('2024-05-28', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 10, 1, 4.8, '좀비 액션이 최고였어요!', TO_DATE('2024-06-01', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 15, 7, 2.5, '스토리가 아쉬웠음.', TO_DATE('2024-05-30', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 21, 5, 4.2, '배우들 연기력이 대단!', TO_DATE('2024-05-29', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 27, 11, 5.0, '명작 그 자체, 몰입감 최고!', TO_DATE('2024-06-02', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 30, 4, 3.7, '액션은 멋졌지만 스토리가 약해요.', TO_DATE('2024-06-01', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 33, 10, 4.0, '코믹 요소가 잘 살아있음.', TO_DATE('2024-05-27', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 39, 14, 2.0, '스토리가 너무 평범해요.', TO_DATE('2024-05-26', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE)
VALUES (REVIEW_SEQ.NEXTVAL, 42, 9, 4.5, '긴박한 전개가 좋았어요.', TO_DATE('2024-06-01', 'YYYY-MM-DD'));

INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 33, 23, 3.1, '생각보다 평범했어요.', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 28, 6, 2.0, '화려한 액션!', TO_DATE('2024-05-31', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 40, 3, 3.5, '생각보다 평범했어요.', TO_DATE('2024-05-26', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 37, 23, 2.3, '감동적이었어요.', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 32, 7, 3.0, '스토리가 탄탄했음.', TO_DATE('2024-05-28', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 27, 16, 2.9, '긴박감 넘쳤습니다.', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 23, 8, 1.8, '생각보다 평범했어요.', TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 35, 19, 1.0, '지루하진 않았어요.', TO_DATE('2024-05-26', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 18, 12, 3.7, '지루하진 않았어요.', TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 39, 17, 4.8, '재밌게 봤어요!', TO_DATE('2024-05-29', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 4, 21, 1.2, '화려한 액션!', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 44, 14, 1.8, '긴박감 넘쳤습니다.', TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 26, 21, 4.3, '시간 가는 줄 몰랐음.', TO_DATE('2024-05-26', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 29, 7, 2.7, '스토리 전개가 흥미로웠음.', TO_DATE('2024-05-29', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 14, 7, 3.4, '스토리가 탄탄했음.', TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 18, 20, 3.7, '연기력이 좋았어요.', TO_DATE('2024-05-27', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 44, 10, 2.3, '화려한 액션!', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 43, 2, 4.3, '연기력이 좋았어요.', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 8, 12, 4.0, '시간 가는 줄 몰랐음.', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 50, 24, 1.2, '시간 가는 줄 몰랐음.', TO_DATE('2024-05-30', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 28, 14, 1.2, '긴박감 넘쳤습니다.', TO_DATE('2024-05-30', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 44, 3, 3.1, '지루하진 않았어요.', TO_DATE('2024-05-26', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 11, 4, 3.9, '재밌게 봤어요!', TO_DATE('2024-05-27', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 42, 2, 3.0, '스토리가 탄탄했음.', TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 38, 8, 3.8, '생각보다 평범했어요.', TO_DATE('2024-05-30', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 40, 19, 3.3, '감동적이었어요.', TO_DATE('2024-05-25', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 31, 4, 3.3, '감동적이었어요.', TO_DATE('2024-05-31', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 43, 9, 2.9, '재밌게 봤어요!', TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 37, 12, 4.2, '지루하진 않았어요.', TO_DATE('2024-05-26', 'YYYY-MM-DD'));
INSERT INTO REVIEW (REVIEW_ID, MOVIE_ID, USER_ID, RATING, "COMMENT", REVIEW_DATE) VALUES (REVIEW_SEQ.NEXTVAL, 23, 20, 4.1, '감동적이었어요.', TO_DATE('2024-06-01', 'YYYY-MM-DD'));



COMMIT;






















