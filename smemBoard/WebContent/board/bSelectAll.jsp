<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="pattern.practice2.sboard.dao.SboardDAO" %>
<%@ page import="pattern.practice2.sboard.dao.SboardDAOImpl" %>
<%@ page import="pattern.practice2.sboard.vo.SboardVO" %>
<%@ page import="java.util.ArrayList " %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>게시판</title>
		<style type="text/css">
			.tt{
				text-align: center;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
			// 체크박스 중복 방지
			function nMultipleCheck(val){
				var checkObj = document.getElementsByName("bno");
				for(var i=0; i<checkObj.length; i++){
					if(checkObj[i]!=val){
						checkObj[i].checked = false;
					}// end of if
				}// end of for
			}// end of 중복방지
		
			// 버튼클릭이벤트
			function click_btn(val){
				//글쓰기
				if(val=="I"){
					console.log('글쓰기버튼 클릭!');
					document.isudForm.action = "/board/bInsertForm.jsp";
					document.isudForm.submit();
				}
				//글조회
				if(val=="S"){
					console.log('글조회버튼 클릭!');
					var bno = "";
					
					for(var i=0;i<document.getElementsByName("bno").length;i++){
						if(document.getElementsByName("bno")[i].checked){							
							bno = document.getElementsByName("bno")[i].value;
							console.log("체크박스 bno:" + bno);
						}// end of if
					}// end of for
					
					// 체크박스 미체크 확인
					if(bno==""){
						alert("조회할 글을 선택해주세요!");
						return false;
					}// end of if
					
					document.isudForm.action = "/board/bSelect.jsp";
					document.isudForm.submit();
				}// end of if
				//글수정
				if(val=="U"){
					console.log('글수정버튼 클릭!');
					var bno = "";
					
					for(var i=0;i<document.getElementsByName("bno").length;i++){
						if(document.getElementsByName("bno")[i].checked){							
							bno = document.getElementsByName("bno")[i].value;
							console.log("체크박스 bno:" + bno);
						}// end of if
					}// end of for
					
					// 체크박스 미체크 확인
					if(bno==""){
						alert("수정할 글을 선택해주세요!");
						return false;
					}// end of if
					
					document.isudForm.action = "/board/bUpdateForm.jsp";
					document.isudForm.submit();
				}
				//글삭제
				if(val=="D"){
					console.log('글삭제버튼 클릭!');
					var bno = "";
					
					for(var i=0;i<document.getElementsByName("bno").length;i++){
						if(document.getElementsByName("bno")[i].checked){							
							bno = document.getElementsByName("bno")[i].value;
							console.log("체크박스 bno:" + bno);
						}// end of if
					}// end of for
					
					// 체크박스 미체크 확인
					if(bno==""){
						alert("삭제할 글을 선택해주세요!");
						return false;
					}// end of if
					
					document.isudForm.action = "/board/bDeleteForm.jsp";
					document.isudForm.submit();
				}
			}// end of click_btn
		</script>
	</head>
	<body>
		<form name="isudForm" method="POST">
			<center>
				<table border="1">
					<thead>
						<tr>
							<td colspan="7" align="center"><h2>게시판</h2></td>
						</tr>
						<tr>
							<td colspan="7" align="right">
								<input type="button" value="글쓰기" onclick="click_btn('I')">
								<input type="button" value="글조회" onclick="click_btn('S')">
								<input type="button" value="글수정" onclick="click_btn('U')">
								<input type="button" value="글삭제" onclick="click_btn('D')">
							</td>
						</tr>
						<tr>
							<td class="tt">선택</td>
							<td class="tt">글번호</td>
							<td class="tt">제목</td>
							<td class="tt">이름</td>
							<td class="tt">내용</td>
							<td class="tt">작성일</td>
							<td class="tt">수정일</td>
						</tr>
					</thead>
					<tbody>
					<%
						// dao
						SboardDAO sbdao = new SboardDAOImpl();
						ArrayList<SboardVO> aListSelectAll = sbdao.selectAllSboard();
						
						// 널체크
						if(aListSelectAll==null){
							// 글데이터없음
						%>
							<tr>
								<td align="center"><input type="checkbox"></td>
								<td colspan="6" align="center">데이터 없음</td>
							</tr>
						<%
						}else{
							SboardVO sbvo = null;
							for(int i=0;i<aListSelectAll.size();i++){
								sbvo = new SboardVO();
								sbvo = aListSelectAll.get(i);
						%>				
							<tr>
								<td align="center"><input type="checkbox" name="bno" value="<%=sbvo.getBno()%>" onclick="nMultipleCheck(this)"></td>
								<td><%=sbvo.getBno() %></td>
								<td><%=sbvo.getBsubject() %></td>
								<td><%=sbvo.getBname() %></td>
								<td><%=sbvo.getBmemo() %></td>
								<td><%=sbvo.getBinsertdate() %></td>
								<td><%=sbvo.getBupdatedate()%></td>
							</tr>
						<%	
							}// end of for
							
						}// end of if
					%>	
						<tr>
							<td colspan="7" align="right">
								<input type="button" value="글쓰기" onclick="click_btn('I')">
								<input type="button" value="글조회" onclick="click_btn('S')">
								<input type="button" value="글수정" onclick="click_btn('U')">
								<input type="button" value="글삭제" onclick="click_btn('D')">
							</td>
						</tr>					
					</tbody>
				</table>
			</center>
		</form>
	</body>
</html>