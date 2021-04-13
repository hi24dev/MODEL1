/* 20201112 ��
SBOARD_DATA �Խ��� ���̺� ����(MODEL1)

�۹�ȣ	BNO	        VARCHAR2	13	PK  
������	BSUBJECT    VARCHAR2	100	
�̸�	    BNAME	    VARCHAR2	50
��й�ȣ	BPW	        VARCHAR2	50
�۳���   BMEMO       VARCHAR2    1000
�����	BINSERTDATE	DATE		
������	BUPDATEDATE	DATE		
��������	BDELETEYN	VARCHAR2	1	

*/

-- ���̺����
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

-- �ε��� ��ȸ
SELECT
         A.TABLE_NAME   TABLE_NAME
        ,A.INDEX_NAME   INDEX_NAME
        ,A.COLUMN_NAME  COLUMN_NAME
FROM     ALL_IND_COLUMNS A
WHERE    A.TABLE_NAME = 'SBOARD_DATA';

-- ä��
SELECT /*+ INDEX_DESC(SBOARD_DATA_PK) */ 
    NVL(MAX(SUBSTR(B.BNO,-4)),0)+1  BNO
FROM SBOARD_DATA    B;

-- ��ü����ȸ(SelectAll)
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

-- �۾���(Insert)
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
            ,'�۾��� �׽�Ʈ'
            ,'�ڿ���'
            ,'0000'
            ,'���̺� ���� �׽�Ʈ ���Դϴ�.'
            ,SYSDATE
            ,SYSDATE
            ,'N');

-- �ۼ���(update)
UPDATE SBOARD_DATA    B
SET  B.BSUBJECT = '���� �׽�Ʈ'
    ,B.BNAME = '������'
    ,B.BPW = '19990101'
    ,B.BMEMO = '���̺� ���� ���� �׽�Ʈ��'
    ,B.BUPDATEDATE = SYSDATE
WHERE B.BDELETEYN = 'N'
AND   B.BNO = 'B0000';

-- �ۻ���(delete)
UPDATE SBOARD_DATA    B
SET  B.BUPDATEDATE = SYSDATE
    ,B.BDELETEYN = 'Y'
WHERE B.BDELETEYN = 'N'
AND   B.BNO = 'B0000'
AND   B.BPW = '0000';

-- ����ȸ(SELECT)
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
�۹�ȣ	BNO	        VARCHAR2	13	PK  
������	BSUBJECT    VARCHAR2	100	
�̸�	    BNAME	    VARCHAR2	50
��й�ȣ	BPW	        VARCHAR2	50
�۳���   BMEMO       VARCHAR2    1000
�����	BINSERTDATE	DATE		
������	BUPDATEDATE	DATE		
��������	BDELETEYN	VARCHAR2	1	
*/

commit;