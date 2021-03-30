<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>글쓰기 페이지</title>
		<script type="text/javascript">
			function click_btn(val){
				// 작성완료
				if(val=="I"){
					console.log('작성완료 버튼 클릭!');
					
					// 빈칸체크
					if(!document.getElementById("subjectVal").value){
						alert("제목을 입력해주세요.");
						document.getElementById("subjectVal").focus();
						return false;
					}
					if(!document.getElementById("nameVal").value){
						alert("이름을 입력해주세요.");
						document.getElementById("nameVal").focus();
						return false;
					}
					if(!document.getElementById("pwVal").value){
						alert("비밀번호를 입력해주세요.");
						document.getElementById("pwVal").focus();
						return false;
					}
					if(!document.getElementById("memoVal").value){
						alert("내용을 입력해주세요.");
						document.getElementById("memoVal").focus();
						return false;
					}
					
					console.log('빈칸체크 통과');
					document.insertForm.action="/board/bInsert.jsp";
					document.insertForm.submit();
				}// end of I
				
				// 글목록
				if(val=="SALL"){
					console.log('글목록 버튼 클릭!');
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
					<td colspan="2" align="center">글쓰기</td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td><input type="text" name="bsubject" id="subjectVal" size="53"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input type="text" name="bname" id="nameVal" size="53"></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="bpw" id="pwVal" size="20"></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td>
						<textarea name="bmemo" id="memoVal" cols="50" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="작성완료" onclick="click_btn('I')">
						<input type="reset" value="다시">
						<input type="button" value="글목록" onclick="click_btn('SALL')">						
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>