package pattern.practice2.sjhmem.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public abstract class SjhConnProperty {

	// dataSource
	public static final String ORACLE11G_JDBCDRIVER =
			"oracle.jdbc.driver.OracleDriver";
	public static final String ORACLE11G_URL =
			"jdbc:oracle:thin:@127.0.0.1:1521:orclSJH";
	public static final String ORACLE11G_USER = "scott";
	public static final String ORACLE11G_PASS= "tiger";
	
	// sql���� �Լ� getConnection()
	public static Connection getConnection() throws Exception{
		System.out.println("[log] pattern.practice2.sjhmem.common.SjhConnPropertyŬ����"
							+ " >>> getConnection() �Լ� ���� ");
		
		Connection con = null;
		Class.forName(ORACLE11G_JDBCDRIVER);
		con = DriverManager.getConnection(ORACLE11G_URL
										 ,ORACLE11G_USER
										 ,ORACLE11G_PASS);
		
		System.out.println("[log] getConnection() �Լ� �� ");
		return con;
	}// end of getConnection()
	
	// sql���� conClose(con,pstmt,rsRs)
	public static void conClose( Connection con
								,PreparedStatement pstmt
								,ResultSet rsRs){
		System.out.println("[log] pattern.practice2.sjhmem.common.SjhConnPropertyŬ����"
				+ " >>> conClose(con,pstmt,rsRs) �Լ� ����");
		
		try{
			if(rsRs != null) try { rsRs.close(); rsRs = null; } catch (Exception ex) {}
			if(pstmt != null) try { pstmt.close(); pstmt = null; } catch(Exception ex) {}
			if(con != null) try { con.close(); con = null; } catch(Exception ex){}
		}
		catch (Exception e2){}// end of try catch
		
		System.out.println("[log] conClose(con,pstmt,rsRs) �Լ� �� ");
	}// end of conClose(con,pstmt,rsRs)
	
	// sql���� conClose(con,pstmt)
	public static void conClose( Connection con
								,PreparedStatement pstmt){
		System.out.println("[log] pattern.practice2.sjhmem.common.SjhConnPropertyŬ����"
				+ " >>> conClose(con,pstmt) �Լ� ����");
		
		try{
			if(pstmt != null) try { pstmt.close(); pstmt = null; } catch(Exception ex) {}
			if(con != null) try { con.close(); con = null; } catch(Exception ex){}
		}
		catch (Exception e2){}// end of try catch
		
		System.out.println("[log] conClose(con,pstmt) �Լ� �� ");
	}// end of conClose(con,pstmt)
}// end of abstract SjhConnProperty
