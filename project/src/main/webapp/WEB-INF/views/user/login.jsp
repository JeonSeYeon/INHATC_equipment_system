<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" flush="true" />

<link rel="stylesheet" href="/../css/user/login.css">

<div class="form">
	<div class="form-toggle"></div>
	<div class="form-panel one">
		<div class="form-header">
			<h1>Login</h1>
		</div>
		<div class="form-content">
			<form id="signupForm" name="signupForm">
				<div class="form-group">
					<label for="username">Id</label> <input type="text" id="id"	name="id" autofocus required />
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" id="pw" name="pw" onkeypress="if(event.keyCode == 13){ fncLogin(); return;}" required />
				</div>
				<div class="form-group">
					<input type="button" value="Login" class="signUpButton" onclick="fncLogin()">
				</div>
			</form>
		</div>
	</div>
</div>

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
				alert("로그인이 정상적으로 되었습니다.");
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



