<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAO" %>
<%@ page import="pattern.practice2.sjhmem.dao.SmemberDAOImpl" %>
<%@ page import="pattern.practice2.sjhmem.vo.SmemberVO" %> 
<%@ page import="java.util.ArrayList" %>   
<%

	String snoVal = request.getParameter("snoVal");
	System.out.println("sSelect.jsp >>> 폼 데이터확인 snoVal:" + snoVal);
		
	if(snoVal==null){
		Object snoObj = request.getParameter("sno");
		System.out.println("snoObj:" + snoObj);
		snoVal = (String)snoObj;
		System.out.println("sSelect.jsp >>> 쿼리 데이터확인 snoVal:" + snoVal);
	}

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
				if(val=="U"){
					console.log("수정 페이지 이동!");
					document.updateForm.action="/member/sUpdateForm.jsp"
					document.updateForm.submit();
				}// end of if
				
				// 탈퇴
				if(val=="D"){
					console.log("삭제 페이지 이동!");
					document.updateForm.action="/member/sDelete.jsp"
					document.updateForm.submit();
				}// end of if
				
			}// end of click_btn()
			
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
		System.out.println("sSelect.jsp >>> 데이터확인 arraySearch.size():" + arraySearch.size());

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
		<table border="1" align="center">
			<tr>
				<td colspan="2" align="center">회원조회</td>
			</tr>
			<tr>
				<td width="100" align="center">회원번호</td>
				<td width="250"><%=smvo.getSno() %></td>
			</tr>
			<tr>
				<td align="center">ID</td>
				<td><%=smvo.getSsid() %></td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td><%=smvo.getSname() %></td>
			</tr>
			<tr>
				<td align="center">생년월일</td>
				<td><%=smvo.getSbirth() %></td>
			</tr>
			<tr>
				<td align="center">성별</td>
				<td><%=smvo.getSgender() %></td>
			</tr>
			<tr>
				<td align="center">연락처</td>
				<td><%=smvo.getShp() %></td>
			</tr>
			<tr>
				<td align="center">메일</td>
				<td><%=smvo.getSmail() %></td>
			</tr>
			<tr>
				<td align="center">우편번호</td>
				<td><%=smvo.getSpost() %></td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td><%=smvo.getSaddr() %></td>
			</tr>
			<tr>
				<td align="center">가입일</td>
				<td><%=smvo.getSinsertdate() %></td>
			</tr>
			<tr>
				<td align="center">정보수정일</td>
				<td><%=smvo.getSupdatedate() %></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<form name="updateForm" method="post">
					<input type="button" value="수정" onclick="click_btn('U')">
					&nbsp;
					<input type="button" value="탈퇴" onclick="click_btn('D')">
					<input type="hidden" name="snoVal" value="<%= smvo.getSno() %>">		
				</form>
				</td>
			</tr>
		</table>
		
	</body>
</html>