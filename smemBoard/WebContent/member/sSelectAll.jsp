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
			
			// ��ưŬ��
			function click_btn(actionVal){
				if(actionVal=="I"){
					console.log('�Է¹�ư Ŭ��! >>> actionVal:' + actionVal);
					document.searchForm.action="/member/sInsertForm.html";
					document.searchForm.submit();
				}
				if(actionVal=="S"){
					console.log('��ȸ��ư Ŭ��! >>> actionVal:' + actionVal
											+ "\n>>>ȸ����ȣ: "+ document.getElementById('searchKeyword').value);	
					// ��ĭüũ
					if(!document.getElementById('searchKeyword').value){
						console.log("������Ȯ�� >>> searchKeyword ��ĭ");
						alert("��ȸ/����/���� �� ȸ����ȣ�� �Է����ּ���.");
						document.getElementById('searchKeyword').focus();
						return;
					}// end of if
					
					// form������ ����
					document.searchForm.action="/member/sSelect.jsp";
					document.searchForm.submit();
				}
				if(actionVal=="U"){
					// ��ĭüũ
					if(!document.getElementById('searchKeyword').value){
						console.log("������Ȯ�� >>> searchKeyword ��ĭ");
						alert("��ȸ/����/���� �� ȸ����ȣ�� �Է����ּ���.");
						document.getElementById('searchKeyword').focus();
						return;
					}// end of if

					console.log('������ư Ŭ��! >>> actionVal:' + actionVal
											+ "\n>>>ȸ����ȣ: "+ document.getElementById('searchKeyword').value);
					document.searchForm.action="/member/sUpdateForm.jsp";
					document.searchForm.submit();
				}
				if(actionVal=="D"){
					// ��ĭüũ
					if(!document.getElementById('searchKeyword').value){
						console.log("������Ȯ�� >>> searchKeyword ��ĭ");
						alert("��ȸ/����/���� �� ȸ����ȣ�� �Է����ּ���.");
						document.getElementById('searchKeyword').focus();
						return;
					}// end of if

					console.log('Ż���ư Ŭ��! >>> actionVal:' + actionVal
											+ "\n>>>ȸ����ȣ: "+ document.getElementById('searchKeyword').value);
					document.searchForm.action="/member/sDelete.jsp";
					document.searchForm.submit();
				}
			}// end of click_btn()
			
			function blanc_chk(){
				// ��ĭüũ
				if(!document.getElementById('searchKeyword').value){
					console.log("������Ȯ�� >>> searchKeyword ��ĭ");
					alert("��ȸ/����/���� �� ȸ����ȣ�� �Է����ּ���.");
					document.getElementById('searchKeyword').focus();
					return;
				}// end of if
			}// end of blanc_chk()
			
		</script>
	</head>
	<body>
		<table border="1" align="center">
			<tr>
				<td colspan="10" align="center">ȸ����ü��ȸ</td>
			</tr>
			<tr>
				<td><input type="checkbox" disabled></td>
				<td align="center">ȸ����ȣ</td>
				<td align="center">ID</td>
				<td align="center">�̸�</td>
				<td align="center">�������</td>
				<td align="center">����</td>
				<td align="center">����ó</td>
				<td align="center">����</td>
				<td align="center">�����ȣ</td>
				<td align="center">�ּ�</td>
			</tr>
			<%
				// select all dao vo
				SmemberDAO smdao = new SmemberDAOImpl();
				ArrayList<SmemberVO> smemberArray = smdao.selectAllSmember();
				System.out.println("sMemberList.jsp >>> ������Ȯ�� smemberArray���� : " + smemberArray.size());
				
				// nullüũ
				if(smemberArray.size()==0){
				%>		
					<tr>
						<td><input type="checkbox"></td>
						<td colspan="9">no data</td>
					</tr>
				<%		
				}else{
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
						<tr>
							<td colspan="10">
								<form name="searchForm"
								  	  method="POST">		
									<input type="text" id="searchKeyword" name="snoVal" placeholder="ȸ����ȣ �Է¶�"  width="250">
									<input type="button" value="�Է�" onclick="click_btn('I')">
									<input type="button" value="��ȸ" onclick="click_btn('S')">
									<input type="button" value="����" onclick="click_btn('U')">
									<input type="button" value="����" onclick="click_btn('D')">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value="�ٽ�">
								</form>
							</td>
						</tr>
					<%
				}// end of if-else
			%>
		</table>


	</body>
</html>