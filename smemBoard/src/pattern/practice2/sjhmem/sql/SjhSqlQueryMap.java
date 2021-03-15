package pattern.practice2.sjhmem.sql;

public class SjhSqlQueryMap {

	// 로그인 쿼리
	public static String getLoginQuery(){
		System.out.println("[log] SjhSqlQueryMap.getLoginQuery() 함수 시작");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT					");
		sb.append("      S.SNO   SNO		");
		sb.append("FROM  SMEM_INFO S		");
		sb.append("WHERE S.SSID = ?		");
		sb.append("AND   S.SPW = ?			");
		sb.append("AND   S.SDELETEYN = 'N'	");
		
		String rst = sb.toString();
		
		System.out.println("[log] SjhSqlQueryMap.getLoginQuery() 함수 끝");
		return rst;
	}// end of 로그인
	
}// end of SjhSqlQueryMap
