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
	System.out.println("bUpdateForm.jsp >>> �������� bno:" + bno);
	
	if(bno==null){
		Object bnoObj = request.getParameter("bno");
		System.out.println("bnoObj:" + bnoObj);
		bno = (String)bnoObj;
		System.out.println("bUpdateForm.jsp >>> ������Ʈ�� ������ bno:" + bno);
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
		<title>�ۼ��� ������</title>
		<style type="text/css">
			.tt{
				text-align: center;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
		
			function click_btn(val){
				// �����ϱ� ��ư
				if(val=="U"){
					console.log('�����Ϸ� ��ư Ŭ��!');
					
					// ��ĭüũ
					if(!document.getElementById("subjectVal").value){
						alert("������ �Է����ּ���.");
						document.getElementById("subjectVal").focus();
						return false;
					}
					if(!document.getElementById("nameVal").value){
						alert("�̸��� �Է����ּ���.");
						document.getElementById("nameVal").focus();
						return false;
					}
					if(!document.getElementById("pwVal").value){
						alert("��й�ȣ�� �Է����ּ���.");
						document.getElementById("pwVal").focus();
						return false;
					}
					if(!document.getElementById("memoVal").value){
						alert("������ �Է����ּ���.");
						document.getElementById("memoVal").focus();
						return false;
					}
					
					console.log('��ĭüũ ���');
					document.updateForm.action="/board/bUpdate.jsp";
					document.updateForm.submit();
				}// end of U
				// �۸�� ��ư
				if(val=="SALL"){
					console.log('�۸�� ��ư Ŭ��');
					document.updateForm.action="/board/bSelectAll.jsp";
					document.updateForm.submit();
				}// end of SALL
			}// end of click_btn
		
		</script>
	</head>
	<body>
		<form name="updateForm" method="POST">
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
					<td colspan="2" align="center"><h2>�ۼ����ϱ�</h2></td>
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
					<td><input type="text" name="bsubject" id="subjectVal" value="<%=sbvo.getBsubject() %>" size="53"></td>
				</tr>
				<tr>
					<td class="tt">�̸�</td>
					<td><input type="text" name="bname" id="nameVal" value="<%=sbvo.getBname() %>" size="20"></td>
				</tr>
				<tr>
					<td class="tt">��й�ȣ</td>
					<td><input type="password" name="bpw" id="pwVal" value="<%=sbvo.getBpw() %>" size="20"></td>
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
						<textarea name="bmemo" id="memoVal" cols="50" rows="10"><%=sbvo.getBmemo() %></textarea>
					</td>
				</tr>
			<%		
				}// end of for
			}// end of if-else
		%>	
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="�����Ϸ�" onclick="click_btn('U')">
						<input type="reset" value="�ٽ�">						
						<input type="button" value="�۸��" onclick="click_btn('SALL')">	
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>