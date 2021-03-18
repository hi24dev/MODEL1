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
		
		sb.append("SELECT					");
		sb.append("      S.SNO   SNO		");
		sb.append("FROM  SMEM_INFO S		");
		sb.append("WHERE S.SSID = ?		");
		sb.append("AND   S.SPW = ?			");
		sb.append("AND   S.SDELETEYN = 'N'	");
		
		String strResult = sb.toString();
		
		System.out.println("[log] SjhSqlQueryMap.getLoginQuery() 함수 끝");
		return strResult;
	}// end of 로그인
	
	// 회원가입 쿼리
	public static String getInsertSmemberQuery(){
		System.out.println("[log] SjhSqlQueryMap 회원가입 쿼리 함수 시작");
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO SMEM_INFO(				");
		sb.append(" 					 SNO			");
		sb.append("						,SSID			");
		sb.append("						,SPW			");
		sb.append("						,SNAME			");
		sb.append("						,SBIRTH			");
		sb.append("						,SGENDER		");
		sb.append("						,SHP			");
		sb.append("						,SMAIL			");
		sb.append("						,SPOST			");
		sb.append("						,SADDR			");
		sb.append("						,SINSERTDATE	");
		sb.append("						,SUPDATEDATE	");
		sb.append("						,SDELETEYN		");
		sb.append("			)VALUES(					");   
		sb.append("					 ?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,?					");
		sb.append("					,SYSDATE			");
		sb.append("					,SYSDATE			");
		sb.append("					,'N'				");
		sb.append("						)				");
		
		String strResult = sb.toString();
		System.out.println("[log] SjhSqlQueryMap 회원가입 쿼리 함수 끝");
		return strResult;
	}// end of 회원가입
}// end of SjhSqlQueryMap
