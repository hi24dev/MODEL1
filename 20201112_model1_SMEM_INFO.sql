/* 20201112 목
SMEM_INFO 회원가입 테이블 생성(MODEL1)

회원번호	SNO	        VARCHAR2	13	PK
아이디	SSID	    VARCHAR2	30	
비밀번호	SPW	        VARCHAR2	30	
이름	    SNAME	    VARCHAR2	50	
생년월일	SBIRTH	    VARCHAR2	8	
성별	    SGENDER	    VARCHAR2	1	
전화번호	SHP	        VARCHAR2	13	
이메일	SMAIL	    VARCHAR2	50	
우편번호	SPOST	    VARCHAR2	6	
주소	    SADDR	    VARCHAR2	300	
등록일	SINSERTDATE	DATE		
수정일	SUPDATEDATE	DATE		
삭제여부	SDELETEYN	VARCHAR2	1	
*/

-- 테이블생성
CREATE TABLE SMEM_INFO(
     SNO	    VARCHAR2(13)
    ,SSID	    VARCHAR2(30)
    ,SPW	    VARCHAR2(30)
    ,SNAME	    VARCHAR2(50)
    ,SBIRTH	    VARCHAR2(8)
    ,SGENDER	VARCHAR2(1)
    ,SHP	    VARCHAR2(13)
    ,SMAIL	    VARCHAR2(50)
    ,SPOST	    VARCHAR2(6)
    ,SADDR	    VARCHAR2(300)
    ,SINSERTDATE	DATE
    ,SUPDATEDATE	DATE
    ,SDELETEYN	VARCHAR2(1)
    ,CONSTRAINT SMEM_INFO_PK PRIMARY KEY(SNO)
);

SELECT * FROM SMEM_INFO;

DROP TABLE SMEM_INFO;

-- 로그인(select)
SELECT
     S.SNO   SNO
FROM SMEM_INFO S
WHERE S.SSID = 'testID'
AND   S.SPW = 'pw1234'
AND   S.SDELETEYN = 'N';

-- 인덱스 조회
SELECT
         A.TABLE_NAME   TABLE_NAME
        ,A.INDEX_NAME   INDEX_NAME
        ,A.COLUMN_NAME  COLUMN_NAME
FROM     ALL_IND_COLUMNS A
WHERE    A.TABLE_NAME = 'SMEM_INFO';

-- 채번
SELECT /*+ INDEX_DESC(SMEM_INFO_PK) */ 
    NVL(MAX(SUBSTR(S.SNO,-4)),0)+1  SNO
FROM SMEM_INFO    S;

-- 전체회원조회(SelectAll)
SELECT
     S.SNO          SNO
    ,S.SSID         SSID
    ,S.SNAME        SNAME
    ,S.SBIRTH       SBIRTH
    ,S.SGENDER      SGENDER
    ,S.SHP          SHP
    ,S.SMAIL        SMAIL
    ,S.SPOST        SPOST
    ,S.SADDR        SADDR
FROM SMEM_INFO  S
WHERE S.SDELETEYN = 'N'
ORDER BY S.SNO;

-- 회원가입(Insert)
INSERT INTO SMEM_INFO(
                     SNO
                    ,SSID
                    ,SPW
                    ,SNAME
                    ,SBIRTH
                    ,SGENDER
                    ,SHP
                    ,SMAIL
                    ,SPOST
                    ,SADDR
                    ,SINSERTDATE
                    ,SUPDATEDATE
                    ,SDELETEYN
            )VALUES(
             'S202011120000'
            ,'testID'
            ,'testPW'
            ,'김연습'
            ,'19990101'
            ,'M'
            ,'01012341234'
            ,'testMail@gmail.com'
            ,'01234'
            ,'서울시 종로구 실험동'
            ,SYSDATE
            ,SYSDATE
            ,'N');

-- 회원정보수정(update)
UPDATE SMEM_INFO    S
SET  S.SPW = 'pw1234'
    ,S.SNAME = '박연습'
    ,S.SBIRTH = '19990101'
    ,S.SGENDER = 'M'
    ,S.SHP = '01012341234'
    ,S.SMAIL = 'testMail@gmail.com'
    ,S.SPOST = '01234'
    ,S.SADDR = '서울시 종로구 실험동'
    ,S.SUPDATEDATE = SYSDATE
WHERE S.SDELETEYN = 'N'
AND   S.SNO = 'S202011120000';

  
-- 회원탈퇴(delete)
UPDATE SMEM_INFO    S
SET  S.SUPDATEDATE = SYSDATE
    ,S.SDELETEYN = 'Y'
WHERE S.SDELETEYN = 'N'
AND   S.SNO = 'S202011120000';


-- 회원조회(detail)
SELECT
     S.SNO          SNO
    ,S.SSID         SSID
    ,S.SPW          SPW
    ,S.SNAME        SNAME
    ,S.SBIRTH       SBIRTH
    ,S.SGENDER      SGENDER
    ,S.SHP          SHP
    ,S.SMAIL        SMAIL
    ,S.SPOST        SPOST
    ,S.SADDR        SADDR
    ,S.SINSERTDATE  SINSERTDATE
    ,S.SUPDATEDATE  SUPDATEDATE
    ,S.SDELETEYN    SDELETEYN
FROM SMEM_INFO  S
WHERE S.SNO = 'S202011120000'
AND   S.SDELETEYN = 'N'
ORDER BY S.SNO;

-- 회원검색(Search)
SELECT
     S.SNO          SNO
    ,S.SSID         SSID
    ,S.SPW          SPW
    ,S.SNAME        SNAME
    ,S.SBIRTH       SBIRTH
    ,S.SGENDER      SGENDER
    ,S.SHP          SHP
    ,S.SMAIL        SMAIL
    ,S.SPOST        SPOST
    ,S.SADDR        SADDR
    ,S.SINSERTDATE  SINSERTDATE
    ,S.SUPDATEDATE  SUPDATEDATE
FROM SMEM_INFO  S
WHERE S.SNO = 'S202011120000'
AND   S.SDELETEYN = 'N'
ORDER BY S.SNO;

commit;