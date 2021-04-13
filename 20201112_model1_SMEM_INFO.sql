/* 20201112 ��
SMEM_INFO ȸ������ ���̺� ����(MODEL1)

ȸ����ȣ	SNO	        VARCHAR2	13	PK
���̵�	SSID	    VARCHAR2	30	
��й�ȣ	SPW	        VARCHAR2	30	
�̸�	    SNAME	    VARCHAR2	50	
�������	SBIRTH	    VARCHAR2	8	
����	    SGENDER	    VARCHAR2	1	
��ȭ��ȣ	SHP	        VARCHAR2	13	
�̸���	SMAIL	    VARCHAR2	50	
�����ȣ	SPOST	    VARCHAR2	6	
�ּ�	    SADDR	    VARCHAR2	300	
�����	SINSERTDATE	DATE		
������	SUPDATEDATE	DATE		
��������	SDELETEYN	VARCHAR2	1	
*/

-- ���̺����
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

-- �α���(select)
SELECT
     S.SNO   SNO
FROM SMEM_INFO S
WHERE S.SSID = 'testID'
AND   S.SPW = 'pw1234'
AND   S.SDELETEYN = 'N';

-- �ε��� ��ȸ
SELECT
         A.TABLE_NAME   TABLE_NAME
        ,A.INDEX_NAME   INDEX_NAME
        ,A.COLUMN_NAME  COLUMN_NAME
FROM     ALL_IND_COLUMNS A
WHERE    A.TABLE_NAME = 'SMEM_INFO';

-- ä��
SELECT /*+ INDEX_DESC(SMEM_INFO_PK) */ 
    NVL(MAX(SUBSTR(S.SNO,-4)),0)+1  SNO
FROM SMEM_INFO    S;

-- ��üȸ����ȸ(SelectAll)
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

-- ȸ������(Insert)
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
            ,'�迬��'
            ,'19990101'
            ,'M'
            ,'01012341234'
            ,'testMail@gmail.com'
            ,'01234'
            ,'����� ���α� ���赿'
            ,SYSDATE
            ,SYSDATE
            ,'N');

-- ȸ����������(update)
UPDATE SMEM_INFO    S
SET  S.SPW = 'pw1234'
    ,S.SNAME = '�ڿ���'
    ,S.SBIRTH = '19990101'
    ,S.SGENDER = 'M'
    ,S.SHP = '01012341234'
    ,S.SMAIL = 'testMail@gmail.com'
    ,S.SPOST = '01234'
    ,S.SADDR = '����� ���α� ���赿'
    ,S.SUPDATEDATE = SYSDATE
WHERE S.SDELETEYN = 'N'
AND   S.SNO = 'S202011120000';

  
-- ȸ��Ż��(delete)
UPDATE SMEM_INFO    S
SET  S.SUPDATEDATE = SYSDATE
    ,S.SDELETEYN = 'Y'
WHERE S.SDELETEYN = 'N'
AND   S.SNO = 'S202011120000';


-- ȸ����ȸ(detail)
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

-- ȸ���˻�(Search)
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