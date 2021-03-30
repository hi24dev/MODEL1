<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %> 
<%@ page import="java.util.ArrayList" %>   
<%

	String snoVal = request.getParameter("snoVal");
	System.out.println("sSelect.jsp >>> �� ������Ȯ�� snoVal:" + snoVal);
		
	if(snoVal==null){
		Object snoObj = request.getParameter("sno");
		System.out.println("snoObj:" + snoObj);
		snoVal = (String)snoObj;
		System.out.println("sSelect.jsp >>> ���� ������Ȯ�� snoVal:" + snoVal);
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ������</title>
		<style type="text/css">
			.tt{
				text-align: center;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
			console.log('ȸ������ ������ ��ũ��Ʈ ����!');
			
			// ��ưŬ�� �̺�Ʈ
			function click_btn(val){
				console.log('��ưŬ��! >>> ' + val);	
				
				// ����
				if(val=="U"){
					console.log("���� ������ �̵�!");
					document.updateForm.action="/member/sUpdateForm.jsp"
					document.updateForm.submit();
				}// end of if
				
				// Ż��
				if(val=="D"){
					console.log("���� ������ �̵�!");
					document.updateForm.action="/member/sDelete.jsp"
					document.updateForm.submit();
				}// end of if
				
				// ��ü��ȸ
				if(val=="SALL"){
					console.log("��ü��ȸ ������ �̵�!");
					document.updateForm.action="/member/sSelectAll.jsp"
					document.updateForm.submit();
				}// end of if
				
			}// end of click_btn()
			
		</script>
	</head>
	<body>
	<%
		//dao
		SmemberDAO smdao = new SmemberDAOImpl();
		SmemberVO _smvo = null;
		_smvo = new SmemberVO();
		_smvo.setSno(snoVal);
		ArrayList<SmemberVO> arraySearch = smdao.searchSmember(_smvo);
		System.out.println("sSelect.jsp >>> ������Ȯ�� arraySearch.size():" + arraySearch.size());

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
		<table border="1" align="center">
			<tr>
				<td colspan="2" align="center"><h2>ȸ����ȸ</h2></td>
			</tr>
			<tr>
				<td width="100" class="tt">ȸ����ȣ</td>
				<td width="250"><%=smvo.getSno() %></td>
			</tr>
			<tr>
				<td class="tt">ID</td>
				<td><%=smvo.getSsid() %></td>
			</tr>
			<tr>
				<td class="tt">�̸�</td>
				<td><%=smvo.getSname() %></td>
			</tr>
			<tr>
				<td class="tt">�������</td>
				<td><%=smvo.getSbirth() %></td>
			</tr>
			<tr>
				<td class="tt">����</td>
				<td><%=smvo.getSgender() %></td>
			</tr>
			<tr>
				<td class="tt">����ó</td>
				<td><%=smvo.getShp() %></td>
			</tr>
			<tr>
				<td class="tt">����</td>
				<td><%=smvo.getSmail() %></td>
			</tr>
			<tr>
				<td class="tt">�����ȣ</td>
				<td><%=smvo.getSpost() %></td>
			</tr>
			<tr>
				<td class="tt">�ּ�</td>
				<td><%=smvo.getSaddr() %></td>
			</tr>
			<tr>
				<td class="tt">������</td>
				<td><%=smvo.getSinsertdate() %></td>
			</tr>
			<tr>
				<td class="tt">����������</td>
				<td><%=smvo.getSupdatedate() %></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<form name="updateForm" method="post">
					<input type="button" value="����" onclick="click_btn('U')">
					<input type="button" value="Ż��" onclick="click_btn('D')">
					<input type="button" value="�۸��" onclick="click_btn('SALL')">
					<input type="hidden" name="snoVal" value="<%= smvo.getSno() %>">		
				</form>
				</td>
			</tr>
		</table>
		
	</body>
</html>