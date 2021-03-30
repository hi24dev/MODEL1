package pattern.practice2.sboard.sql;

public abstract class SboardSqlQueryMap {

	public static final String SBOARD_CHAEBUN = 
			  "SELECT /*+ INDEX_DESC(SBOARD_DATA_PK) */ " 
		    + "		NVL(MAX(SUBSTR(B.BNO,-4)),0)+1  BNO "
			+ "FROM SBOARD_DATA    B";
	
	// ��ü��ȸ����
	public static String getSelectAllSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap ��ü��ȸ ���� �Լ� ����");
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT							");
		sb.append("	 B.BNO          BNO				");
		sb.append("	,B.BSUBJECT     BSUBJECT		");
		sb.append("	,B.BNAME        BNAME			");
		sb.append("	,B.BPW          BPW				");
		sb.append("	,B.BMEMO        BMEMO			");
		sb.append("	,B.BINSERTDATE  BINSERTDATE		");
		sb.append("	,B.BUPDATEDATE  BUPDATEDATE		");
		sb.append("FROM SBOARD_DATA  B				");
		sb.append("WHERE B.BDELETEYN = 'N'			");
		sb.append("ORDER BY B.BNO					");
		
		String resultStr = sb.toString();

		System.out.println("[log] SboardSqlQueryMap ��ü��ȸ ���� �Լ� ����");
		return resultStr;
	}// end of ��ü��ȸ
	
	// ���ۼ� ����
	public static String getInsertSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap ���ۼ� ���� �Լ� ����");
		
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO SBOARD_DATA(				");
		sb.append(" 					 BNO			");
		sb.append("						,BSUBJECT		");
		sb.append("						,BNAME			");
		sb.append("						,BPW			");
		sb.append("						,BMEMO			");
		sb.append("						,BINSERTDATE	");
		sb.append("						,BUPDATEDATE	");
		sb.append("						,BDELETEYN		");
		sb.append("			)VALUES(					");   
		sb.append("					 ?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,SYSDATE			");
		sb.append("					,SYSDATE			");
		sb.append("					,'N')				");
		
		String strResult = sb.toString();
		System.out.println("[log] SboardSqlQueryMap ���ۼ� ���� �Լ� ��");
		return strResult;
	}// end of ���ۼ�

	// ����ȸ����
	public static String getSelectSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap ����ȸ���� ����");
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT							");
		sb.append("	 B.BNO          BNO				");
		sb.append("	,B.BSUBJECT     BSUBJECT		");
		sb.append("	,B.BNAME        BNAME			");
		sb.append("	,B.BPW       	BPW				");
		sb.append("	,B.BMEMO        BMEMO			");
		sb.append("	,B.BINSERTDATE  BINSERTDATE		");
		sb.append("	,B.BUPDATEDATE  BUPDATEDATE		");
		sb.append("FROM SBOARD_DATA  B				");
		sb.append("WHERE B.BNO = ?					");
		sb.append("AND B.BDELETEYN = 'N'			");
		sb.append("ORDER BY B.BNO					");
		
		String resultStr = sb.toString();

		System.out.println("[log] SboardSqlQueryMap ����ȸ���� ����");
		return resultStr;
	}// end of ��ȸ����

	// �ۼ��� ����
	public static String getUpdateSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap �ۼ��� ���� �Լ� ����");
		
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE SBOARD_DATA    B			");
		sb.append("SET								");
		sb.append("	 	 B.BSUBJECT = ?				");
		sb.append("		,B.BNAME = ?				");
		sb.append("     ,B.BPW = ?					");
		sb.append("     ,B.BMEMO = ?				");
		sb.append("     ,B.BUPDATEDATE = SYSDATE	");
		sb.append("WHERE B.BDELETEYN = 'N'			");
		sb.append("AND   B.BNO = ?					");	
		
		String strResult = sb.toString();
		System.out.println("[log] SboardSqlQueryMap �ۼ��� ���� �Լ� ��");
		return strResult;
	}// end of �ۼ���
	
	// �ۻ��� ����
	public static String getDeleteSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap �ۻ��� ���� �Լ� ����");
		
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE SBOARD_DATA    B			");
		sb.append("SET								");
		sb.append("	 	 B.BDELETEYN = 'Y'			");
		sb.append("     ,B.BUPDATEDATE = SYSDATE	");
		sb.append("WHERE B.BDELETEYN = 'N'			");
		sb.append("AND   B.BNO = ?					");
		sb.append("AND   B.BPW = ?					");	
		
		String strResult = sb.toString();
		System.out.println("[log] SboardSqlQueryMap �ۻ��� ���� �Լ� ��");
		return strResult;
	}// end of �ۻ���	

}// end of SboardSqlQueryMap
