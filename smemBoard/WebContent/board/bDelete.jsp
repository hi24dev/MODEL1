<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sboard.dao.SboardDAO " %>
<%@ page import="pattern.practice2.sboard.dao.SboardDAOImpl " %>
<%@ page import="pattern.practice2.sboard.vo.SboardVO " %>
<%@ page import="java.util.ArrayList " %>    
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	String bno = request.getParameter("bno");
	String bpw = request.getParameter("bpw");
	System.out.println("bUpdate.jsp >>> \nbno:" + bno
			 						 + "\nbpw:" + bpw);
	// dao
	SboardDAO sbdao = new SboardDAOImpl();
	SboardVO sbvo = null;
	sbvo = new SboardVO();
	sbvo.setBno(bno);
	sbvo.setBpw(bpw);

	Boolean deleteBool = sbdao.deleteSboard(sbvo);
	System.out.println("deleteBool:" + deleteBool);
%>    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>bDelete.jsp</title>
	</head>
	<body>
	<%
		if(deleteBool){
	%>
		<script>
			alert('글이 성공적으로 삭제되었습니다.');
			location.href="/board/bSelectAll.jsp";
		</script>	
	<%
		}else{
	%>
		<script>
			alert('삭제에 실패했습니다.\n비밀번호를 다시 확인해주세요.');
			location.href="/board/bDeleteForm.jsp?bno="+"<%=bno%>";
		</script>	
	<%			
		}// end of if-else
	%>		
	</body>
</html>