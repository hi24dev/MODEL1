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
		sb.append("SELECT							\n");
		sb.append("	 B.BNO          BNO				\n");
		sb.append("	,B.BSUBJECT     BSUBJECT		\n");
		sb.append("	,B.BNAME        BNAME			\n");
		sb.append("	,B.BPW          BPW				\n");
		sb.append("	,B.BMEMO        BMEMO			\n");
		sb.append("	,B.BINSERTDATE  BINSERTDATE		\n");
		sb.append("	,B.BUPDATEDATE  BUPDATEDATE		\n");
		sb.append("FROM SBOARD_DATA  B				\n");
		sb.append("WHERE B.BDELETEYN = 'N'			\n");
		sb.append("ORDER BY B.BNO					\n");
		
		String resultStr = sb.toString();

		System.out.println("[log] SboardSqlQueryMap 전체조회 쿼리 함수 종료");
		return resultStr;
	}// end of 전체조회
	
	// 글작성 쿼리
	public static String getInsertSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 글작성 쿼리 함수 시작");
		
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO SBOARD_DATA(				\n");
		sb.append(" 					 BNO			\n");
		sb.append("						,BSUBJECT		\n");
		sb.append("						,BNAME			\n");
		sb.append("						,BPW			\n");
		sb.append("						,BMEMO			\n");
		sb.append("						,BINSERTDATE	\n");
		sb.append("						,BUPDATEDATE	\n");
		sb.append("						,BDELETEYN		\n");
		sb.append("			)VALUES(					\n");   
		sb.append("					 ?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,SYSDATE			\n");
		sb.append("					,SYSDATE			\n");
		sb.append("					,'N')				\n");
		
		String strResult = sb.toString();
		System.out.println("[log] SboardSqlQueryMap 글작성 쿼리 함수 끝");
		return strResult;
	}// end of 글작성

	// 글조회쿼리
	public static String getSelectSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 글조회쿼리 시작");
		
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT							\n");
		sb.append("	 B.BNO          BNO				\n");
		sb.append("	,B.BSUBJECT     BSUBJECT		\n");
		sb.append("	,B.BNAME        BNAME			\n");
		sb.append("	,B.BPW       	BPW				\n");
		sb.append("	,B.BMEMO        BMEMO			\n");
		sb.append("	,B.BINSERTDATE  BINSERTDATE		\n");
		sb.append("	,B.BUPDATEDATE  BUPDATEDATE		\n");
		sb.append("FROM SBOARD_DATA  B				\n");
		sb.append("WHERE B.BNO = ?					\n");
		sb.append("AND B.BDELETEYN = 'N'			\n");
		sb.append("ORDER BY B.BNO					\n");
		
		String resultStr = sb.toString();

		System.out.println("[log] SboardSqlQueryMap 글조회쿼리 종료");
		return resultStr;
	}// end of 조회쿼리

	// 글수정 쿼리
	public static String getUpdateSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 글수정 쿼리 함수 시작");
		
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE SBOARD_DATA    B			\n");
		sb.append("SET								\n");
		sb.append("	 	 B.BSUBJECT = ?				\n");
		sb.append("		,B.BNAME = ?				\n");
		sb.append("     ,B.BPW = ?					\n");
		sb.append("     ,B.BMEMO = ?				\n");
		sb.append("     ,B.BUPDATEDATE = SYSDATE	\n");
		sb.append("WHERE B.BDELETEYN = 'N'			\n");
		sb.append("AND   B.BNO = ?					\n");	
		
		String strResult = sb.toString();
		System.out.println("[log] SboardSqlQueryMap 글수정 쿼리 함수 끝");
		return strResult;
	}// end of 글수정
	
	// 글삭제 쿼리
	public static String getDeleteSboardQuery(){
		System.out.println("[log] SboardSqlQueryMap 글삭제 쿼리 함수 시작");
		
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE SBOARD_DATA    B			\n");
		sb.append("SET								\n");
		sb.append("	 	 B.BDELETEYN = 'Y'			\n");
		sb.append("     ,B.BUPDATEDATE = SYSDATE	\n");
		sb.append("WHERE B.BDELETEYN = 'N'			\n");
		sb.append("AND   B.BNO = ?					\n");
		sb.append("AND   B.BPW = ?					\n");	
		
		String strResult = sb.toString();
		System.out.println("[log] SboardSqlQueryMap 글삭제 쿼리 함수 끝");
		return strResult;
	}// end of 글삭제	

}// end of SboardSqlQueryMap
