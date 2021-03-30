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
			pstmt.setString(1, _smvo.getSsid());
			pstmt.setString(2, _smvo.getSpw());
			rsRs = pstmt.executeQuery();
			
			// ���ϰ�� ��üũ
			if(rsRs!=null){
				System.out.println("rsRs ��üũ if�� ����");
				aList = new ArrayList<SmemberVO>();
				
				while(rsRs.next()){
					smvo = new SmemberVO();
					smvo.setSno(rsRs.getString("sno"));
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
			String sno = SjhChaebun.chaebunMethod();
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
	
	// ��üȸ��(selectAll)
	@Override
	public ArrayList<SmemberVO> selectAllSmember(){
		System.out.println("[log] SmemberDAOImpl ��üȸ������ �Լ� ȣ��!");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<SmemberVO> array = null;
		SmemberVO svo = null;
		
		try{
			//db����
			con = SjhConnProperty.getConnection();
			System.out.println("[log] ��üȸ����ȸ db���� ����!");
			pstmt = con.prepareStatement(SjhSqlQueryMap.getSelectAllSmemberQuery());
			rsRs = pstmt.executeQuery();
			
			// nullüũ
			if(rsRs!=null){
				array = new ArrayList<SmemberVO>();
				while(rsRs.next()){
					svo = new SmemberVO();
					svo.setSno(rsRs.getString("sno"));
					svo.setSsid(rsRs.getString("ssid"));
					svo.setSname(rsRs.getString("sname"));
					svo.setSbirth(rsRs.getString("sbirth"));
					svo.setSgender(rsRs.getString("sgender"));
					svo.setShp(rsRs.getString("shp"));
					svo.setSmail(rsRs.getString("smail"));
					svo.setSpost(rsRs.getString("spost"));
					svo.setSaddr(rsRs.getString("saddr"));
					array.add(svo);
				}// end of while
			}else{
				System.out.println("rsRs�� null");
			}// end of if
			
			System.out.println("������Ȯ�� >>> array ������:" + array.size());
			//db���� ����
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db��������");
		}catch(Exception e){
			System.out.println("[log] ��üȸ����ȸ db���� ���� >>> " + e.getMessage());
		}finally{
			//db���� ����
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db��������");
		}// end of try-catch-finally
		
		System.out.println("[log] SmemberDAOImpl ��üȸ������ �Լ� ����!");
		return array;
	}// end of selectAllSmember()

	// ȸ���˻�(search)
	@Override
	// ȸ���˻� search
	public ArrayList<SmemberVO> searchSmember(SmemberVO _smvo){
		System.out.println("[log]�ٿ����� searchSmember�Լ� ȣ�� ���� >>> ������Ȯ�� sno:" + _smvo.getSno());
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<SmemberVO> searchArray = null;
		SmemberVO svo = null;
		
		try{
			con = SjhConnProperty.getConnection();
			pstmt = con.prepareStatement(SjhSqlQueryMap.getSearchSmemberQuery());
			pstmt.setString(1, _smvo.getSno());
			rsRs = pstmt.executeQuery();
			
			// nullüũ
			if(rsRs!=null){
				searchArray = new ArrayList<SmemberVO>();
				while(rsRs.next()){
					svo = new SmemberVO();
					svo.setSno(rsRs.getString("sno"));
					svo.setSsid(rsRs.getString("ssid"));
					svo.setSpw(rsRs.getString("spw"));
					svo.setSname(rsRs.getString("sname"));
					svo.setSbirth(rsRs.getString("sbirth"));
					svo.setSgender(rsRs.getString("sgender"));
					svo.setShp(rsRs.getString("shp"));
					svo.setSmail(rsRs.getString("smail"));
					svo.setSpost(rsRs.getString("spost"));
					svo.setSaddr(rsRs.getString("saddr"));
					svo.setSinsertdate(rsRs.getString("sinsertdate"));
					svo.setSupdatedate(rsRs.getString("supdatedate"));
					searchArray.add(svo);
				}// end of while
			}else{
				System.out.println("searchSmember�� rsRs�� ��");
			}// end of if-else
			
			// db��������
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]ȸ���˻� db��������");
		}catch(Exception e){
			System.out.println("[log]ȸ���˻� db���� ���� >>> " + e.getMessage());
		}finally{
			// db��������
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]ȸ���˻� db��������");
		}// end of try-catch-finally
		
		System.out.println("[log]�ٿ����� searchSmember�Լ� ����");
		return searchArray;
	}// end of ȸ���˻�
	
	// ȸ����������(update)
	@Override
	public Boolean updateSmember(SmemberVO _smvo){
		System.out.println("[log]�ٿ����� updateSmember �Լ� ���� >>>> ������Ȯ�� _smvo.getSno():" + _smvo.getSno());

		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean updateBool = false;
		int updateInt = 0;
		
		try{
			con = SjhConnProperty.getConnection();
			pstmt = con.prepareStatement(SjhSqlQueryMap.getUpdateSmemberQuery());
			pstmt.setString(1, _smvo.getSpw());
			pstmt.setString(2, _smvo.getSname());
			pstmt.setString(3, _smvo.getSbirth());
			pstmt.setString(4, _smvo.getSgender());
			pstmt.setString(5, _smvo.getShp());
			pstmt.setString(6, _smvo.getSmail());
			pstmt.setString(7, _smvo.getSpost());
			pstmt.setString(8, _smvo.getSaddr());
			pstmt.setString(9, _smvo.getSno());
			
			updateInt = pstmt.executeUpdate();
			System.out.println("�ٿ����� �������� updateInt:" + updateInt);
			
			//db��������
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log]�������� db��������");
		}catch(Exception e){
			System.out.println("[log]ȸ���������� db���� ���� >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log]�������� db��������");
		}// end of try-catch-finally
		
			if(updateInt==1){
				updateBool = true;
			}// end of if
		System.out.println("[log]�ٿ����� updateSmember �Լ� ���� >>> updateBool:" + updateBool);	
		return updateBool;
	}// end of ȸ����������

	// ȸ��Ż��(delete)
	@Override
	// ȸ��Ż�� delete
	public Boolean deleteSmember(SmemberVO _smvo){
		System.out.println("[log]�ٿ����� deleteSmember �Լ� ���� >>>> ������Ȯ�� _smvo.getSno():" + _smvo.getSno());

		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean deleteBool = false;
		int deleteInt = 0;
		
		try{
			con = SjhConnProperty.getConnection();
			pstmt = con.prepareStatement(SjhSqlQueryMap.getDeleteSmemberQuery());
			pstmt.setString(1, _smvo.getSno());
			
			deleteInt = pstmt.executeUpdate();
			System.out.println("�ٿ����� ȸ��Ż�� deleteInt:" + deleteInt);
			
			//db��������
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log]ȸ��Ż�� db��������");
		}catch(Exception e){
			System.out.println("[log]ȸ��Ż�� db���� ���� >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log]ȸ��Ż�� db��������");
		}// end of try-catch-finally
		
			if(deleteInt==1){
				deleteBool = true;
			}// end of if
		System.out.println("[log]�ٿ����� deleteSmember �Լ� ���� >>> deleteBool:" + deleteBool);	
		return deleteBool;
	}// end of ȸ��Ż��
}// end of SmemberDAOImpl
