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
	// ������ �������� - getParameter("name")
	String ssid = request.getParameter("ssid");
	String spw = request.getParameter("spw");
	System.out.println("�α��� ������Ȯ��:" + ssid + "," + spw);
	
	// DAO, DAOImple ��üȭ
	SmemberDAO smdao = new SmemberDAOImpl();
	// vo ��üȭ �� ���ε�
	SmemberVO svo = null;
	svo = new SmemberVO();
	svo.setSsid(ssid);
	svo.setSpw(spw);
	
	ArrayList<SmemberVO> loginSmemLogin = smdao.loginSmember(svo);
	System.out.println("test:" + loginSmemLogin.size());
	
	// SmemberVO svo_ = loginSmemLogin.get(0);
	
	if(loginSmemLogin.size()==1){
		// �α��� ����
		session.setAttribute("sno",loginSmemLogin.get(0).getSno());	
%>		
	<script>
		// �α��μ��� �˾� (���������� �̵�)
		console.log("�α��� ���� >>> sno:" + "<%=loginSmemLogin.get(0).getSno()%>");
		alert("�α��� ����");
		location.href="/sSelectAll.jsp";
	</script>
<%		
	}else{
%>		
	<script>
		// �α��ν��� �˾� (�α��������� �̵�)
		alert("��ġ�ϴ� ȸ�������� �����ϴ�.\n���̵� �Ǵ� ��й�ȣ�� �ٽ� Ȯ�����ּ���.");
		location.href="/sLoginForm.html";
	</script>
	<%	
	
	}// end of if-else
		
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�α��� jsp</title>
	</head>
	<body>
		
	</body>
</html>