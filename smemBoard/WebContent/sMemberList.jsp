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
		<title>회원목록</title>
		<script type="text/javascript">
			console.log('[log]회원목록페이지 스크립트 시작!');
			
			// 검색버튼클릭
			function clickBtn(){
				console.log("검색버튼 클릭이벤트 발생!\n>>>검색어: "+ document.getElementById('searchKeyword').value);

				// 빈칸체크
				if(!document.getElementById('searchKeyword').value){
					console.log("데이터확인 >>> searchKeyword: null");
					alert("검색할 회원번호를 입력해주세요.");
					document.getElementById('searchKeyword').focus();
					return;
				}// end of if
				
				// form데이터 전송
				document.searchForm.action="/sMemberDetail.jsp";
				document.searchForm.submit();
			}// end of clickBtn()
			
		</script>
	</head>
	<body>
		회원목록
		<table border="1">
			<tr>
				<td><input type="checkbox" disabled></td>
				<td>회원번호</td>
				<td>ID</td>
				<td>이름</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>연락처</td>
				<td>메일</td>
				<td>우편번호</td>
				<td>주소</td>
			</tr>
			<%
				// select all dao vo
				SmemberDAO smdao = new SmemberDAOImpl();
				ArrayList<SmemberVO> smemberArray = smdao.selectAllSmember();
				System.out.println("sMemberList.jsp >>> 데이터확인 smemberArray길이 : " + smemberArray.size());
				
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
		</table>
		<form name="searchForm"
			  method="POST">		
			<input type="text" id="searchKeyword" name="searchKeyword" placeholder="회원번호 입력">
			<input type="button" value="회원상세검색" onclick="clickBtn()">
		</form>
	</body>
</html>