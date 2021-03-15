package pattern.practice2.sjhmem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	
	
}// end of SmemberDAOImpl
