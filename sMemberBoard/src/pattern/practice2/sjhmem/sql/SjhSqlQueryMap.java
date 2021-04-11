package pattern.practice2.sjhmem.sql;

public abstract class SjhSqlQueryMap {

	public static final String SMEMBER_CHAEBUN = 
			  "SELECT 	/*+ INDEX_DESC(SMEM_INFO_PK) */ " 
		    + "		NVL(MAX(SUBSTR(S.SNO,-4)),0)+1	SNO "
			+ "FROM SMEM_INFO    S";
	// 로그인 쿼리
	public static String getLoginQuery(){
		System.out.println("[log] SjhSqlQueryMap 로그인 쿼리 함수 시작");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT					\n");
		sb.append("      S.SNO   SNO		\n");
		sb.append("FROM  SMEM_INFO S		\n");
		sb.append("WHERE S.SSID = ?			\n");
		sb.append("AND   S.SPW = ?			\n");
		sb.append("AND   S.SDELETEYN = 'N'	\n");
		
		String strResult = sb.toString();
		
		System.out.println("[log] SjhSqlQueryMap.getLoginQuery() 함수 끝");
		return strResult;
	}// end of 로그인
	
	// 회원가입 쿼리
	public static String getInsertSmemberQuery(){
		System.out.println("[log] SjhSqlQueryMap 회원가입 쿼리 함수 시작");
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO SMEM_INFO(				\n");
		sb.append(" 					 SNO			\n");
		sb.append("						,SSID			\n");
		sb.append("						,SPW			\n");
		sb.append("						,SNAME			\n");
		sb.append("						,SBIRTH			\n");
		sb.append("						,SGENDER		\n");
		sb.append("						,SHP			\n");
		sb.append("						,SMAIL			\n");
		sb.append("						,SPOST			\n");
		sb.append("						,SADDR			\n");
		sb.append("						,SINSERTDATE	\n");
		sb.append("						,SUPDATEDATE	\n");
		sb.append("						,SDELETEYN		\n");
		sb.append("			)VALUES(					\n");   
		sb.append("					 ?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,?					\n");
		sb.append("					,SYSDATE			\n");
		sb.append("					,SYSDATE			\n");
		sb.append("					,'N'				\n");
		sb.append("						)				\n");
		
		String strResult = sb.toString();
		System.out.println("[log] SjhSqlQueryMap 회원가입 쿼리 함수 끝");
		return strResult;
	}// end of 회원가입
	
	// 전체회원조회 쿼리
	public static String getSelectAllSmemberQuery(){
		System.out.println("[log] SjhSqlQueryMap 전체회원조회 쿼리 함수 시작");
		
		StringBuffer sbf = new StringBuffer();
		sbf.append("SELECT							\n");
		sbf.append("	 S.SNO          SNO			\n");
		sbf.append("	,S.SSID         SSID		\n");
		sbf.append("	,S.SNAME        SNAME		\n");
		sbf.append("	,S.SBIRTH       SBIRTH		\n");
		sbf.append("	,S.SGENDER      SGENDER		\n");
		sbf.append("	,S.SHP          SHP			\n");
		sbf.append("	,S.SMAIL        SMAIL		\n");
		sbf.append("	,S.SPOST        SPOST		\n");
		sbf.append("	,S.SADDR        SADDR		\n");
		sbf.append("FROM SMEM_INFO  S				\n");
		sbf.append("WHERE S.SDELETEYN = 'N'			\n");
		sbf.append("ORDER BY S.SNO					\n");

		String resultStr = sbf.toString();
		return resultStr;
	}// end of 전체회원조회쿼리
	
	// 회원검색 쿼리
	public static String getSearchSmemberQuery(){
		
		StringBuffer sbf = new StringBuffer();
		sbf.append("SELECT							\n");
		sbf.append("	 S.SNO          SNO			\n");
		sbf.append("	,S.SSID         SSID		\n");
		sbf.append("	,S.SPW          SPW			\n");
		sbf.append("	,S.SNAME        SNAME		\n");
		sbf.append("	,S.SBIRTH       SBIRTH		\n");
		sbf.append("	,S.SGENDER      SGENDER		\n");
		sbf.append("	,S.SHP          SHP			\n");
		sbf.append("	,S.SMAIL        SMAIL		\n");
		sbf.append("	,S.SPOST        SPOST		\n");
		sbf.append("	,S.SADDR        SADDR		\n");
		sbf.append("	,TO_CHAR(S.SINSERTDATE,'YYYY-MM-DD')   SINSERTDATE	\n");
		sbf.append("	,TO_CHAR(S.SUPDATEDATE,'YYYY-MM-DD')   SUPDATEDATE	\n");
		sbf.append("FROM SMEM_INFO  S				\n");
		sbf.append("WHERE S.SNO = ?					\n");
		sbf.append("AND S.SDELETEYN = 'N'			\n");
		sbf.append("ORDER BY S.SNO					\n");

		String resultStr = sbf.toString();
		return resultStr;
	}// end of 회원검색쿼리

	// 회원정보수정 쿼리
	public static String getUpdateSmemberQuery(){
		System.out.println("[log]회원정보수정쿼리");
		
		StringBuffer sbf = new StringBuffer();
		sbf.append("UPDATE SMEM_INFO    S			\n");
		sbf.append("SET								\n");
		sbf.append("	 S.SPW = ?					\n");
		sbf.append("	,S.SNAME = ?				\n");
		sbf.append("    ,S.SBIRTH = ?				\n");
		sbf.append("    ,S.SGENDER = ?				\n");
		sbf.append("    ,S.SHP = ?					\n");
		sbf.append("    ,S.SMAIL = ?				\n");
		sbf.append("    ,S.SPOST = ?				\n");
		sbf.append("    ,S.SADDR = ?				\n");
		sbf.append("    ,S.SUPDATEDATE = SYSDATE	\n");
		sbf.append("WHERE S.SDELETEYN = 'N'			\n");
		sbf.append("AND   S.SNO = ?					\n");	
		
		String resultStr = sbf.toString();
		return resultStr;
	}// end of 회원정보수정쿼리

	// 회원탈퇴 쿼리
	public static String getDeleteSmemberQuery(){
		System.out.println("[log]회원탈퇴쿼리");
		
		StringBuffer sbf = new StringBuffer();
		sbf.append("UPDATE SMEM_INFO    S			\n");
		sbf.append("SET								\n");
		sbf.append("	 S.SUPDATEDATE = SYSDATE	\n");
		sbf.append("	,S.SDELETEYN = 'Y'			\n");
		sbf.append("WHERE S.SDELETEYN = 'N'			\n");
		sbf.append("AND   S.SNO = ?					\n");	
		
		String resultStr = sbf.toString();
		return resultStr;
	}// end of 회원탈퇴쿼리

}// end of SjhSqlQueryMap
