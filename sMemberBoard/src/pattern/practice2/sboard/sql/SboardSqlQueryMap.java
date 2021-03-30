package pattern.practice2.sboard.sql;

public abstract class SboardSqlQueryMap {

	public static final String SBOARD_CHAEBUN = 
			  "SELECT /*+ INDEX_DESC(SBOARD_DATA_PK) */ " 
		    + "		NVL(MAX(SUBSTR(B.BNO,-4)),0)+1  BNO "
			+ "FROM SBOARD_DATA    B";
	
	// 전체조회쿼리
	public static String getSelectAllSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 전체조회 쿼리 함수 시작");
		
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

		System.out.println("[log] SboardSqlQueryMap 전체조회 쿼리 함수 종료");
		return resultStr;
	}// end of 전체조회
	
	// 글작성 쿼리
	public static String getInsertSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 글작성 쿼리 함수 시작");
		
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
		System.out.println("[log] SboardSqlQueryMap 글작성 쿼리 함수 끝");
		return strResult;
	}// end of 글작성

	// 글조회쿼리
	public static String getSelectSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 글조회쿼리 시작");
		
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

		System.out.println("[log] SboardSqlQueryMap 글조회쿼리 종료");
		return resultStr;
	}// end of 조회쿼리

	// 글수정 쿼리
	public static String getUpdateSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 글수정 쿼리 함수 시작");
		
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
		System.out.println("[log] SboardSqlQueryMap 글수정 쿼리 함수 끝");
		return strResult;
	}// end of 글수정
	
	// 글삭제 쿼리
	public static String getDeleteSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 글삭제 쿼리 함수 시작");
		
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE SBOARD_DATA    B			");
		sb.append("SET								");
		sb.append("	 	 B.BDELETEYN = 'Y'			");
		sb.append("     ,B.BUPDATEDATE = SYSDATE	");
		sb.append("WHERE B.BDELETEYN = 'N'			");
		sb.append("AND   B.BNO = ?					");
		sb.append("AND   B.BPW = ?					");	
		
		String strResult = sb.toString();
		System.out.println("[log] SboardSqlQueryMap 글삭제 쿼리 함수 끝");
		return strResult;
	}// end of 글삭제	

}// end of SboardSqlQueryMap
