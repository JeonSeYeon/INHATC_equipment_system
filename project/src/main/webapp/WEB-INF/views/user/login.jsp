<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" flush="true" />

<link rel="stylesheet" href="../css/user/login.css">

	<form method="post" class="signUp" id="signupForm" name="signupForm">
		<h3 class="signUpTitle">IT & PC지원실<br>- 로그인</h3>
		
		<input type="text" id="id" name="id" class="signUpInput" placeholder="학번을 입력해주세요." autofocus required> 
		<input type="password" id="pw" name="pw" class="signUpInput" placeholder="비밀번호를 입력해주세요." onkeypress="if(event.keyCode == 13){ fncLogin(); return;}" required> 
		<input type="button" value="로그인" class="signUpButton" onclick="fncLogin()">
		
	</form>
	
<jsp:include page="/WEB-INF/views/includes/footer.jsp" flush="true" />
 
<script>
function fncLogin() {
	
	var pData = $("#signupForm").serialize();

	$.ajax({
		type : "post",
		url : "/login",
		data : pData,
		success : function(response, txtStatus, xhr) {                                                                                                       
			if (response == "N") {
				alert("아이디 또는 비밀번호가 잘못되었습니다.");
			} else {
				alert("로그인 성공!");
				location.href='/';
			}
		},
		error : function(request, status, error) {
			alert("code = " + request.status + " message = "
					+ request.responseText + " error = " + error);
		}
	});
}
</script>



