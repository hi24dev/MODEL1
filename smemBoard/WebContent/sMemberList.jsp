<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %> 
<%@ page import="java.util.ArrayList" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ�����</title>
		<script type="text/javascript">
			console.log('[log]ȸ����������� ��ũ��Ʈ ����!');
			
			// �˻���ưŬ��
			function clickBtn(){
				console.log("�˻���ư Ŭ���̺�Ʈ �߻�!\n>>>�˻���: "+ document.getElementById('searchKeyword').value);

				// ��ĭüũ
				if(!document.getElementById('searchKeyword').value){
					console.log("������Ȯ�� >>> searchKeyword: null");
					alert("�˻��� ȸ����ȣ�� �Է����ּ���.");
					document.getElementById('searchKeyword').focus();
					return;
				}// end of if
				
				// form������ ����
				document.searchForm.action="/sMemberDetail.jsp";
				document.searchForm.submit();
			}// end of clickBtn()
			
		</script>
	</head>
	<body>
		ȸ�����
		<table border="1">
			<tr>
				<td><input type="checkbox" disabled></td>
				<td>ȸ����ȣ</td>
				<td>ID</td>
				<td>�̸�</td>
				<td>�������</td>
				<td>����</td>
				<td>����ó</td>
				<td>����</td>
				<td>�����ȣ</td>
				<td>�ּ�</td>
			</tr>
			<%
				// select all dao vo
				SmemberDAO smdao = new SmemberDAOImpl();
				ArrayList<SmemberVO> smemberArray = smdao.selectAllSmember();
				System.out.println("sMemberList.jsp >>> ������Ȯ�� smemberArray���� : " + smemberArray.size());
				
				SmemberVO svo = null;

				for(int i=0;i<smemberArray.size();i++){
					svo = new SmemberVO();
					svo = smemberArray.get(i);
				%>
					<tr>
						<td><input type="checkbox"></td>
						<td><%=svo.getSno() %></td>
						<td><%=svo.getSsid() %></td>
						<td><%=svo.getSname() %></td>
						<td><%=svo.getSbirth() %></td>
						<td><%=svo.getSgender() %></td>
						<td><%=svo.getShp() %></td>
						<td><%=svo.getSmail() %></td>
						<td><%=svo.getSpost() %></td>
						<td><%=svo.getSaddr() %></td>
					</tr>
				<%
				}// end of for
			%>
		</table>
		<form name="searchForm"
			  method="POST">		
			<input type="text" id="searchKeyword" name="searchKeyword" placeholder="ȸ����ȣ �Է�">
			<input type="button" value="ȸ���󼼰˻�" onclick="clickBtn()">
		</form>
	</body>
</html>