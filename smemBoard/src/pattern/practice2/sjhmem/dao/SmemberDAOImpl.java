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
			System.out.println("체크!!!!!!!!");
			pstmt.setString(1, _smvo.getSsid());
			pstmt.setString(2, _smvo.getSpw());
			rsRs = pstmt.executeQuery();
			
			// 리턴결과 널체크
			if(rsRs!=null){
				System.out.println("rsRs 널체크 if문 진입");
				aList = new ArrayList<SmemberVO>();
				
				while(rsRs.next()){
					smvo = new SmemberVO();
					smvo.setSsid(rsRs.getString("sno"));
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
	
	
	
}// end of SmemberDAOImpl
