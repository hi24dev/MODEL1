<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %> 
<%@ page import="java.util.ArrayList" %>   
<%

	String snoVal = request.getParameter("searchKeyword");
	System.out.println("sMemberDetail.jsp >>> 데이터확인 snoVal:" + snoVal);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원정보</title>
		<script type="text/javascript">
			console.log('회원정보 페이지 스크립트 시작!');
			
			// 버튼클릭 이벤트
			function click_btn(val){
				console.log('버튼클릭! >>> ' + val);	
				
				// 수정
				if(val=="update"){
					console.log("수정 페이지 이동!");
					document.updateForm.action="/sUpdateForm.jsp"
					document.updateForm.submit();
				}// end of if
				
				// 탈퇴
				if(val=="delete"){
					console.log("삭제 페이지 이동!");
					document.updateForm.action="/sDelete.jsp"
					document.updateForm.submit();
				}// end of if
				
			}// end of click_btn()
			
		</script>
	</head>
	<body>
		<header style="display: table; /* 표시형태 */
					   width: 100%; /* 너비 */
					   height: 1.8; /* 높이 */
					   border-top: 28px solid #2A293E; /* Evening Blue */
					   border-bottom: 28px solid #2A293E; /* Evening Blue */ 
					   background: white; /* 배경색 */
					   font-size: 1.2em;
					   color: #2A293E; /* 글자색 */
					   text-align: center; /* 글자의 수평위치 */
					   vertical-align: middle; /* 글자의 수직위치 */">
			<h1><a href="/sMain.html">EXTREME LANDSCAPES</a></h1>
		</header>
		<p>회원정보</p>
	<%
		//dao
		SmemberDAO smdao = new SmemberDAOImpl();
		SmemberVO _smvo = null;
		_smvo = new SmemberVO();
		_smvo.setSno(snoVal);
		ArrayList<SmemberVO> arraySearch = smdao.searchSmember(_smvo);
		System.out.println("sMemberDetail.jsp >>> 데이터확인 arraySearch.size():" + arraySearch.size());

		if(arraySearch.size()==0){
			// 검색실패
		%>	
			<script>
			alert('검색결과가 없습니다.');
			</script>
		<%	
		}else{
			SmemberVO svo = arraySearch.get(0);
		}// end of if-else
		
		SmemberVO smvo = null;

			smvo = new SmemberVO();
			smvo = arraySearch.get(0);		
	%>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td><%=smvo.getSno() %></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><%=smvo.getSsid() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=smvo.getSname() %></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><%=smvo.getSbirth() %></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%=smvo.getSgender() %></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><%=smvo.getShp() %></td>
			</tr>
			<tr>
				<td>메일</td>
				<td><%=smvo.getSmail() %></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><%=smvo.getSpost() %></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=smvo.getSaddr() %></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><%=smvo.getSinsertdate() %></td>
			</tr>
			<tr>
				<td>정보수정일</td>
				<td><%=smvo.getSupdatedate() %></td>
			</tr>
		</table>
		<form name="updateForm"
			  method="post">
			<input type="button" value="수정하기" onclick="click_btn('update')">
			<input type="button" value="탈퇴하기" onclick="click_btn('delete')">
			<input type="hidden" name="snoVal" value="<%= smvo.getSno() %>">		
		</form>
	</body>
</html>