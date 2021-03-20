package pattern.practice2.sjhmem.sql;

public abstract class SjhSqlQueryMap {

	public static final String SMEMBER_CHAEBUN = 
			  "SELECT 	/*+ INDEX_DESC(SMEM_INFO_PK) */ " 
		    + "		NVL(MAX(SUBSTR(S.SNO,-4)),0)+1	SNO "
			+ "FROM SMEM_INFO    S";
	// �α��� ����
	public static String getLoginQuery(){
		System.out.println("[log] SjhSqlQueryMap �α��� ���� �Լ� ����");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT					");
		sb.append("      S.SNO   SNO		");
		sb.append("FROM  SMEM_INFO S		");
		sb.append("WHERE S.SSID = ?		");
		sb.append("AND   S.SPW = ?			");
		sb.append("AND   S.SDELETEYN = 'N'	");
		
		String strResult = sb.toString();
		
		System.out.println("[log] SjhSqlQueryMap.getLoginQuery() �Լ� ��");
		return strResult;
	}// end of �α���
	
	// ȸ������ ����
	public static String getInsertSmemberQuery(){
		System.out.println("[log] SjhSqlQueryMap ȸ������ ���� �Լ� ����");
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
		System.out.println("[log] SjhSqlQueryMap ȸ������ ���� �Լ� ��");
		return strResult;
	}// end of ȸ������
	
	// ��üȸ����ȸ ����
	public static String getSelectAllSmemberQuery(){
		System.out.println("[log] SjhSqlQueryMap ��üȸ����ȸ ���� �Լ� ����");
		
		StringBuffer sbf = new StringBuffer();
		sbf.append("SELECT							");
		sbf.append("	 S.SNO          SNO			");
		sbf.append("	,S.SSID         SSID		");
		sbf.append("	,S.SNAME        SNAME		");
		sbf.append("	,S.SBIRTH       SBIRTH		");
		sbf.append("	,S.SGENDER      SGENDER		");
		sbf.append("	,S.SHP          SHP			");
		sbf.append("	,S.SMAIL        SMAIL		");
		sbf.append("	,S.SPOST        SPOST		");
		sbf.append("	,S.SADDR        SADDR		");
		sbf.append("FROM SMEM_INFO  S				");
		sbf.append("WHERE S.SDELETEYN = 'N'			");
		sbf.append("ORDER BY S.SNO					");

		String resultStr = sbf.toString();
		return resultStr;
	}// end of ��üȸ����ȸ����
	
	// ȸ���˻� ����
	public static String getSearchSmemberQuery(){
		
		StringBuffer sbf = new StringBuffer();
		sbf.append("SELECT							");
		sbf.append("	 S.SNO          SNO			");
		sbf.append("	,S.SSID         SSID		");
		sbf.append("	,S.SPW          SPW			");
		sbf.append("	,S.SNAME        SNAME		");
		sbf.append("	,S.SBIRTH       SBIRTH		");
		sbf.append("	,S.SGENDER      SGENDER		");
		sbf.append("	,S.SHP          SHP			");
		sbf.append("	,S.SMAIL        SMAIL		");
		sbf.append("	,S.SPOST        SPOST		");
		sbf.append("	,S.SADDR        SADDR		");
		sbf.append("	,TO_CHAR(S.SINSERTDATE,'YYYY-MM-DD')   SINSERTDATE	");
		sbf.append("	,TO_CHAR(S.SUPDATEDATE,'YYYY-MM-DD')   SUPDATEDATE	");
		sbf.append("FROM SMEM_INFO  S				");
		sbf.append("WHERE S.SNO = ?					");
		sbf.append("AND S.SDELETEYN = 'N'			");
		sbf.append("ORDER BY S.SNO					");

		String resultStr = sbf.toString();
		return resultStr;
	}// end of ȸ���˻�����
	
}// end of SjhSqlQueryMap
