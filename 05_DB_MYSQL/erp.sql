/*
	DB 모델링 
    1. 개념적 모델링
		- 엔티티(테이블) 추출
        - 엔티티 간의 관계설정
    2. 논리적 모델링
		- 속성(컬럼) 추출
        - 정규화 작업 (1, 2, 3) -------> 이 이상으로 가면 역정규화
    3. 물리적 모델링 
		- 테이블 실질적으로 작성 (CREATE 문 작성)
    
    * 정규화(Nomalizattion)
    - 불필요한 데이터의 중복을 제거하여 데이터모델을 구조화하는 것
    - 효율적인 자료 저장 및 데잍 무결성을 보장하고 오류를 최소화하여 안정성을 보장하기 위해 적용함
    
    제 1 정규화 : 복수의 속성값을 갖는 속성을 분리
    제 2 정규화 : 주 식별자에 종속되지 않는 속성을 분리
    제 3 정규화 : 속성에 종속적인 속성을 제거
*/

/*
	사용자 or 사원 관련 정보 들어가는 테이블 하나 CREATE 문 작성해서 제출
    -> PRIMARY KEY : AUTO_INCREMENT 추가!
    
    MYSQL
    - 데이터 타입
    1. 문자 
		-CHAR / **VARCHAR** : 고정 및 가변 길이 문자, 반드시 크기 지정
        -TEXT : 매우 긴 문자열을 저장하는데 사용
	2. 숫자
		- **INT** : 정수값 저장하는데 사용
        - FLOAT / DOUBLE : 부동소수점 저장하는데 사용
        - DECIMAL : 고정소수점 저장하는데 사용 
	3. 날짜 및 시간
		- **DATE** : 날짜 저장하는데 사용
        - TIME : 시간 저장하는데 사용
        - DATETIME /TIMESTAMP : 날짜와 시간을 함께 저장
	4. 불리언 
		- BOOLEAN / BOOL : 참 (TURE) 거짓(FALSE) 값을 저장하는데 사용
	5. 이진 자료형
        - BLOB : 이진 테이터를 저장하는데 사용 이미지나 동영상과 같은 이진 파일 ---> 실제로는 이미지나 동영상은 따로 관리 (URL만 문자형으로 저장)
        
        
*/
DROP TABLE PROJECT_MEMBERS;
DROP TABLE USER_INFO;
DROP TABLE DEPARTMENT;
DROP TABLE GRADE;
DROP TABLE PROJECT_TASKS;
DROP TABLE PROJECT;

create table User_Infos (
user_id INT NOT NULL PRIMARY KEY, 		/* 유저 고유번호 */
username VARCHAR(10) NOT NULL,			/*이름*/
age INT NOT  NULL,						/*나이*/
JOB_CODE VARCHAR(10) NOT NULL,			/*직업이름 예 : 자제관리사*/
Job_Name VARCHAR(20) NOT NULL,			/*직업코드*/
Dept_Name VARCHAR(20) NOT NULL,			/*부서이름 예: 생산관리부서*/
Dept_Code VARCHAR(10) NOT NULL, 		/*부서코드 */
phone VARCHAR(15) ,						/*전화번호*/
Gender VARCHAR(2) NOT NULL,				/*성별*/
address VARCHAR(30),					/*주소*/
Ranks VARCHAR(10),						/*직급*/
SALARY INT NOT NULL						/*급여*/
);


CREATE TABLE USER_INFO(
USER_NO INT PRIMARY KEY AUTO_INCREMENT,
ID VARCHAR(50) UNIQUE NOT NULL,
PASSWORD VARCHAR(300) NOT NULL,
EMAIL VARCHAR(100) UNIQUE,
NAME VARCHAR(50) NOT NULL,
PHONE VARCHAR(50) UNIQUE,
ADDR VARCHAR(200),
GENDER VARCHAR(10) CHECK (GENDER IN ('남', '여')),
BIRTH_DATE DATE,
HIRE_DATE DATE DEFAULT (CURRENT_DATE), /* 현제 날짜*/
QUIT_DATE DATE,
DEPT_NO INT,
GRADE_NO INT



);
CREATE TABLE DEPARTMENT(
DEPT_NO INT PRIMARY KEY AUTO_INCREMENT,
DEPT_NAME VARCHAR(100) NOT NULL,
DEPT_TITLE VARCHAR(100)

 ); -- 개발팀
 
 
CREATE TABLE GRADE(
GRADE_NO INT PRIMARY KEY AUTO_INCREMENT,
POSITION_NAME VARCHAR(100) NOT NULL 
); -- 사원

-- DEPT_NO, GRADE_NO
ALTER TABLE USER_INFO ADD
 FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);
 ALTER TABLE USER_INFO ADD
 FOREIGN KEY (GRADE_NO) REFERENCES GRADE(GRADET_NO);



SELECT * FROM USER_INFO;


-- 프로젝트 관리 : 테이블 몃개든 상관없이 짜보시고 FOREIGN KEY =까지 걸어보는 것까지
-- 테이블 필요한 컬럼 짜기 힘드시다면 어떤 기능이 있어야 되는지 정도로 제출해도 괜찮아요

CREATE TABLE PROJECT (
PRO_NO INT AUTO_INCREMENT PRIMARY KEY,
PRO_NAME VARCHAR(100) NOT NULL, 
PRO_DESC TEXT,
START_DATE DATE,
END_DATE DATE,
STATUS VARCHAR(10) CHECK(STATUS IN('진행 전', '진행 중', '완료됨', '중단됨'))

);
-- SCHEDULE : PRO_NO, TASK_NO, USER_NO
ALTER TABLE SCHEDULE ADD
FOREIGN KEY (PRO_NO) REFERENCES PROJECT(PRO_NO);
ALTER TABLE SCHEDULE ADD
FOREIGN KEY (TASK_NO) REFERENCES PROJECT(TASK_NO);
ALTER TABLE SCHEDULE ADD
FOREIGN KEY (PRO_NO) REFERENCES PROJECT(PRO_NO);


CREATE TABLE PROJECT_MEMBERS(
	MEMBER_NO INT AUTO_INCREMENT PRIMARY KEY,
    USER_NO INT,
    PRO_NO INT,
    ROLE VARCHAR(50)
);

-- 프로젝트 : 업무들 = 1 : M
CREATE TABLE PROJECT_TASKS(
CHECK_TASKS_NO INT AUTO_INCREMENT PRIMARY KEY,
PRO_NO INT,
TASK_NAME VARCHAR(100),
TASK_DESC TEXT,
STATUS VARCHAR(10) CHECK (STATUS IN ('진행 전', '진행 중', '완료됨', '중단됨')),
START_DATE DATE,
END_DATE DATE
);



ALTER TABLE USER_INFO ADD
 FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO);
 ALTER TABLE USER_INFO ADD
 FOREIGN KEY (GRADE_NO) REFERENCES GRADE(GRADET_NO);
 
 
-- PROJECT_MEMBERS : USER_NO, PRO_NO
ALTER TABLE PROJECT_MEMBERS  ADD
FOREIGN KEY (USER_NO) REFERENCES USER_INFO(USER_NO); 
ALTER TABLE PROJECT_MEMBERS ADD
FOREIGN KEY (PRO_NO) REFERENCES PROJECT(PRO_NO); 

-- PROJECT_TASKS :PRO_NO
ALTER TABLE PROJECT_TASKS ADD
FOREIGN KEY (PRO_NO) REFERENCES PROJECT(PRO_NO); 




-- 일정 관리!

CREATE  TABLE PRO_SCHEDULE(
SCHEDULE_NO INT AUTO_INCREMENT PRIMARY KEY,  -- ID
SCHEDULE_START DATE,    -- 시작 날짜
SCHEDULE_END DATE,				-- 종료 날짜
SCHEDULE_PROGRESS VARCHAR(20) CHECK (SSCHEDULE_PROGRESS IN ('진행 전', '진행 중', '완료됨', '중단됨')), -- 프로젝트 진행 상태
SCHEDULE_DETAILS VARCHAR(300),           -- 프로젝트 일정 상세 내용
SCHEDULE_MANAGER VARCHAR(100),      		-- 담당자
SCHEDULE_PARTNER VARCHAR(100)                   -- 프로젝트 참여자
               
	);

-- 고개관계관리, 인적자원관리, 채무관리, 품질 보증관리
-- 가장 해볼만 하다 싶은 거 1개만 제출 아이디어 있으면 그것도 해도됨

-- 채무관리


-- 거래처이름

-- 순이익률
-- 합계


블랙잭  시퀀스1 리맠 오리진 제네무적+템오카 블랙잭 조커+라모르  템오카 얼드 리맠 


CREATE TABLE JOB (
JOB_CODE INT PRIMARY KEY AUTO_INCREMENT,
JOB_NAME VARCHAR(50) NOT NULL
); -- 직급

CREATE TABLE OFFICE_PHONE (
OFICE_ID INT PRIMARY KEY AUTO_INCREMENT,
OFICE_NUMBER VARCHAR(30) NOT NULL
); -- 사내전화 예 : 2001 , 2002 ...

CREATE TABLE MARRY (
MARRY_ID INT PRIMARY KEY AUTO_INCREMENT,
MARRY_LODE VARCHAR(20) CHECK (MARRY IN('YES', 'NO'))
);   -- 결혼 여부 확인

CREATE TABLE SALARY (
SAL_ID INT PRIMARY KEY AUTO_INCREMENT,
SAL_LIST INT NOT NULL,
SAL_DATE DATE,    -- 급여 날짜
BONUS INT,
SAL_LEVEL VARCHAR(20),
SAL_MAX INT,
SAL_MIN INT
); -- 급여

CREATE TABLE LOCATIONS (
	LOCATION_NO INT PRIMARY KEY AUTO_INCREMENT,
    LOCATION_NAME VARCHAR(200) ,  -- -- 근무지 예 : 서울 , 부산, 대구, 청주.. 도쿄..
    LOCATION_NATIONALIY VARCHAR(100) -- 근무지 나라 : 한국, 일본, 미국..
); -- 근무지..



  		










