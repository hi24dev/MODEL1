package pattern.practice2.sjhmem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import pattern.practice2.sjhmem.common.SjhChaebun;
import pattern.practice2.sjhmem.common.SjhConnProperty;
import pattern.practice2.sjhmem.sql.SjhSqlQueryMap;
import pattern.practice2.sjhmem.vo.SmemberVO;

public class SmemberDAOImpl implements SmemberDAO {

	// �α���
	@Override
	public ArrayList<SmemberVO> loginSmember(SmemberVO _smvo) {
		System.out.println("[log] SmemberDAOImpl �α��� �Լ� ȣ��!\n"
												+ "������Ȯ�� ssid : " + _smvo.getSsid() + ", spw : " + _smvo.getSpw());
				
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		SmemberVO smvo = null;
		ArrayList<SmemberVO> aList = null;
		
		try {
			// db����
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db���� ����");
			pstmt = con.prepareStatement(SjhSqlQueryMap.getLoginQuery());
			System.out.println("üũ!!!!!!!!");
			pstmt.setString(1, _smvo.getSsid());
			pstmt.setString(2, _smvo.getSpw());
			rsRs = pstmt.executeQuery();
			
			// ���ϰ�� ��üũ
			if(rsRs!=null){
				System.out.println("rsRs ��üũ if�� ����");
				aList = new ArrayList<SmemberVO>();
				
				while(rsRs.next()){
					smvo = new SmemberVO();
					smvo.setSsid(rsRs.getString("sno"));
					aList.add(smvo);
				}// end of while
			}// end of if
			System.out.println("������Ȯ�� >>> aList ����  : " + aList.size());
		
			// db���� ����
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db���� ����");
			
		} catch (Exception e) {
			System.out.println("[log] db���� ���� >>> " + e.getMessage());
		} finally {
			// db���� ����
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db���� ����");
		}// end of try-catch-finally
		
		System.out.println("������Ȯ��2 >>> aList ����  : " + aList.size());
		return aList;
	} // end of login


	// ȸ������(insert)
	@Override
	public Boolean insertSmember(SmemberVO _smvo) {
		System.out.println("[log] �ٿ����� insertSmember �Լ� ȣ��!"
									+ "\n������Ȯ�� >>> _smvo.getSsid():" + _smvo.getSsid());
		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean insertBool = false;
		
		//db����
		try {
			con = SjhConnProperty.getConnection();
			pstmt = con.prepareStatement(SjhSqlQueryMap.getInsertSmemberQuery());
			
			// ä��
			String sno = SjhChaebun.chaebunMethod("member");
			pstmt.setString(1, sno);
			pstmt.setString(2, _smvo.getSsid());
			pstmt.setString(3, _smvo.getSpw());
			pstmt.setString(4, _smvo.getSname());
			pstmt.setString(5, _smvo.getSbirth());
			pstmt.setString(6, _smvo.getSgender());
			pstmt.setString(7, _smvo.getShp());
			pstmt.setString(8, _smvo.getSmail());
			pstmt.setString(9, _smvo.getSpost());
			pstmt.setString(10, _smvo.getSaddr());
			
			int updateInt = pstmt.executeUpdate();
			System.out.println("updateInt:" + updateInt);
			
			// int to boolean ����ȯ
			if(updateInt==1){
				insertBool = true;
			}// end of if
			
			//db��������
			SjhConnProperty.conClose(con, pstmt);
		} catch (Exception e) {
			System.out.println("ȸ������ db���� ���� >>> " + e.getMessage());
		} finally {
			//db��������
			SjhConnProperty.conClose(con, pstmt);
		}// end of try-catch-finally
		
		System.out.println("insertBool:" + insertBool);
		return insertBool;
	}// end of insertSmember()
	
	
	
}// end of SmemberDAOImpl
