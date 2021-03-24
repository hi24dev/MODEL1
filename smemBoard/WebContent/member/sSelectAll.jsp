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
			
			// 버튼클릭
			function click_btn(actionVal){
				if(actionVal=="I"){
					console.log('입력버튼 클릭! >>> actionVal:' + actionVal);
					document.searchForm.action="/member/sInsertForm.html";
					document.searchForm.submit();
				}
				if(actionVal=="S"){
					console.log('조회버튼 클릭! >>> actionVal:' + actionVal
											+ "\n>>>회원번호: "+ document.getElementById('searchKeyword').value);	
					// 빈칸체크
					if(!document.getElementById('searchKeyword').value){
						console.log("데이터확인 >>> searchKeyword 빈칸");
						alert("조회/수정/삭제 할 회원번호를 입력해주세요.");
						document.getElementById('searchKeyword').focus();
						return;
					}// end of if
					
					// form데이터 전송
					document.searchForm.action="/member/sSelect.jsp";
					document.searchForm.submit();
				}
				if(actionVal=="U"){
					// 빈칸체크
					if(!document.getElementById('searchKeyword').value){
						console.log("데이터확인 >>> searchKeyword 빈칸");
						alert("조회/수정/삭제 할 회원번호를 입력해주세요.");
						document.getElementById('searchKeyword').focus();
						return;
					}// end of if

					console.log('수정버튼 클릭! >>> actionVal:' + actionVal
											+ "\n>>>회원번호: "+ document.getElementById('searchKeyword').value);
					document.searchForm.action="/member/sUpdateForm.jsp";
					document.searchForm.submit();
				}
				if(actionVal=="D"){
					// 빈칸체크
					if(!document.getElementById('searchKeyword').value){
						console.log("데이터확인 >>> searchKeyword 빈칸");
						alert("조회/수정/삭제 할 회원번호를 입력해주세요.");
						document.getElementById('searchKeyword').focus();
						return;
					}// end of if

					console.log('탈퇴버튼 클릭! >>> actionVal:' + actionVal
											+ "\n>>>회원번호: "+ document.getElementById('searchKeyword').value);
					document.searchForm.action="/member/sDelete.jsp";
					document.searchForm.submit();
				}
			}// end of click_btn()
			
			function blanc_chk(){
				// 빈칸체크
				if(!document.getElementById('searchKeyword').value){
					console.log("데이터확인 >>> searchKeyword 빈칸");
					alert("조회/수정/삭제 할 회원번호를 입력해주세요.");
					document.getElementById('searchKeyword').focus();
					return;
				}// end of if
			}// end of blanc_chk()
			
		</script>
	</head>
	<body>
		<table border="1" align="center">
			<tr>
				<td colspan="10" align="center">회원전체조회</td>
			</tr>
			<tr>
				<td><input type="checkbox" disabled></td>
				<td align="center">회원번호</td>
				<td align="center">ID</td>
				<td align="center">이름</td>
				<td align="center">생년월일</td>
				<td align="center">성별</td>
				<td align="center">연락처</td>
				<td align="center">메일</td>
				<td align="center">우편번호</td>
				<td align="center">주소</td>
			</tr>
			<%
				// select all dao vo
				SmemberDAO smdao = new SmemberDAOImpl();
				ArrayList<SmemberVO> smemberArray = smdao.selectAllSmember();
				System.out.println("sMemberList.jsp >>> 데이터확인 smemberArray길이 : " + smemberArray.size());
				
				// null체크
				if(smemberArray.size()==0){
				%>		
					<tr>
						<td><input type="checkbox"></td>
						<td colspan="9">no data</td>
					</tr>
				<%		
				}else{
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
						<tr>
							<td colspan="10">
								<form name="searchForm"
								  	  method="POST">		
									<input type="text" id="searchKeyword" name="snoVal" placeholder="회원번호 입력란"  width="250">
									<input type="button" value="입력" onclick="click_btn('I')">
									<input type="button" value="조회" onclick="click_btn('S')">
									<input type="button" value="수정" onclick="click_btn('U')">
									<input type="button" value="삭제" onclick="click_btn('D')">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="reset" value="다시">
								</form>
							</td>
						</tr>
					<%
				}// end of if-else
			%>
		</table>


	</body>
</html>