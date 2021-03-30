<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sboard.dao.SboardDAO" %>
<%@ page import="pattern.practice2.sboard.dao.SboardDAOImpl" %>
<%@ page import="pattern.practice2.sboard.vo.SboardVO" %>
<%@ page import="java.util.ArrayList " %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�Խ���</title>
		<style type="text/css">
			.tt{
				text-align: center;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
			// üũ�ڽ� �ߺ� ����
			function nMultipleCheck(val){
				var checkObj = document.getElementsByName("bno");
				for(var i=0; i<checkObj.length; i++){
					if(checkObj[i]!=val){
						checkObj[i].checked = false;
					}// end of if
				}// end of for
			}// end of �ߺ�����
		
			// ��ưŬ���̺�Ʈ
			function click_btn(val){
				//�۾���
				if(val=="I"){
					console.log('�۾����ư Ŭ��!');
					document.isudForm.action = "/board/bInsertForm.jsp";
					document.isudForm.submit();
				}
				//����ȸ
				if(val=="S"){
					console.log('����ȸ��ư Ŭ��!');
					var bno = "";
					
					for(var i=0;i<document.getElementsByName("bno").length;i++){
						if(document.getElementsByName("bno")[i].checked){							
							bno = document.getElementsByName("bno")[i].value;
							console.log("üũ�ڽ� bno:" + bno);
						}// end of if
					}// end of for
					
					// üũ�ڽ� ��üũ Ȯ��
					if(bno==""){
						alert("��ȸ�� ���� �������ּ���!");
						return false;
					}// end of if
					
					document.isudForm.action = "/board/bSelect.jsp";
					document.isudForm.submit();
				}// end of if
				//�ۼ���
				if(val=="U"){
					console.log('�ۼ�����ư Ŭ��!');
					var bno = "";
					
					for(var i=0;i<document.getElementsByName("bno").length;i++){
						if(document.getElementsByName("bno")[i].checked){							
							bno = document.getElementsByName("bno")[i].value;
							console.log("üũ�ڽ� bno:" + bno);
						}// end of if
					}// end of for
					
					// üũ�ڽ� ��üũ Ȯ��
					if(bno==""){
						alert("������ ���� �������ּ���!");
						return false;
					}// end of if
					
					document.isudForm.action = "/board/bUpdateForm.jsp";
					document.isudForm.submit();
				}
				//�ۻ���
				if(val=="D"){
					console.log('�ۻ�����ư Ŭ��!');
					var bno = "";
					
					for(var i=0;i<document.getElementsByName("bno").length;i++){
						if(document.getElementsByName("bno")[i].checked){							
							bno = document.getElementsByName("bno")[i].value;
							console.log("üũ�ڽ� bno:" + bno);
						}// end of if
					}// end of for
					
					// üũ�ڽ� ��üũ Ȯ��
					if(bno==""){
						alert("������ ���� �������ּ���!");
						return false;
					}// end of if
					
					document.isudForm.action = "/board/bDeleteForm.jsp";
					document.isudForm.submit();
				}
			}// end of click_btn
		</script>
	</head>
	<body>
		<form name="isudForm" method="POST">
			<center>
				<table border="1">
					<thead>
						<tr>
							<td colspan="7" align="center"><h2>�Խ���</h2></td>
						</tr>
						<tr>
							<td colspan="7" align="right">
								<input type="button" value="�۾���" onclick="click_btn('I')">
								<input type="button" value="����ȸ" onclick="click_btn('S')">
								<input type="button" value="�ۼ���" onclick="click_btn('U')">
								<input type="button" value="�ۻ���" onclick="click_btn('D')">
							</td>
						</tr>
						<tr>
							<td class="tt">����</td>
							<td class="tt">�۹�ȣ</td>
							<td class="tt">����</td>
							<td class="tt">�̸�</td>
							<td class="tt">����</td>
							<td class="tt">�ۼ���</td>
							<td class="tt">������</td>
						</tr>
					</thead>
					<tbody>
					<%
						// dao
						SboardDAO sbdao = new SboardDAOImpl();
						ArrayList<SboardVO> aListSelectAll = sbdao.selectAllSboard();
						
						// ��üũ
						if(aListSelectAll==null){
							// �۵����;���
						%>
							<tr>
								<td align="center"><input type="checkbox"></td>
								<td colspan="6" align="center">������ ����</td>
							</tr>
						<%
						}else{
							SboardVO sbvo = null;
							for(int i=0;i<aListSelectAll.size();i++){
								sbvo = new SboardVO();
								sbvo = aListSelectAll.get(i);
						%>				
							<tr>
								<td align="center"><input type="checkbox" name="bno" value="<%=sbvo.getBno()%>" onclick="nMultipleCheck(this)"></td>
								<td><%=sbvo.getBno() %></td>
								<td><%=sbvo.getBsubject() %></td>
								<td><%=sbvo.getBname() %></td>
								<td><%=sbvo.getBmemo() %></td>
								<td><%=sbvo.getBinsertdate() %></td>
								<td><%=sbvo.getBupdatedate()%></td>
							</tr>
						<%	
							}// end of for
							
						}// end of if
					%>	
						<tr>
							<td colspan="7" align="right">
								<input type="button" value="�۾���" onclick="click_btn('I')">
								<input type="button" value="����ȸ" onclick="click_btn('S')">
								<input type="button" value="�ۼ���" onclick="click_btn('U')">
								<input type="button" value="�ۻ���" onclick="click_btn('D')">
							</td>
						</tr>					
					</tbody>
				</table>
			</center>
		</form>
	</body>
</html>