<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�۾��� ������</title>
		<script type="text/javascript">
			function click_btn(val){
				// �ۼ��Ϸ�
				if(val=="I"){
					console.log('�ۼ��Ϸ� ��ư Ŭ��!');
					
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
					document.insertForm.action="/board/bInsert.jsp";
					document.insertForm.submit();
				}// end of I
				
				// �۸��
				if(val=="SALL"){
					console.log('�۸�� ��ư Ŭ��!');
					document.insertForm.action="/board/bSelectAll.jsp";
					document.insertForm.submit();
				}// end of SALL

			}// end of function
		</script>
	</head>
	<body>
		<form name="insertForm" method="POST">
			<table border="1" align="center">
				<tr>
					<td colspan="2" align="center">�۾���</td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td><input type="text" name="bsubject" id="subjectVal" size="53"></td>
				</tr>
				<tr>
					<td align="center">�̸�</td>
					<td><input type="text" name="bname" id="nameVal" size="53"></td>
				</tr>
				<tr>
					<td align="center">��й�ȣ</td>
					<td><input type="password" name="bpw" id="pwVal" size="20"></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td>
						<textarea name="bmemo" id="memoVal" cols="50" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="�ۼ��Ϸ�" onclick="click_btn('I')">
						<input type="reset" value="�ٽ�">
						<input type="button" value="�۸��" onclick="click_btn('SALL')">						
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>