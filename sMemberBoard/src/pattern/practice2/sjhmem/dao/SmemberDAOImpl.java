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

	// 로그인
	@Override
	public ArrayList<SmemberVO> loginSmember(SmemberVO _smvo) {
		System.out.println("[log] SmemberDAOImpl 로그인 함수 호출!\n"
												+ "데이터확인 ssid : " + _smvo.getSsid() + ", spw : " + _smvo.getSpw());
				
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		SmemberVO smvo = null;
		ArrayList<SmemberVO> aList = null;
		
		try {
			// db연결
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db연결 성공");
			pstmt = con.prepareStatement(SjhSqlQueryMap.getLoginQuery());
			pstmt.setString(1, _smvo.getSsid());
			pstmt.setString(2, _smvo.getSpw());
			rsRs = pstmt.executeQuery();
			
			// 리턴결과 널체크
			if(rsRs!=null){
				System.out.println("rsRs 널체크 if문 진입");
				aList = new ArrayList<SmemberVO>();
				
				while(rsRs.next()){
					smvo = new SmemberVO();
					smvo.setSno(rsRs.getString("sno"));
					aList.add(smvo);
				}// end of while
			}// end of if
			System.out.println("데이터확인 >>> aList 길이  : " + aList.size());
		
			// db연결 끊기
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db연결 종료");
			
		} catch (Exception e) {
			System.out.println("[log] db연결 에러 >>> " + e.getMessage());
		} finally {
			// db연결 끊기
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db연결 종료");
		}// end of try-catch-finally
		
		System.out.println("데이터확인2 >>> aList 길이  : " + aList.size());
		return aList;
	} // end of login

	// 회원가입(insert)
	@Override
	public Boolean insertSmember(SmemberVO _smvo) {
		System.out.println("[log] 다오임플 insertSmember 함수 호출!"
									+ "\n데이터확인 >>> _smvo.getSsid():" + _smvo.getSsid());
		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean insertBool = false;
		
		//db연결
		try {
			con = SjhConnProperty.getConnection();
			pstmt = con.prepareStatement(SjhSqlQueryMap.getInsertSmemberQuery());
			
			// 채번
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
			
			// int to boolean 형변환
			if(updateInt==1){
				insertBool = true;
			}// end of if
			
			//db연결종료
			SjhConnProperty.conClose(con, pstmt);
		} catch (Exception e) {
			System.out.println("회원가입 db연결 에러 >>> " + e.getMessage());
		} finally {
			//db연결종료
			SjhConnProperty.conClose(con, pstmt);
		}// end of try-catch-finally
		
		System.out.println("insertBool:" + insertBool);
		return insertBool;
	}// end of insertSmember()
	
	// 전체회원(selectAll)
	@Override
	public ArrayList<SmemberVO> selectAllSmember(){
		System.out.println("[log] SmemberDAOImpl 전체회원보기 함수 호출!");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<SmemberVO> array = null;
		SmemberVO svo = null;
		
		try{
			//db연결
			con = SjhConnProperty.getConnection();
			System.out.println("[log] 전체회원조회 db연결 성공!");
			pstmt = con.prepareStatement(SjhSqlQueryMap.getSelectAllSmemberQuery());
			rsRs = pstmt.executeQuery();
			
			// null체크
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
				System.out.println("rsRs가 null");
			}// end of if
			
			System.out.println("데이터확인 >>> array 사이즈:" + array.size());
			//db연결 종료
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db연결종료");
		}catch(Exception e){
			System.out.println("[log] 전체회원조회 db연결 에러 >>> " + e.getMessage());
		}finally{
			//db연결 종료
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db연결종료");
		}// end of try-catch-finally
		
		System.out.println("[log] SmemberDAOImpl 전체회원보기 함수 종료!");
		return array;
	}// end of selectAllSmember()

	// 회원검색(search)
	@Override
	// 회원검색 search
	public ArrayList<SmemberVO> searchSmember(SmemberVO _smvo){
		System.out.println("[log]다오임플 searchSmember함수 호출 성공 >>> 데이터확인 sno:" + _smvo.getSno());
		
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
			
			// null체크
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
				System.out.println("searchSmember의 rsRs가 널");
			}// end of if-else
			
			// db연결종료
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]회원검색 db연결종료");
		}catch(Exception e){
			System.out.println("[log]회원검색 db연결 에러 >>> " + e.getMessage());
		}finally{
			// db연결종료
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log]회원검색 db연결종료");
		}// end of try-catch-finally
		
		System.out.println("[log]다오임플 searchSmember함수 종료");
		return searchArray;
	}// end of 회원검색
	
	// 회원정보수정(update)
	@Override
	public Boolean updateSmember(SmemberVO _smvo){
		System.out.println("[log]다오임플 updateSmember 함수 시작 >>>> 데이터확인 _smvo.getSno():" + _smvo.getSno());

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
			System.out.println("다오임플 정보수정 updateInt:" + updateInt);
			
			//db연결종료
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log]정보수정 db연결종료");
		}catch(Exception e){
			System.out.println("[log]회원정보수정 db연결 에러 >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log]정보수정 db연결종료");
		}// end of try-catch-finally
		
			if(updateInt==1){
				updateBool = true;
			}// end of if
		System.out.println("[log]다오임플 updateSmember 함수 종료 >>> updateBool:" + updateBool);	
		return updateBool;
	}// end of 회원정보수정

	// 회원탈퇴(delete)
	@Override
	// 회원탈퇴 delete
	public Boolean deleteSmember(SmemberVO _smvo){
		System.out.println("[log]다오임플 deleteSmember 함수 시작 >>>> 데이터확인 _smvo.getSno():" + _smvo.getSno());

		Connection con = null;
		PreparedStatement pstmt = null;
		Boolean deleteBool = false;
		int deleteInt = 0;
		
		try{
			con = SjhConnProperty.getConnection();
			pstmt = con.prepareStatement(SjhSqlQueryMap.getDeleteSmemberQuery());
			pstmt.setString(1, _smvo.getSno());
			
			deleteInt = pstmt.executeUpdate();
			System.out.println("다오임플 회원탈퇴 deleteInt:" + deleteInt);
			
			//db연결종료
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log]회원탈퇴 db연결종료");
		}catch(Exception e){
			System.out.println("[log]회원탈퇴 db연결 에러 >>> " + e.getMessage());
		}finally{
			SjhConnProperty.conClose(con, pstmt);
			System.out.println("[log]회원탈퇴 db연결종료");
		}// end of try-catch-finally
		
			if(deleteInt==1){
				deleteBool = true;
			}// end of if
		System.out.println("[log]다오임플 deleteSmember 함수 종료 >>> deleteBool:" + deleteBool);	
		return deleteBool;
	}// end of 회원탈퇴
}// end of SmemberDAOImpl
