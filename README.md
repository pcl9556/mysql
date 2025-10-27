1️⃣ 데이터베이스 기본

스키마(Schema): 데이터베이스 구조/제약조건 정의

테이블(Table): 행(Row, 튜플) + 열(Column, 속성)

키(Key)

기본키(PK): 유일, NULL 불가

외래키(FK): 다른 테이블의 PK 참조

후보키: 유일 + 최소성 만족

대체키: 후보키 중 기본키 제외한 키

2️⃣ SQL 구문 종류

DDL (정의어): CREATE, ALTER, DROP

DML (조작어): SELECT, INSERT, UPDATE, DELETE

DCL (제어어): GRANT, REVOKE

TCL (트랜잭션 제어): COMMIT, ROLLBACK, SAVEPOINT

3️⃣ SELECT 핵심

SELECT 문 순서

SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY

WHERE: 조건

GROUP BY: 그룹핑

HAVING: 그룹 조건

4️⃣ 집계 & 함수

집계 함수: SUM, AVG, MAX, MIN, COUNT

NULL 처리

NVL(expr, value) → NULL 대체

NULL은 연산 시 주의 (합계, 비교 등)

문자 함수:

SUBSTR(‘SQLD’, 1, 2) → ‘SQ’

LENGTH(‘SQLD’) → 4

숫자 함수:

ROUND(45.926, 2) → 45.93

TRUNC(45.926, 2) → 45.92

날짜 함수:

SYSDATE → 현재 날짜

MONTHS_BETWEEN(d1, d2)

5️⃣ JOIN

INNER JOIN: 교집합

LEFT OUTER JOIN: 왼쪽 + 교집합

RIGHT OUTER JOIN: 오른쪽 + 교집합

FULL OUTER JOIN: 합집합

SELF JOIN: 자기 자신과 조인

SELECT e.ename, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno;

6️⃣ 서브쿼리

단일행 서브쿼리: =, >, <

다중행 서브쿼리: IN, ANY, ALL

상관 서브쿼리: 메인쿼리 값 참조

7️⃣ 인덱스 & 뷰

인덱스(Index)

장점: 검색 빠름

단점: DML(삽입, 수정, 삭제) 느려짐, 저장공간 차지

뷰(View)

장점: 보안성 ↑, SQL 단순화

단점: 성능↓, 독립적 데이터 저장 X

8️⃣ 트랜잭션 (Transaction)

특성 ACID

원자성: 전부 수행 / 전부 취소

일관성: DB 제약조건 항상 유지

격리성: 동시에 실행해도 결과 일관

영속성: COMMIT 이후 데이터 보장

TCL 명령어: COMMIT, ROLLBACK

9️⃣ 데이터 모델링 (이론)

개념 → 논리 → 물리 모델링 단계

정규화

1NF: 원자값

2NF: 부분 함수 종속 제거

3NF: 이행 함수 종속 제거

관계

1:1, 1:N, N:M (N:M은 보통 교차 테이블 필요)

식별/비식별 관계

식별: 부모 PK → 자식 PK 포함

비식별: 부모 PK → 자식 FK로만

🔟 기타 암기 포인트

NULL 비교는 IS NULL / IS NOT NULL (절대 = NULL ❌)

DISTINCT: 중복 제거

집합 연산자

UNION: 합집합(중복 제거)

UNION ALL: 합집합(중복 허용)

INTERSECT: 교집합

MINUS: 차집합

<h4> 숫자형 </h4>

| 타입                 | 범위 / 크기                                 | 설명                              | 예시                               |
| ------------------ | --------------------------------------- | ------------------------------- | -------------------------------- |
| `TINYINT`          | -128 ~ 127 (1 byte)                     | 작은 정수 (ON/OFF, TRUE/FALSE 플래그용) | `TINYINT(1)` → 예약 가능 여부          |
| `SMALLINT`         | -32,768 ~ 32,767 (2 byte)               | 작은 정수 범위                        | 인원 수, 수량                         |
| `INT` / `INTEGER`  | -2,147,483,648 ~ 2,147,483,647 (4 byte) | 일반적인 숫자                         | ID, 개수, 조회수                      |

<h4> 문자형 </h4>

| 타입              | 최대 길이           | 설명                     | 예시            |
| --------------- | --------------- | ---------------------- | ------------- |
| `CHAR(n)`       | 고정 길이 (1~255)   | 길이가 일정한 문자열 (공백 포함 저장) | 주민번호, 코드값     |
| `VARCHAR(n)`    | 가변 길이 (1~65535) | 가장 많이 쓰임               | 이름, 이메일, 주소   |
| `TEXT`          | 65,535자         | 긴 문장/내용                | 리뷰 내용, 게시글 내용 |
| `MEDIUMTEXT`    | 약 1600만자        | 매우 긴 텍스트               | HTML 본문, 로그   |
| `LONGTEXT`      | 40억자            | 초대형 텍스트                | 기사, 대용량 콘텐츠   |
| `ENUM('A','B')` | 정해진 값 중 하나      | 상태값 관리용                | 예약 상태, 성별     |

<h4> 날짜, 시간 </h4>

| 타입            | 예시 값                      | 설명                    | 크기     |
| ------------- | ------------------------- | --------------------- | ------ |
| `DATE`        | `2025-10-21`              | 날짜만                   | 3 byte |
| `TIME`        | `14:30:00`                | 시/분/초만                | 3 byte |
| `DATETIME(3)` | `2025-10-21 14:30:00.123` | 날짜 + 시간 (ms까지)        | 8 byte |
| `TIMESTAMP`   | `2025-10-21 14:30:00`     | `DATETIME`과 유사, UTC기준 | 4 byte |
| `YEAR`        | `2025`                    | 연도만                   | 1 byte |

ON DELETE SET NULL - 부모의 행이 삭제될 때
자식의 외래키를 NULL로 바꿔준다.

ON UPDATE CASCADE - 부모의 기본키가 수정되면,
자식 테이블의 외래키도 같이 변경된다.
