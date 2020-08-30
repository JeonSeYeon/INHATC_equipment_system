<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="../../css/style.css" rel="stylesheet">
<script src="../../js/jquery.smint.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">

$(document).ready( function() {
    $('.subMenu').smint({
    	'scrollSpeed' : 1000
    });
});

function fncJoin() {
	 if('<%=session.getAttribute("LOGIN_ID")%>' == "null" ){
			alert("로그인이 필요합니다.");
			location.href='/';
			return false;
			
		} else if('<%=session.getAttribute("LOGIN_BELONG")%>' != "관리자") {
			alert("권한이 없습니다.");
			location.href='/board/error';
			return false;
						
		}else {
			gfnOpenPop('/joinAction', '등록', '800', '500');
			return false; 
		 } 
	
	return false;
}

function fncManager() {
	 if('<%=session.getAttribute("LOGIN_ID")%>' == "null") {
			alert("로그인이 필요합니다.");
			location.href='/';
			return false;
			
		} else if('<%=session.getAttribute("LOGIN_BELONG")%>' != "관리자") {
			alert("권한이 없습니다.");
			location.href='/board/error';
			return false;
						
		}else {
			gfnOpenPop('/managerAction', '등록', '800', '550');
			
			return false;
		}
	
	return false;
}

function fncLogin() {
		location.href='/loginHome';
		return false;
}

function fncPrint() {
	document.form.action='/board/print';
	document.form.submit();
}
</script>


<a href="/"><img src="../../img/logo.png" alt="/" width="200px" height="50" align="center" border="0"></a>
			
<div class="wrap ">
	<div class="subMenu">
		<div class="inner">
		
			<form action="/board/print" method="post" name="form">
				<a href="/chart" class="subNavBtn"> <i class="fa fa-bar-chart-o"></i> <span class="hidden-xs">처리현황 </span></a>
					
				<c:if test="${sessionScope.LOGIN_BELONG eq '관리자'}">
					<a href="#" class="subNavBtn" onclick="fncManager();"> <i class="fa fa-desktop"></i> <span class="hidden-xs">내선번호 관리 </span></a>
							
					<a href="#" class="subNavBtn" type="submit" onclick="fncPrint();"> <i class="fa fa-book"></i><span class="hidden-xs">보고서 출력 </span></a>
					
					<a href="#" class="subNavBtn" onclick="fncJoin();" > <i class="fa fa-table"></i> <span class="hidden-xs">회원관리</span></a>
				</c:if>
				
			<c:set var="NAME" value="${sessionScope.LOGIN_NAME}" />
			<c:set var="ID"	value="${sessionScope.LOGIN_ID}" />
			
				
				<c:if test="${ID ne null}">
				
				<a href="/logout" class="subNavBtn"> <i class="fa fa-power-off"></i> <span class="hidden-xs">Logout</span></a>
				</c:if>
				
				<c:if test="${ID eq null}">
					<a href="#" class="subNavBtn" onclick="fncLogin();"> <i class="fa fa-power-off"></i> <span class="hidden-xs">Login</span></a>
				</c:if>
			</form>
		</div>
	</div>
	
	
	<!-- <div class="section sTop">
	<div class="inner">
	<img src="../../img/main.JPG" alt="/" width="100%" height="330px" align="center" border="0">
	</div>
	</div>
 -->
	

	
</div>










