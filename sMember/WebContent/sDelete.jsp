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
	String snoVal = request.getParameter("snoVal");
	System.out.println("sDelete.jsp >>> 데이터확인 \nsnoVal:" + snoVal);
	
	// vo바인딩
	SmemberVO svo = new SmemberVO();
	svo.setSno(snoVal);
	
	// dao
	SmemberDAO smdao = new SmemberDAOImpl();
	Boolean deleteBool = smdao.deleteSmember(svo);
	System.out.println("sDelete.jsp >>> deleteBool:" + deleteBool);
	
	if(deleteBool){
	%>
		<script>
			alert('회원탈퇴가 완료되었습니다.');
			location.href="/sSelectAll.jsp";
		</script>
	<%
	}else{
	%>
		<script>
			alert('회원탈퇴에 실패했습니다.');
			location.href="/sSelectAll.jsp";
		</script>		
	<%
	}// end of if-else
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원탈퇴</title>
	</head>
	<body>
	
	</body>
</html>