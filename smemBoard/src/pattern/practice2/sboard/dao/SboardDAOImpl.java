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

	// 게시글 전체조회
	@Override
	public ArrayList<SboardVO> selectAllSboard(){
		System.out.println("[log]다오임플 게시글 전체조회 함수 호출!");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<SboardVO> aList = null;
		SboardVO sbvo = null;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log]게시글 전체조회 db연결!");
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
				System.out.println("전체조회 rsRs가 널");
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]게시글 전체조회 db연결 종료!");
		}catch(Exception e){
			System.out.println("[log]다오임플 게시글 전체조회 db연결 에러 >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]게시글 전체조회 db연결 종료!");
		}// try-catch-finally
		
		System.out.println("[log]다오임플 게시글 전체조회 함수 종료! >>> aList.size():" + aList.size());
		return aList;
	}// end of 전체조회

	// 게시글 작성(insert)
	@Override
	public Boolean insertSboard(SboardVO _sbvo){
		System.out.println("[log] 다오임플 게시글 작성 함수 시작!");
		SboardVO.printVO();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean insertBool = false;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db연결 성공!");
			pstmt = con.prepareStatement(SboardSqlQueryMap.getInsertSboardQuery());
			pstmt.setString(1, SjhChaebun.chaebunBoardMethod());
			pstmt.setString(2, _sbvo.getBsubject());
			pstmt.setString(3, _sbvo.getBname());
			pstmt.setString(4, _sbvo.getBpw());
			pstmt.setString(5, _sbvo.getBmemo());
			
			int nCntInsert = pstmt.executeUpdate();
			if(nCntInsert>=1){
				System.out.println("[log]insert 성공 >>> nCntInsert:" + nCntInsert);
				insertBool = true;
			}else{
				System.out.println("[log]insert 실패 >>> nCntInsert:" + nCntInsert);
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db연결 종료");
			
		}catch(Exception e){
			System.out.println("[log]게시글 작성 db연결 에러 >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db연결 종료");
		}// end of try-catch-finally
		
		return insertBool;
	};// end of insertSboard

	// 게시글 조회(select)
	@Override
	public ArrayList<SboardVO> selectSboard(SboardVO _sbvo){
		System.out.println("[log]다오임플 게시글 조회 함수 호출! >>> _sbvo.getBno():" + _sbvo.getBno());
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<SboardVO> aList = null;
		SboardVO sbvo = null;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log]게시글 조회 db연결!");
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
				System.out.println("조회 rsRs가 널");
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]게시글 조회 db연결 종료!");
		}catch(Exception e){
			System.out.println("[log]다오임플 게시글 조회 db연결 에러 >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]게시글 조회 db연결 종료!");
		}// try-catch-finally
		
		System.out.println("[log]다오임플 게시글 조회 함수 종료! >>> aList.size():" + aList.size());
		return aList;
	};// end of selectSboard

	// 게시글 수정(update)
	@Override
	public Boolean updateSboard(SboardVO _sbvo){
		System.out.println("[log] 다오임플 게시글 수정 함수 시작!");
		SboardVO.printVO();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean updateBool = false;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db연결 성공!");
			pstmt = con.prepareStatement(SboardSqlQueryMap.getUpdateSboardQuery());
			pstmt.setString(1, _sbvo.getBsubject());
			pstmt.setString(2, _sbvo.getBname());
			pstmt.setString(3, _sbvo.getBpw());
			pstmt.setString(4, _sbvo.getBmemo());
			pstmt.setString(5, _sbvo.getBno());
			
			int nCntUpdate = pstmt.executeUpdate();
			if(nCntUpdate>=1){
				System.out.println("[log]update 성공 >>> nCntUpdate:" + nCntUpdate);
				updateBool = true;
			}else{
				System.out.println("[log]update 실패 >>> nCntUpdate:" + nCntUpdate);
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db연결 종료");
			
		}catch(Exception e){
			System.out.println("[log]게시글 수정 db연결 에러 >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db연결 종료");
		}// end of try-catch-finally
		
		return updateBool;
	}// end of 수정
	
	// 게시글 삭제(delete)
	@Override
	public Boolean deleteSboard(SboardVO _sbvo){
		System.out.println("[log] 다오임플 게시글 삭제 함수 시작! >>> _sbvo.getBno():" + _sbvo.getBno()
													   + ",_sbvo.getBpw():" + _sbvo.getBpw());
		
		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean deleteBool = false;
		
		try{
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db연결 성공!");
			pstmt = con.prepareStatement(SboardSqlQueryMap.getDeleteSboardQuery());
			pstmt.setString(1, _sbvo.getBno());
			pstmt.setString(2, _sbvo.getBpw());
			
			int nCntDelete = pstmt.executeUpdate();
			if(nCntDelete>=1){
				System.out.println("[log]delete 성공 >>> nCntDelete:" + nCntDelete);
				deleteBool = true;
			}else{
				System.out.println("[log]delete 실패 >>> nCntDelete:" + nCntDelete);
			}// end of if-else
			
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db연결 종료");
			
		}catch(Exception e){
			System.out.println("[log]게시글 삭제 db연결 에러 >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log] db연결 종료");
		}// end of try-catch-finally
		
		return deleteBool;
	}// end of 삭제
	
}// end of SboardDAOImpl
