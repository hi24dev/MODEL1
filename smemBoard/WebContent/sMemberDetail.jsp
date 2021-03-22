<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %> 
<%@ page import="java.util.ArrayList" %>   
<%

	String snoVal = request.getParameter("searchKeyword");
	System.out.println("sMemberDetail.jsp >>> ������Ȯ�� snoVal:" + snoVal);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ������</title>
		<script type="text/javascript">
			console.log('ȸ������ ������ ��ũ��Ʈ ����!');
			
			// ��ưŬ�� �̺�Ʈ
			function click_btn(val){
				console.log('��ưŬ��! >>> ' + val);	
				
				// ����
				if(val=="update"){
					console.log("���� ������ �̵�!");
					document.updateForm.action="/sUpdateForm.jsp"
					document.updateForm.submit();
				}// end of if
				
				// Ż��
				if(val=="delete"){
					console.log("���� ������ �̵�!");
					document.updateForm.action="/sDelete.jsp"
					document.updateForm.submit();
				}// end of if
				
			}// end of click_btn()
			
		</script>
	</head>
	<body>
		<header style="display: table; /* ǥ������ */
					   width: 100%; /* �ʺ� */
					   height: 1.8; /* ���� */
					   border-top: 28px solid #2A293E; /* Evening Blue */
					   border-bottom: 28px solid #2A293E; /* Evening Blue */ 
					   background: white; /* ���� */
					   font-size: 1.2em;
					   color: #2A293E; /* ���ڻ� */
					   text-align: center; /* ������ ������ġ */
					   vertical-align: middle; /* ������ ������ġ */">
			<h1><a href="/sMain.html">EXTREME LANDSCAPES</a></h1>
		</header>
		<p>ȸ������</p>
	<%
		//dao
		SmemberDAO smdao = new SmemberDAOImpl();
		SmemberVO _smvo = null;
		_smvo = new SmemberVO();
		_smvo.setSno(snoVal);
		ArrayList<SmemberVO> arraySearch = smdao.searchSmember(_smvo);
		System.out.println("sMemberDetail.jsp >>> ������Ȯ�� arraySearch.size():" + arraySearch.size());

		if(arraySearch.size()==0){
			// �˻�����
		%>	
			<script>
			alert('�˻������ �����ϴ�.');
			</script>
		<%	
		}else{
			SmemberVO svo = arraySearch.get(0);
		}// end of if-else
		
		SmemberVO smvo = null;

			smvo = new SmemberVO();
			smvo = arraySearch.get(0);		
	%>
		<table border="1">
			<tr>
				<td>ȸ����ȣ</td>
				<td><%=smvo.getSno() %></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><%=smvo.getSsid() %></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><%=smvo.getSname() %></td>
			</tr>
			<tr>
				<td>�������</td>
				<td><%=smvo.getSbirth() %></td>
			</tr>
			<tr>
				<td>����</td>
				<td><%=smvo.getSgender() %></td>
			</tr>
			<tr>
				<td>����ó</td>
				<td><%=smvo.getShp() %></td>
			</tr>
			<tr>
				<td>����</td>
				<td><%=smvo.getSmail() %></td>
			</tr>
			<tr>
				<td>�����ȣ</td>
				<td><%=smvo.getSpost() %></td>
			</tr>
			<tr>
				<td>�ּ�</td>
				<td><%=smvo.getSaddr() %></td>
			</tr>
			<tr>
				<td>������</td>
				<td><%=smvo.getSinsertdate() %></td>
			</tr>
			<tr>
				<td>����������</td>
				<td><%=smvo.getSupdatedate() %></td>
			</tr>
		</table>
		<form name="updateForm"
			  method="post">
			<input type="button" value="�����ϱ�" onclick="click_btn('update')">
			<input type="button" value="Ż���ϱ�" onclick="click_btn('delete')">
			<input type="hidden" name="snoVal" value="<%= smvo.getSno() %>">		
		</form>
	</body>
</html>