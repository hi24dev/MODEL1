package pattern.practice2.sjhmem.sql;

public class SjhSqlQueryMap {

	// �α��� ����
	public static String getLoginQuery(){
		System.out.println("[log] SjhSqlQueryMap.getLoginQuery() �Լ� ����");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT					");
		sb.append("      S.SNO   SNO		");
		sb.append("FROM  SMEM_INFO S		");
		sb.append("WHERE S.SSID = ?		");
		sb.append("AND   S.SPW = ?			");
		sb.append("AND   S.SDELETEYN = 'N'	");
		
		String rst = sb.toString();
		
		System.out.println("[log] SjhSqlQueryMap.getLoginQuery() �Լ� ��");
		return rst;
	}// end of �α���
	
}// end of SjhSqlQueryMap
