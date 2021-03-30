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
	// 글번호 데이터
	String bno = request.getParameter("bno");
	System.out.println("bUpdateForm.jsp >>> 폼데이터 bno:" + bno);
	
	if(bno==null){
		Object bnoObj = request.getParameter("bno");
		System.out.println("bnoObj:" + bnoObj);
		bno = (String)bnoObj;
		System.out.println("bUpdateForm.jsp >>> 쿼리스트링 데이터 bno:" + bno);
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
		<title>글수정 페이지</title>
		<style type="text/css">
			.tt{
				text-align: center;
				font-weight: bold;
			}
		</style>
		<script type="text/javascript">
		
			function click_btn(val){
				// 수정하기 버튼
				if(val=="U"){
					console.log('수정완료 버튼 클릭!');
					
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
					document.updateForm.action="/board/bUpdate.jsp";
					document.updateForm.submit();
				}// end of U
				// 글목록 버튼
				if(val=="SALL"){
					console.log('글목록 버튼 클릭');
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
				System.out.println("데이터 조회 실패 >>> aListSelect.size():" + aListSelect.size());
			}else{
				for(int i=0;i<aListSelect.size();i++){
					sbvo = new SboardVO();
					sbvo = aListSelect.get(i);
			%>
				<tr>
					<td colspan="2" align="center"><h2>글수정하기</h2></td>
				</tr>
				<tr>
					<td class="tt">글번호</td>
					<td>
						<input type="text" value="123" size="20" disabled>
						<input type="hidden" name="bno" value="<%=sbvo.getBno() %>">
					</td>
				</tr>
				<tr>
					<td class="tt">제목</td>
					<td><input type="text" name="bsubject" id="subjectVal" value="<%=sbvo.getBsubject() %>" size="53"></td>
				</tr>
				<tr>
					<td class="tt">이름</td>
					<td><input type="text" name="bname" id="nameVal" value="<%=sbvo.getBname() %>" size="20"></td>
				</tr>
				<tr>
					<td class="tt">비밀번호</td>
					<td><input type="password" name="bpw" id="pwVal" value="<%=sbvo.getBpw() %>" size="20"></td>
				</tr>
				<tr>
					<td class="tt">작성일</td>
					<td><input type="text" value="<%=sbvo.getBinsertdate() %>" disabled></td>
				</tr>
				<tr>
					<td class="tt">수정일</td>
					<td><input type="text" value="<%=sbvo.getBupdatedate() %>" disabled></td>
				</tr>
				<tr>
					<td class="tt">내용</td>
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
						<input type="button" value="수정완료" onclick="click_btn('U')">
						<input type="reset" value="다시">						
						<input type="button" value="글목록" onclick="click_btn('SALL')">	
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>