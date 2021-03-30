<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sboard.dao.SboardDAO " %>  
<%@ page import="pattern.practice2.sboard.dao.SboardDAOImpl " %> 
<%@ page import="pattern.practice2.sboard.vo.SboardVO " %>     
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	// 데이터 가져오기
	String bsubject = request.getParameter("bsubject");
	String bname = request.getParameter("bname");
	String bpw = request.getParameter("bpw");
	String bmemo = request.getParameter("bmemo");
	System.out.println("bInsert.jsp 데이터확인 >>> \nbsubject:" + bsubject
											+ "\nbname:" + bname
											+ "\nbpw:" + bpw
											+ "\nbmemo:" + bmemo);
	
	SboardVO sbvo = new SboardVO();
	sbvo.setBsubject(bsubject);
	sbvo.setBname(bname);
	sbvo.setBpw(bpw);
	sbvo.setBmemo(bmemo);
	
	// dao
	SboardDAO sbdao = new SboardDAOImpl();
	Boolean insertBool = sbdao.insertSboard(sbvo);
	
	if(insertBool){
		System.out.println("bInsert.jsp 글작성 성공! >>> insertBool:" + insertBool);
	%>
		<script>
			alert("글이 정상적으로 업로드 되었습니다.");
			location.href="/board/bSelectAll.jsp";
		</script>	
	<%
	}else{
		System.out.println("bInsert.jsp 글작성 실패! >>> insertBool:" + insertBool);
	%>
		<script>
			alert("글 업로드에 실패했습니다.");
			location.href="/board/bSelectAll.jsp";
		</script>	
	<%
	}// end of if-else

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>글쓰기 jsp</title>
	</head>
	<body>
	
	</body>
</html>