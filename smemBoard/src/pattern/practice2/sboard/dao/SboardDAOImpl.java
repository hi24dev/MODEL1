package pattern.practice2.sboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import pattern.practice2.sboard.sql.SboardSqlQueryMap;
import pattern.practice2.sboard.vo.SboardVO;
import pattern.practice2.sjhmem.common.SjhChaebun;
import pattern.practice2.sjhmem.common.SjhConnProperty;

public class SboardDAOImpl implements SboardDAO {

	// �Խñ� ��ü��ȸ
	@Override
	public ArrayList<SboardVO> selectAllSboard(){
		System.out.println("[log]�ٿ����� �Խñ� ��ü��ȸ �Լ� ȣ��!");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<SboardVO> aList = null;
		SboardVO sbvo = null;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log]�Խñ� ��ü��ȸ db����!");
			pstmt = con.prepareStatement(SboardSqlQueryMap.getSelectAllSboardQuery());
			rsRs = pstmt.executeQuery();
			
			if(rsRs!=null){
				aList = new ArrayList<SboardVO>();
				while(rsRs.next()){
					sbvo = new SboardVO();
					sbvo.setBno(rsRs.getString("bno"));
					sbvo.setBsubject(rsRs.getString("bsubject"));
					sbvo.setBname(rsRs.getString("bname"));
					sbvo.setBpw(rsRs.getString("bpw"));
					sbvo.setBmemo(rsRs.getString("bmemo"));
					sbvo.setBinsertdate(rsRs.getString("binsertdate"));
					sbvo.setBupdatedate(rsRs.getString("bupdatedate"));
					aList.add(sbvo);
				}// end of while
				
			}else{
				System.out.println("��ü��ȸ rsRs�� ��");
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]�Խñ� ��ü��ȸ db���� ����!");
		}catch(Exception e){
			System.out.println("[log]�ٿ����� �Խñ� ��ü��ȸ db���� ���� >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]�Խñ� ��ü��ȸ db���� ����!");
		}// try-catch-finally
		
		System.out.println("[log]�ٿ����� �Խñ� ��ü��ȸ �Լ� ����! >>> aList.size():" + aList.size());
		return aList;
	}// end of ��ü��ȸ

	// �Խñ� �ۼ�(insert)
	@Override
	public Boolean insertSboard(SboardVO _sbvo){
		System.out.println("[log] �ٿ����� �Խñ� �ۼ� �Լ� ����!");
		SboardVO.printVO();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean insertBool = false;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db���� ����!");
			pstmt = con.prepareStatement(SboardSqlQueryMap.getInsertSboardQuery());
			pstmt.setString(1, SjhChaebun.chaebunBoardMethod());
			pstmt.setString(2, _sbvo.getBsubject());
			pstmt.setString(3, _sbvo.getBname());
			pstmt.setString(4, _sbvo.getBpw());
			pstmt.setString(5, _sbvo.getBmemo());
			
			int nCntInsert = pstmt.executeUpdate();
			if(nCntInsert>=1){
				System.out.println("[log]insert ���� >>> nCntInsert:" + nCntInsert);
				insertBool = true;
			}else{
				System.out.println("[log]insert ���� >>> nCntInsert:" + nCntInsert);
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db���� ����");
			
		}catch(Exception e){
			System.out.println("[log]�Խñ� �ۼ� db���� ���� >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db���� ����");
		}// end of try-catch-finally
		
		return insertBool;
	};// end of insertSboard

	// �Խñ� ��ȸ(select)
	@Override
	public ArrayList<SboardVO> selectSboard(SboardVO _sbvo){
		System.out.println("[log]�ٿ����� �Խñ� ��ȸ �Լ� ȣ��! >>> _sbvo.getBno():" + _sbvo.getBno());
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<SboardVO> aList = null;
		SboardVO sbvo = null;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log]�Խñ� ��ȸ db����!");
			pstmt = con.prepareStatement(SboardSqlQueryMap.getSelectSboardQuery());
			pstmt.setString(1, _sbvo.getBno());
			rsRs = pstmt.executeQuery();
			
			if(rsRs!=null){
				aList = new ArrayList<SboardVO>();
				while(rsRs.next()){
					sbvo = new SboardVO();
					sbvo.setBno(rsRs.getString("bno"));
					sbvo.setBsubject(rsRs.getString("bsubject"));
					sbvo.setBname(rsRs.getString("bname"));
					sbvo.setBpw(rsRs.getString("bpw"));
					sbvo.setBmemo(rsRs.getString("bmemo"));
					sbvo.setBinsertdate(rsRs.getString("binsertdate"));
					sbvo.setBupdatedate(rsRs.getString("bupdatedate"));
					aList.add(sbvo);
				}// end of while
				
			}else{
				System.out.println("��ȸ rsRs�� ��");
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]�Խñ� ��ȸ db���� ����!");
		}catch(Exception e){
			System.out.println("[log]�ٿ����� �Խñ� ��ȸ db���� ���� >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]�Խñ� ��ȸ db���� ����!");
		}// try-catch-finally
		
		System.out.println("[log]�ٿ����� �Խñ� ��ȸ �Լ� ����! >>> aList.size():" + aList.size());
		return aList;
	};// end of selectSboard

	// �Խñ� ����(update)
	@Override
	public Boolean updateSboard(SboardVO _sbvo){
		System.out.println("[log] �ٿ����� �Խñ� ���� �Լ� ����!");
		SboardVO.printVO();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean updateBool = false;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db���� ����!");
			pstmt = con.prepareStatement(SboardSqlQueryMap.getUpdateSboardQuery());
			pstmt.setString(1, _sbvo.getBsubject());
			pstmt.setString(2, _sbvo.getBname());
			pstmt.setString(3, _sbvo.getBpw());
			pstmt.setString(4, _sbvo.getBmemo());
			pstmt.setString(5, _sbvo.getBno());
			
			int nCntUpdate = pstmt.executeUpdate();
			if(nCntUpdate>=1){
				System.out.println("[log]update ���� >>> nCntUpdate:" + nCntUpdate);
				updateBool = true;
			}else{
				System.out.println("[log]update ���� >>> nCntUpdate:" + nCntUpdate);
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db���� ����");
			
		}catch(Exception e){
			System.out.println("[log]�Խñ� ���� db���� ���� >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db���� ����");
		}// end of try-catch-finally
		
		return updateBool;
	}// end of ����
	
	// �Խñ� ����(delete)
	@Override
	public Boolean deleteSboard(SboardVO _sbvo){
		System.out.println("[log] �ٿ����� �Խñ� ���� �Լ� ����! >>> _sbvo.getBno():" + _sbvo.getBno()
													   + ",_sbvo.getBpw():" + _sbvo.getBpw());
		
		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean deleteBool = false;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db���� ����!");
			pstmt = con.prepareStatement(SboardSqlQueryMap.getDeleteSboardQuery());
			pstmt.setString(1, _sbvo.getBno());
			pstmt.setString(2, _sbvo.getBpw());
			
			int nCntDelete = pstmt.executeUpdate();
			if(nCntDelete>=1){
				System.out.println("[log]delete ���� >>> nCntDelete:" + nCntDelete);
				deleteBool = true;
			}else{
				System.out.println("[log]delete ���� >>> nCntDelete:" + nCntDelete);
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db���� ����");
			
		}catch(Exception e){
			System.out.println("[log]�Խñ� ���� db���� ���� >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db���� ����");
		}// end of try-catch-finally
		
		return deleteBool;
	}// end of ����
	
}// end of SboardDAOImpl
