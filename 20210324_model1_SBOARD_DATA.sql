/* 20201112 목
SBOARD_DATA 게시판 테이블 생성(MODEL1)

글번호	BNO	        VARCHAR2	13	PK  
글제목	BSUBJECT    VARCHAR2	100	
이름	    BNAME	    VARCHAR2	50
비밀번호	BPW	        VARCHAR2	50
글내용   BMEMO       VARCHAR2    1000
등록일	BINSERTDATE	DATE		
수정일	BUPDATEDATE	DATE		
삭제여부	BDELETEYN	VARCHAR2	1	

*/

-- 테이블생성
CREATE TABLE SBOARD_DATA(
     BNO	    VARCHAR2(13)
    ,BSUBJECT	VARCHAR2(100)
    ,BNAME	    VARCHAR2(50)
    ,BPW	    VARCHAR2(50)
    ,BMEMO	    VARCHAR2(1000)
    ,BINSERTDATE	DATE
    ,BUPDATEDATE	DATE
    ,BDELETEYN	VARCHAR2(1)
    ,CONSTRAINT SBOARD_DATA_PK PRIMARY KEY(BNO)
);

SELECT * FROM SBOARD_DATA;

DROP TABLE SBOARD_DATA;

-- 인덱스 조회
SELECT
         A.TABLE_NAME   TABLE_NAME
        ,A.INDEX_NAME   INDEX_NAME
        ,A.COLUMN_NAME  COLUMN_NAME
FROM     ALL_IND_COLUMNS A
WHERE    A.TABLE_NAME = 'SBOARD_DATA';

-- 채번
SELECT /*+ INDEX_DESC(SBOARD_DATA_PK) */ 
    NVL(MAX(SUBSTR(B.BNO,-4)),0)+1  BNO
FROM SBOARD_DATA    B;

-- 전체글조회(SelectAll)
SELECT
     B.BNO          BNO
    ,B.BSUBJECT     BSUBJECT
    ,B.BNAME        BNAME
    ,B.BPW          BPW
    ,B.BMEMO        BMEMO
    ,B.BINSERTDATE  BINSERTDATE
    ,B.BUPDATEDATE  BUPDATEDATE
FROM SBOARD_DATA  B
WHERE B.BDELETEYN = 'N'
ORDER BY B.BNO;

-- 글쓰기(Insert)
INSERT INTO SBOARD_DATA(
                     BNO
                    ,BSUBJECT
                    ,BNAME
                    ,BPW
                    ,BMEMO
                    ,BINSERTDATE
                    ,BUPDATEDATE
                    ,BDELETEYN
            )VALUES(
             'B0000'
            ,'글쓰기 테스트'
            ,'박연습'
            ,'0000'
            ,'테이블 생성 테스트 중입니다.'
            ,SYSDATE
            ,SYSDATE
            ,'N');

-- 글수정(update)
UPDATE SBOARD_DATA    B
SET  B.BSUBJECT = '수정 테스트'
    ,B.BNAME = '공연습'
    ,B.BPW = '19990101'
    ,B.BMEMO = '테이블 생성 수정 테스트중'
    ,B.BUPDATEDATE = SYSDATE
WHERE B.BDELETEYN = 'N'
AND   B.BNO = 'B0000';

-- 글삭제(delete)
UPDATE SBOARD_DATA    B
SET  B.BUPDATEDATE = SYSDATE
    ,B.BDELETEYN = 'Y'
WHERE B.BDELETEYN = 'N'
AND   B.BNO = 'B0000'
AND   B.BPW = '0000';

-- 글조회(SELECT)
SELECT
     B.BNO          BNO
    ,B.BSUBJECT     BSUBJECT
    ,B.BNAME        BNAME
    ,B.BPW          BPW
    ,B.BMEMO        BMEMO
    ,B.BINSERTDATE  BINSERTDATE
    ,B.BUPDATEDATE  BUPDATEDATE
FROM SBOARD_DATA  B
WHERE B.BNO = 'B0000'
AND   B.BDELETEYN = 'N'
ORDER BY B.BNO;

/*
글번호	BNO	        VARCHAR2	13	PK  
글제목	BSUBJECT    VARCHAR2	100	
이름	    BNAME	    VARCHAR2	50
비밀번호	BPW	        VARCHAR2	50
글내용   BMEMO       VARCHAR2    1000
등록일	BINSERTDATE	DATE		
수정일	BUPDATEDATE	DATE		
삭제여부	BDELETEYN	VARCHAR2	1	
*/

commit;