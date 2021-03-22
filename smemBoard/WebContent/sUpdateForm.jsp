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
	System.out.println("sMemberUpdate.jsp >>> 데이터확인 snoVal:" + snoVal);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원정보수정</title>
		<script type="text/javascript">
			console.log('회원정보수정페이지 스트립트 시작!');
			
			function click_btn(val){
				console.log("버튼클릭 함수 시작!");
				
				if(val=="update"){
					console.log('저장하기 버튼 클릭! 빈칸체크 시작 >>> ');
					
					// 빈칸체크
					console.log('pw:' + document.getElementById('pwVal').value);
					if(!document.getElementById('pwVal').value){
						alert('pw를 입력해주세요!');
						document.getElementById('pwVal').focus();
						return;
					}// end of if
					console.log('pw:' + document.getElementById('pwVal1').value);
					if(!document.getElementById('pwVal1').value){
						alert('pw재확인란을 입력해주세요!');
						document.getElementById('pwVal1').focus();
						return;
					}// end of if
					if(document.getElementById('pwVal').value!=document.getElementById('pwVal1').value){
						alert('pw와 재확인pw가 일치하지 않습니다!');
						document.getElementById('pwVal1').focus();
						return;
					}// end of if
					console.log('이름:' + document.getElementById('nameVal').value);
					if(!document.getElementById('nameVal').value){
						alert('이름을 입력해주세요!');
						document.getElementById('nameVal').focus();
						return;
					}// end of if
					console.log('생년월일:' + document.getElementById('birthVal').value);
					if(!document.getElementById('birthVal').value){
						alert('생년월일을 입력해주세요!');
						document.getElementById('birthVal').focus();
						return;
					}// end of if
					for(var i=0;i<document.getElementsByName('sgender').length;i++){
						if(document.getElementsByName('sgender')[i].checked){
							console.log('성별:' + document.getElementsByName('sgender')[i].value);
						}// end of if
					}// end of for
					console.log('연락처:' + document.getElementById('hpVal').value);
					if(!document.getElementById('hpVal').value){
						alert('연락처를 입력해주세요!');
						document.getElementById('hpVal').focus();
						return;
					}// end of if
					
					console.log('빈칸체크 통과');
					document.updateForm.action="/sUpdate.jsp";
					document.updateForm.submit();
				}// end of if
			}// end of click_btn
		</script>
	</head>
	<body>
		회원정보수정
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
		<form name="updateForm"
			  method="post">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td><input type="text" value="<%=smvo.getSno() %>" disabled></td>
				</tr>
				<tr>
					<td>ID</td>
					<td><input type="text" value="<%=smvo.getSsid() %>" disabled></td>
				</tr>
				<tr>
					<td>*PW</td>
					<td><input type="password" id="pwVal" name="spw"></td>
				</tr>
				<tr>
					<td>*PW재확인</td>
					<td><input type="password" id="pwVal1"></td>
				</tr>
				<tr>
					<td>*이름</td>
					<td><input type="text" id="nameVal" name="sname" value="<%=smvo.getSname() %>"></td>
				</tr>
				<tr>
					<td>*생년월일</td>
					<td><input type="text" id="birthVal" name="sbirth" value="<%=smvo.getSbirth() %>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<%
						System.out.println("sgender:" + smvo.getSgender());
						if("M".equals(smvo.getSgender())){
					%>		
							<input type="radio" name="sgender" value="M" checked>남자 
							<input type="radio" name="sgender" value="F">여자		
					<%					
						}
						if("F".equals(smvo.getSgender())){
					%>		
							<input type="radio" name="sgender" value="M">남자 
							<input type="radio" name="sgender" value="F" checked>여자
					<%				
						}
					%>	
					</td>
				</tr>
				<tr>
					<td>*연락처</td>
					<td><input type="text" id="hpVal" name="shp" value="<%=smvo.getShp() %>"></td>
				</tr>
				<tr>
					<td>메일</td>
					<td><input type="text" name="smail" value="<%=smvo.getSmail() %>"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="spost" value="<%=smvo.getSpost() %>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="saddr" value="<%=smvo.getSaddr() %>"></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td><input type="text" value="<%=smvo.getSinsertdate() %>" disabled></td>
				</tr>
				<tr>
					<td>정보수정일</td>
					<td><input type="text" value="<%=smvo.getSupdatedate() %>" disabled></td>
				</tr>
			</table>
			<input type="button" value="저장하기" onclick="click_btn('update')">
			<input type="hidden" name="snoVal" value="<%=smvo.getSno()%>">
		</form>
	</body>
</html>