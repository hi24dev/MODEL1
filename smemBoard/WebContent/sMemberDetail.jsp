<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %> 
<%@ page import="java.util.ArrayList" %>   
<%

	String sno = request.getParameter("searchKeyword");
	System.out.println("sMemberDetail.jsp >>> ������Ȯ�� sno:" + sno);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ������</title>
		<script type="text/javascript">
			console.log('ȸ������ ������ ��ũ��Ʈ ����!');
			
		</script>
	</head>
	<body>
		ȸ������
	<%
		//dao
		SmemberDAO smdao = new SmemberDAOImpl();
		SmemberVO smvo = null;
		smvo = new SmemberVO();
		smvo.setSno(sno);
		ArrayList<SmemberVO> arraySearch = smdao.searchSmember(smvo);
		System.out.println("sMemberDetail.jsp >>> ������Ȯ�� arraySearch.size():" + arraySearch.size());
		
	%>
		<table border="1">
			<tr>
				<td>ȸ����ȣ</td>
				<td></td>
			</tr>
			<tr>
				<td>ID</td>
				<td></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td></td>
			</tr>
			<tr>
				<td>�������</td>
				<td></td>
			</tr>
			<tr>
				<td>����</td>
				<td></td>
			</tr>
			<tr>
				<td>����ó</td>
				<td></td>
			</tr>
			<tr>
				<td>����</td>
				<td></td>
			</tr>
			<tr>
				<td>�����ȣ</td>
				<td></td>
			</tr>
			<tr>
				<td>�ּ�</td>
				<td></td>
			</tr>
			<tr>
				<td>������</td>
				<td></td>
			</tr>
			<tr>
				<td>����������</td>
				<td></td>
			</tr>
		</table>
		
		<input type="button" value="�����ϱ�">
		<input type="button" value="Ż���ϱ�">
		<input type="hidden" value="">
	</body>
</html>