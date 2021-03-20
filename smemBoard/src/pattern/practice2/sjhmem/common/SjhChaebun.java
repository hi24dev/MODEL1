package pattern.practice2.sjhmem.common;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import pattern.practice2.sjhmem.sql.SjhSqlQueryMap;

public abstract class SjhChaebun {

	private static final String CHAEBUN_M = "S";
	
	
	public static String chaebunMethod(){
		System.out.println("[log] SjhChaebun.chaebunMethod() 함수 호출!");
		
		// 회원채번 S 20201112 0000
		String num = "";
		String date = "";
		String chaebunVal = "";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		
		try {
			//db연결
			con = SjhConnProperty.getConnection();
			System.out.println("[log] db연결!");	
			
			//분기

				pstmt = con.prepareStatement(SjhSqlQueryMap.SMEMBER_CHAEBUN);				
				rsRs = pstmt.executeQuery();
				
				// rsRs 널체크
				if(rsRs!=null){
					while(rsRs.next()){					
						num = rsRs.getString("sno");
					}// end of while
				}// end of if			
//			System.out.println("snoVal:" + snoVal);
					
			//db종료
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db연결 종료");
		} catch (Exception e) {
			System.out.println("[log] db연결 에러 >>> " + e.getMessage());
		} finally {
			//db종료
			SjhConnProperty.conClose(con, pstmt, rsRs);
			System.out.println("[log] db연결 종료");
		}// end of try catch finally
			
		// 0001
		for(int i=num.length();i<4;i++){
			num = "0" + num;
		}// end of for
		
//		System.out.println("snoVal : " + snoVal);
		
		// 날짜
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		date = sdf.format(d);
//		System.out.println("date:" + date);
		
			chaebunVal = CHAEBUN_M + date + num;			
		
		System.out.println("[log] SjhChaebun.chaebunMethod() 함수 끝!");
		return chaebunVal;
	}// end of chaebunMethod()

	
	public static void main(String[] args) {
//		System.out.println("test >>> sno:" + chaebunMethod());

	}// end of main

}// end of SjhChaebun class
