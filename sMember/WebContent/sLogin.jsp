<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>    
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("EUC-KR");
%>

<%
	// 데이터 가져오기 - getParameter("name")
	String ssid = request.getParameter("ssid");
	String spw = request.getParameter("spw");
	System.out.println("로그인 데이터확인:" + ssid + "," + spw);
	
	// DAO, DAOImple 객체화
	SmemberDAO smdao = new SmemberDAOImpl();
	// vo 객체화 후 바인딩
	SmemberVO svo = null;
	svo = new SmemberVO();
	svo.setSsid(ssid);
	svo.setSpw(spw);
	
	ArrayList<SmemberVO> loginSmemLogin = smdao.loginSmember(svo);
	System.out.println("test:" + loginSmemLogin.size());
	
	// SmemberVO svo_ = loginSmemLogin.get(0);
	
	if(loginSmemLogin.size()==1){
		// 로그인 세션
		session.setAttribute("sno",loginSmemLogin.get(0).getSno());	
%>		
	<script>
		// 로그인성공 팝업 (메인페이지 이동)
		console.log("로그인 성공 >>> sno:" + "<%=loginSmemLogin.get(0).getSno()%>");
		alert("로그인 성공");
		location.href="/sSelectAll.jsp";
	</script>
<%		
	}else{
%>		
	<script>
		// 로그인실패 팝업 (로그인페이지 이동)
		alert("일치하는 회원정보가 없습니다.\n아이디 또는 비밀번호를 다시 확인해주세요.");
		location.href="/sLoginForm.html";
	</script>
	<%	
	
	}// end of if-else
		
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>로그인 jsp</title>
	</head>
	<body>
		
	</body>
</html>