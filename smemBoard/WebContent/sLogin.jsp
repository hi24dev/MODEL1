<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// 데이터 가져오기 - getParameter("name")
	String ssid = request.getParameter("ssid");
	String spw = request.getParameter("spw");
	System.out.println("로그인 데이터확인:" + ssid + ", " + spw);
	
	// DAO, DAOImple 객체화
	
	
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