<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %> 
<%@ page import="java.util.ArrayList" %>   
<%

	String sno = request.getParameter("searchKeyword");
	System.out.println("sMemberDetail.jsp >>> 데이터확인 sno:" + sno);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원정보</title>
		<script type="text/javascript">
			console.log('회원정보 페이지 스크립트 시작!');
			
		</script>
	</head>
	<body>
		회원정보
	<%
		//dao
		SmemberDAO smdao = new SmemberDAOImpl();
		SmemberVO smvo = null;
		smvo = new SmemberVO();
		smvo.setSno(sno);
		ArrayList<SmemberVO> arraySearch = smdao.searchSmember(smvo);
		System.out.println("sMemberDetail.jsp >>> 데이터확인 arraySearch.size():" + arraySearch.size());
		
	%>
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td></td>
			</tr>
			<tr>
				<td>ID</td>
				<td></td>
			</tr>
			<tr>
				<td>이름</td>
				<td></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td></td>
			</tr>
			<tr>
				<td>성별</td>
				<td></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td></td>
			</tr>
			<tr>
				<td>메일</td>
				<td></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td></td>
			</tr>
			<tr>
				<td>주소</td>
				<td></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td></td>
			</tr>
			<tr>
				<td>정보수정일</td>
				<td></td>
			</tr>
		</table>
		
		<input type="button" value="수정하기">
		<input type="button" value="탈퇴하기">
		<input type="hidden" value="">
	</body>
</html>