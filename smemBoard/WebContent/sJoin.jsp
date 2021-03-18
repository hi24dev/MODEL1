<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %>    
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%    
	// 데이터 가져오기
	String ssid = request.getParameter("ssid");
	String spw = request.getParameter("spw");
	String sname = request.getParameter("sname");
	String sbirth = request.getParameter("sbirth");
	String sgender = request.getParameter("sgender");
	String shp = request.getParameter("shp");
	String smail = request.getParameter("smail");
	String spost = request.getParameter("spost");
	String saddr = request.getParameter("saddr");

	System.out.println("회원가입 데이터확인 \nssid:" + ssid +
									"\nspw:" + spw + "\nsname:" + sname + "\nsbirth:" + sbirth + "\nsgender:" + sgender
								  + "\nshp:" + shp + "\nsmail:" + smail + "\nspost:" + spost + "\nsaddr:" + saddr);
	
	// vo바인딩
	SmemberVO svo = new SmemberVO();
	svo.setSsid(ssid);
	svo.setSpw(spw);
	svo.setSname(sname);
	svo.setSbirth(sbirth);
	svo.setSgender(sgender);
	svo.setShp(shp);
	svo.setSmail(smail);
	svo.setSpost(spost);
	svo.setSaddr(saddr);

	// dao 연결	
	SmemberDAO smdao = new SmemberDAOImpl();
	Boolean insertBool = smdao.insertSmember(svo);
	System.out.println("sJoin.jsp >>> insertBool:" + insertBool);
	
	if(insertBool){
%>	
		<script>
		console.log('회원가입 성공');
		alert("회원가입이 완료되었습니다.\n로그인 해주세요!");
		location.href="/sLoginForm.html";
		</script>
<%	
	}else{
%>		
		<script>
		console.log('회원가입 실패');
		alert("회원가입에 실패했습니다.\n다시 시도해주세요!");
		location.href="/sJoinForm.html";
		</script>
<%		
	}// end of if-else
%>			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원가입 jsp</title>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
		
	</body>
</html>