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
	String bsubject = request.getParameter("bsubject");
	String bname = request.getParameter("bname");
	String bpw = request.getParameter("bpw");
	String bmemo = request.getParameter("bmemo");
	System.out.println("bUpdate.jsp >>> \nbno:" + bno
									 + "\nbsubject:" + bsubject
									 + "\nbname:" + bname
									 + "\nbpw:" + bpw
									 + "\nbmemo:" + bmemo);
	// dao
	SboardDAO sbdao = new SboardDAOImpl();
	SboardVO sbvo = null;
	sbvo = new SboardVO();
	sbvo.setBno(bno);
	sbvo.setBsubject(bsubject);
	sbvo.setBname(bname);
	sbvo.setBpw(bpw);
	sbvo.setBmemo(bmemo);
	
	Boolean updateBool = sbdao.updateSboard(sbvo);
	System.out.println("updateBool:" + updateBool);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>bUpdate.jsp</title>
	</head>
	<body>
	<%
		if(updateBool){
	%>
		<script>
			alert('글이 성공적으로 수정되었습니다.');
			location.href="/board/bSelect.jsp?bno="+"<%=bno%>";
		</script>	
	<%
		}else{
	%>
		<script>
			alert('글수정에 실패했습니다.');
			location.href="/board/bUpdateForm.jsp?bno="+"<%=bno%>";
		</script>	
	<%			
		}// end of if-else
	%>
	</body>
</html>