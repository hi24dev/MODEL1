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
	System.out.println("sDelete.jsp >>> ������Ȯ�� \nsnoVal:" + snoVal);
	
	// vo���ε�
	SmemberVO svo = new SmemberVO();
	svo.setSno(snoVal);
	
	// dao
	SmemberDAO smdao = new SmemberDAOImpl();
	Boolean deleteBool = smdao.deleteSmember(svo);
	System.out.println("sDelete.jsp >>> deleteBool:" + deleteBool);
	
	if(deleteBool){
	%>
		<script>
			alert('ȸ��Ż�� �Ϸ�Ǿ����ϴ�.');
			location.href="/sSelectAll.jsp";
		</script>
	<%
	}else{
	%>
		<script>
			alert('ȸ��Ż�� �����߽��ϴ�.');
			location.href="/sSelectAll.jsp";
		</script>		
	<%
	}// end of if-else
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ��Ż��</title>
	</head>
	<body>
	
	</body>
</html>