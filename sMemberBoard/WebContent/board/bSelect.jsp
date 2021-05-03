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
	// �۹�ȣ ������
	String bno = request.getParameter("bno");
	System.out.println("bSelect.jsp >>> �������� bno:" + bno);
	
	if(bno==null){
		Object bnoObj = request.getParameter("bno");
		System.out.println("bnoObj:" + bnoObj);
		bno = (String)bnoObj;
		System.out.println("bSelect.jsp >>> ������Ʈ�� ������ bno:" + bno);
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
		<title>�Խñ� ��ȸ</title>
		<style type="text/css">
			.tt{
				text-align: center;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
			function click_btn(val){
				if(val=="U"){
					console.log('������ư Ŭ��');
					document.selectForm.action="/board/bUpdateForm.jsp";
					document.selectForm.submit();
				}
				if(val=="D"){
					console.log('������ư Ŭ��');
					document.selectForm.action="/board/bDeleteForm.jsp";
					document.selectForm.submit();
				}
				if(val=="SALL"){
					console.log('�۸�Ϲ�ư Ŭ��');
					document.selectForm.action="/board/bSelectAll.jsp";
					document.selectForm.submit();
				}
			}// end of click_btn
		</script>
	</head>
	<body>
		<form name="selectForm" method="POST">
			<table border="1" align="center">
		<%
			if(aListSelect.size()==0){
				System.out.println("������ ��ȸ ���� >>> aListSelect.size():" + aListSelect.size());
		%>		
			<tr>
				<td align="center"><h2>�Խñ� ��ȸ</h2></td>
			</tr>
			<tr>
				<td align="center" width="400" height="100">������ ����</td>
			</tr>
		<%		
			}else{
				for(int i=0;i<aListSelect.size();i++){
					sbvo = new SboardVO();
					sbvo = aListSelect.get(i);
			%>
				<tr>
					<td colspan="2" align="center"><h2>�Խñ� ��ȸ</h2></td>
				</tr>
				<tr>
					<td class="tt">�۹�ȣ</td>
					<td><%=sbvo.getBno() %>
						<input type="hidden" name="bno" value="<%=sbvo.getBno()%>">
					</td>
				</tr>
				<tr>
					<td class="tt" width="60">����</td>
					<td><%=sbvo.getBsubject() %></td>
				</tr>
				<tr>
					<td class="tt">�̸�</td>
					<td><%=sbvo.getBname() %></td>
				</tr>
				<tr>
					<td class="tt">�ۼ���</td>
					<td><%=sbvo.getBinsertdate() %></td>
				</tr>
				<tr>
					<td class="tt">������</td>
					<td><%=sbvo.getBupdatedate() %></td>
				</tr>
				<tr>
					<td class="tt">����</td>
					<td width="400" height="200"><%=sbvo.getBmemo() %></td>
				</tr>
			<%		
				}// end of for
			}// end of if-else
		%>	
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="����" onclick="click_btn('U')">	
						<input type="button" value="����" onclick="click_btn('D')">	
						<input type="button" value="�۸��" onclick="click_btn('SALL')">	
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>