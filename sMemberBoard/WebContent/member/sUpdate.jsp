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
	String spw = request.getParameter("spw");
	String sname = request.getParameter("sname");
	String sbirth = request.getParameter("sbirth");
	String sgender = request.getParameter("sgender");
	String shp = request.getParameter("shp");
	String smail = request.getParameter("smail");
	String spost = request.getParameter("spost");
	String saddr = request.getParameter("saddr");	
	System.out.println("sUpdate.jsp >>> ������Ȯ�� \nsnoVal:" + snoVal
		  +	"\nspw:" + spw + "\nsname:" + sname + "\nsbirth:" + sbirth + "\nsgender:" + sgender
		  + "\nshp:" + shp + "\nsmail:" + smail + "\nspost:" + spost + "\nsaddr:" + saddr);

	// vo���ε�
	SmemberVO svo = new SmemberVO();
	svo.setSno(snoVal);
	svo.setSpw(spw);
	svo.setSname(sname);
	svo.setSbirth(sbirth);
	svo.setSgender(sgender);
	svo.setShp(shp);
	svo.setSmail(smail);
	svo.setSpost(spost);
	svo.setSaddr(saddr);
	
	// dao
	SmemberDAO smdao = new SmemberDAOImpl();
	Boolean updateBool = smdao.updateSmember(svo);
	System.out.println("sUpdate.jsp >>> updateBool:" + updateBool);
	if(updateBool){
		// ���� ����
	%>
		<script>
		// console.log('�����Ϸ� updateBool:' + updateBool);
		alert('ȸ�������� ����Ǿ����ϴ�.');	
		location.href="/member/sSelect.jsp?sno="+"<%=snoVal%>";
		</script>
	<%
	}else{
		// ����
	%>	
		<script>
		// console.log('�������� updateBool:' + updateBool);
		alert('ȸ������ ������ �����߽��ϴ�.\n�ٽ� �õ��ϰų� �����ڿ��� �������ֽñ� �ٶ��ϴ�.');	
		location.href="/member/sUpdateForm.jsp";
		</script>
	<%	
	}// end of if-else
	
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>sUpdate.jsp</title>
	</head>
	<body>
	
	</body>
</html>