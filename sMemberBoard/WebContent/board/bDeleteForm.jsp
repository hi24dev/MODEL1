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
	System.out.println("bDeleteForm.jsp >>> �������� bno:" + bno);
	
	if(bno==null){
		Object bnoObj = request.getParameter("bno");
		bno = (String)bnoObj;
		System.out.println("bDeleteForm.jsp >>> ������Ʈ�� bno:" + bno);
	}
	
	// dao
	SboardDAO sbdao = new SboardDAOImpl();
	SboardVO sbvo = null;
	sbvo = new SboardVO();
	sbvo.setBno(bno);
	ArrayList<SboardVO> aListSelect = sbdao.selectSboard(sbvo);
	
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>bDeleteForm.jsp</title>
		<style type="text/css">
			.tt{
				text-align: center;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
			function click_btn(val){
				if(val=="D"){
					console.log('������ư Ŭ��!');
					// ��ĭüũ
					if(!document.getElementById('pwVal').value){
						alert('pw�� �Է����ּ���!');
						document.getElementById('pwVal').focus();
						return;
					}// end of if
					document.deleteForm.action="/board/bDelete.jsp";
					document.deleteForm.submit();
				}// end of D
				if(val=="SALL"){
					console.log('�۸�� ��ư Ŭ��!');
					document.deleteForm.action="/board/bSelectAll.jsp";
					document.deleteForm.submit();
				}// end of SALL
			}// end of click_btn
		</script>
	</head>
	<body>
		<form name="deleteForm" method="POST">
			<table border="1" align="center">
		<%
			if(aListSelect.size()==0){
				System.out.println("������ ��ȸ ���� >>> aListSelect.size():" + aListSelect.size());
			}else{
				for(int i=0;i<aListSelect.size();i++){
					sbvo = new SboardVO();
					sbvo = aListSelect.get(i);
			%>
				<tr>
					<td colspan="2" align="center"><h2>�ۻ����ϱ�</h2></td>
				</tr>
				<tr>
					<td class="tt">�۹�ȣ</td>
					<td>
						<input type="text" value="123" size="20" disabled>
						<input type="hidden" name="bno" value="<%=sbvo.getBno() %>">
					</td>
				</tr>
				<tr>
					<td class="tt">����</td>
					<td><input type="text" name="bsubject" id="subjectVal" value="<%=sbvo.getBsubject() %>" size="53" disabled></td>
				</tr>
				<tr>
					<td class="tt">�̸�</td>
					<td><input type="text" name="bname" id="nameVal" value="<%=sbvo.getBname() %>" size="20" disabled></td>
				</tr>
				<tr>
					<td class="tt">��й�ȣ</td>
					<td><input type="password" name="bpw" id="pwVal" size="20"></td>
				</tr>
				<tr>
					<td class="tt">�ۼ���</td>
					<td><input type="text" value="<%=sbvo.getBinsertdate() %>" disabled></td>
				</tr>
				<tr>
					<td class="tt">������</td>
					<td><input type="text" value="<%=sbvo.getBupdatedate() %>" disabled></td>
				</tr>
				<tr>
					<td class="tt">����</td>
					<td>
						<textarea name="bmemo" id="memoVal" cols="50" rows="10" disabled><%=sbvo.getBmemo() %></textarea>
					</td>
				</tr>
			<%		
				}// end of for
			}// end of if-else
		%>	
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="�����ϱ�" onclick="click_btn('D')">	
						<input type="button" value="�۸��" onclick="click_btn('SALL')">	
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>