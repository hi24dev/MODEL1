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
	String snoVal = request.getParameter("snoVal");
	System.out.println("sMemberUpdate.jsp >>> ������Ȯ�� snoVal:" + snoVal);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ����������</title>
		<script type="text/javascript">
			console.log('ȸ���������������� ��Ʈ��Ʈ ����!');
			
			function click_btn(val){
				console.log("��ưŬ�� �Լ� ����!");
				
				if(val=="update"){
					console.log('�����ϱ� ��ư Ŭ��! ��ĭüũ ���� >>> ');
					
					// ��ĭüũ
					console.log('pw:' + document.getElementById('pwVal').value);
					if(!document.getElementById('pwVal').value){
						alert('pw�� �Է����ּ���!');
						document.getElementById('pwVal').focus();
						return;
					}// end of if
					console.log('pw:' + document.getElementById('pwVal1').value);
					if(!document.getElementById('pwVal1').value){
						alert('pw��Ȯ�ζ��� �Է����ּ���!');
						document.getElementById('pwVal1').focus();
						return;
					}// end of if
					if(document.getElementById('pwVal').value!=document.getElementById('pwVal1').value){
						alert('pw�� ��Ȯ��pw�� ��ġ���� �ʽ��ϴ�!');
						document.getElementById('pwVal1').focus();
						return;
					}// end of if
					console.log('�̸�:' + document.getElementById('nameVal').value);
					if(!document.getElementById('nameVal').value){
						alert('�̸��� �Է����ּ���!');
						document.getElementById('nameVal').focus();
						return;
					}// end of if
					console.log('�������:' + document.getElementById('birthVal').value);
					if(!document.getElementById('birthVal').value){
						alert('��������� �Է����ּ���!');
						document.getElementById('birthVal').focus();
						return;
					}// end of if
					for(var i=0;i<document.getElementsByName('sgender').length;i++){
						if(document.getElementsByName('sgender')[i].checked){
							console.log('����:' + document.getElementsByName('sgender')[i].value);
						}// end of if
					}// end of for
					console.log('����ó:' + document.getElementById('hpVal').value);
					if(!document.getElementById('hpVal').value){
						alert('����ó�� �Է����ּ���!');
						document.getElementById('hpVal').focus();
						return;
					}// end of if
					
					console.log('��ĭüũ ���');
					document.updateForm.action="/member/sUpdate.jsp";
					document.updateForm.submit();
				}// end of if
			}// end of click_btn
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
		<form name="updateForm"
			  method="post">
			<table border="1" align="center">
				<tr>
					<td colspan="2" align="center">ȸ����������</td>
				</tr>
				<tr>
					<td width="100" align="center">ȸ����ȣ</td>
					<td width="250"><input type="text" value="<%=smvo.getSno() %>" disabled></td>
				</tr>
				<tr>
					<td align="center">ID</td>
					<td><input type="text" value="<%=smvo.getSsid() %>" disabled></td>
				</tr>
				<tr>
					<td align="center">*PW</td>
					<td><input type="password" id="pwVal" name="spw"></td>
				</tr>
				<tr>
					<td align="center">*PW��Ȯ��</td>
					<td><input type="password" id="pwVal1"></td>
				</tr>
				<tr>
					<td align="center">*�̸�</td>
					<td><input type="text" id="nameVal" name="sname" value="<%=smvo.getSname() %>"></td>
				</tr>
				<tr>
					<td align="center">*�������</td>
					<td><input type="text" id="birthVal" name="sbirth" value="<%=smvo.getSbirth() %>"></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td>
					<%
						System.out.println("sgender:" + smvo.getSgender());
						if("M".equals(smvo.getSgender())){
					%>		
							<input type="radio" name="sgender" value="M" checked>���� 
							<input type="radio" name="sgender" value="F">����		
					<%					
						}
						if("F".equals(smvo.getSgender())){
					%>		
							<input type="radio" name="sgender" value="M">���� 
							<input type="radio" name="sgender" value="F" checked>����
					<%				
						}
						if(smvo.getSgender()==null){
					%>		
							<input type="radio" name="sgender" value="M">���� 
							<input type="radio" name="sgender" value="F">����
					<%				
						}
					%>	
					</td>
				</tr>
				<tr>
					<td align="center">*����ó</td>
					<td><input type="text" id="hpVal" name="shp" value="<%=smvo.getShp() %>"></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td><input type="text" name="smail" value="<%=smvo.getSmail() %>"></td>
				</tr>
				<tr>
					<td align="center">�����ȣ</td>
					<td><input type="text" name="spost" value="<%=smvo.getSpost() %>"></td>
				</tr>
				<tr>
					<td align="center">�ּ�</td>
					<td><input type="text" name="saddr" value="<%=smvo.getSaddr() %>"></td>
				</tr>
				<tr>
					<td align="center">������</td>
					<td><input type="text" value="<%=smvo.getSinsertdate() %>" disabled></td>
				</tr>
				<tr>
					<td align="center">����������</td>
					<td><input type="text" value="<%=smvo.getSupdatedate() %>" disabled></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="�����Ϸ�" onclick="click_btn('update')">
						&nbsp;
						<input type="reset" value="�ٽ�">
					</td>
				</tr>
			</table>
			<input type="hidden" name="snoVal" value="<%=smvo.getSno()%>">
		</form>
	</body>
</html>