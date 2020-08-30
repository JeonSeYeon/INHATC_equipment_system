<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<script src="/js/main/util.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery.js"></script>

<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../js/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../js/sb-admin-2.min.js"></script>


  <!-- Custom fonts for this template-->
  <link href="../../css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin-2.min.css" rel="stylesheet">

<%
String userID = null;
	System.out.println(session.getAttribute("LOGIN_BELONG"));
	if (session.getAttribute("LOGIN_ID") != null) {
		userID = (String) session.getAttribute("LOGIN_ID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = '/'");
		script.println("</script>");
	}
%>

<script>
function fncLogin() {
	location.href='/loginHome';
	return false;
}

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
			//gfnOpenPop('/joinAction', '등록', '800', '500');
			location.href='/joinAction';
			return false; 
		 } 
	
	return false;
}

function fncPrint() {
	document.form.action='/board/print';
	document.form.submit();
}

function fncManager() {
	 if('<%=session.getAttribute("LOGIN_ID")%>' == "null") {
			alert("로그인이 필요합니다.");
			location.href='/';
			return false;
			
		} else if('<%=session.getAttribute("LOGIN_BELONG")%>' != "관리자") {
			alert("권한이 없습니	다.");
			location.href='/board/error';
			return false;
						
		}else {
			gfnOpenPop('/managerAction', '등록', '800', '550');
			
			return false;
		}
	
	return false;
}

	$(document)
			.ready(
					function() {
						$("input:radio[name='instrument']:radio[value=${boardVO.instrument}]").prop('checked', true);
						
						$("#submitBtn_update").click(function() {
						
							if (confirm('수정하시겠습니까?') == true){ 
								}
							else{ return false; } ;
						});
						
						$("#submitBtn_delete").click(function() {
							
							if (confirm('삭제하시겠습니까?') == true){ 
								}
							else{ return false; } ;
						});
						
						$("#submitBtn_updateIng").click(function() {
							
							if (confirm('처리하시겠습니까?') == true){ 
								}
							else{ return false; } ;
						});
						
						
						
					});
	
	/* $("#submitBtn_d").click(function() {
		
		if (confirm('삭제 하시겠습니까?') == true){ 
			window.location.href = 'form.action=/board/delete';
			alert('삭제가 완료되었습니다.'); window.opener.location.reload(); window.close(); }
		else{ return false; } ; 
		
	});*/
	
</script>


  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon rotate-n-15"></div>
        <div>IT지원실 <sup>2020</sup></div>
      </a>

		<c:set var="NAME" value="${sessionScope.LOGIN_NAME}" />
		<c:set var="ID"	value="${sessionScope.LOGIN_ID}" />
			
      <!-- Nav Item - Pages Collapse Menu -->
       <li class="nav-item">
           <c:if test="${ID ne null}">
			<a href="/logout" class="nav-link"> <i class="fa fa-power-off"></i><span>로그아웃</span></a>
		</c:if>
				
		<c:if test="${ID eq null}">
			<a href="#" class="nav-link" onclick="fncLogin();"> <i class="fa fa-power-off"></i><span>로그인</span></a>
		</c:if>
      </li>
       <hr class="sidebar-divider d-none d-md-block">
      
      <div class="sidebar-heading">
        Service
      </div>
      <li class="nav-item">
         <a class="nav-link" href="/chart">
          <span>차트</span>
        </a>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider">

     <c:if test="${sessionScope.LOGIN_BELONG eq '관리자'}">
					
      <div class="sidebar-heading">
        Admin
      </div>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          
          <span>회원 관리</span>
        </a>
          <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Member management:</h6>
            <a class="collapse-item" href="#" onclick="fncJoin();" ><button type="hidden" style="background:#FFFFFFFF; border:sienna; " >회원정보</button></a>
            
            <form action="/showUser" method="post">
            <a class="collapse-item" href="#"><button type="hidden" style="background:#FFFFFFFF; border:sienna; " >회원 목록보기</button></a>
			</form>	
           
          </div>
        </div>
      </li>
     
      <form action="/board/print" method="post" name="form">
	      <li class="nav-item">
	        <a href="#" type="submit" class="nav-link" onclick="fncPrint();">
	        <span>보고서 출력</span></a>
	      </li>
	
      
       <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      </form>
 	</c:if>
    </ul>
    <!-- End of Sidebar -->


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">
          
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a href="/"><img src="../../img/logo.png" alt="/" width="200px" height="45px" align="center" border="0"></a>
              
              
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->
        
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            
            <!-- Begin Page Content -->
        <div class="container-fluid">

		<!-- DataTales Example -->
          <div class="card shadow mb-4" style="margin-top:-40px;">
             <div class="card-body">
              <div class="table-responsive">
	<form method="post"><input type="hidden" name="bno" value="${boardVO.bno}">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tbody>
				<tr>
					<th colspan="4"><p style = "font-size:1.5em; text-align:center;">의뢰 정보</p></th>
				</tr>
				
				<tr>
					<th style = "text-align:center; background:white; color:black;">작업분류</th>
					<td ><input type="text" name="manager_classification" class="form-control" value="${boardVO.manager_classification}"/></td>
					
					<th style = "text-align:center; background:white; color:black;">의뢰자 구분</th>
					<td><input type="text" name="client_division" class="form-control" value="${boardVO.client_division}"/></td>
					
				</tr>

				<tr>
					<th style = "text-align:center; background:white; color:black;" >의뢰자 연락처</th>
					<td><input type="text" name="client_number" class="form-control" value="${boardVO.client_number}" /></td>
					
					<th style = "text-align:center; background:white; color:black;">의뢰자 이름</th>
					<td><input type="text" name="client_name" class="form-control"	value="${boardVO.client_name}" /></td>
					
				</tr>
				
				<tr>
					<th style = "text-align:center; background:white; color:black;">의뢰자 소속</th>
					<td><input type="text" name="client_belong" class="form-control" value="${boardVO.client_belong}"/></td>
					
					<th style = "text-align:center; background:white; color:black;">의뢰자 위치</th>
					<td><input type="text" name="client_local" class="form-control" value="${boardVO.client_local}" /></td>
				
				</tr>
				

				<tr>
					<th style = "text-align:center;  height:20px; background:white; color:black;">기기종류</th>
					<td colspan="3" >
					PC관련:    
					<input type="radio" name="instrument" value="1">모니터
					<input type="radio" name="instrument" value="3">PC
					<input type="radio" name="instrument" value="8">소프트웨어 관련(설치&인증) 
					<input type="radio" name="instrument" value="4">인터넷 <br>
					<hr>
					장비관련:
					<input type="radio" name="instrument" value="2">프린터
					<input type="radio" name="instrument" value="5">전화기
					<input type="radio" name="instrument" value="6">프로젝터 빔
					<input type="radio" name="instrument" value="7">앰프 <br>
					<hr>
					기타: 
					<input type="radio" name="instrument" value="11">Net-class 관련
					<input type="radio" name="instrument" value="9">기타</td>

				</tr>
				</table>
				
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tbody>
				
					<tr>
						<th colspan="4"><p style = "font-size:1.5em; text-align:center;">접수 정보</p></th>
					</tr>
					<tr>
					
						<th style = "text-align:center; background:white; color:black;">접수자</th>
						<td><input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly></td>
						
						
						<th style = "text-align:center; background:white; color:black;">접수분류</th>
						<td ><input type="text" name="manager_classification" class="form-control" value="${boardVO.call_classification}"/></td>
						
						
						
					</tr>
					
					<tr>
						<th style = "text-align:center; background:white; color:black;">접수내용</th>
						<td colspan="3"><textarea name="content" class="form-control" >${boardVO.content}</textarea></td>
					</tr>
					</tbody>
			</table>
			
			
			<c:if test="${boardVO.progress eq '처리중' || boardVO.progress eq '처리완료' }">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tbody>
				
				
					<tr>
						<th colspan="4"><p style = "font-size:1.5em; text-align:center;">처리 정보</p></th>
					</tr>
					
					<tr>
						<th style = "text-align:center; background:white; color:black;">처리자</th>
						<td><input type="text" name="completeId" id="completeId" class="form-control" value="${boardVO.completeId}"></td>
					</tr>
					
					<tr>
						<th style = "text-align:center; background:white; color:black;">처리내용</th>
						<td colspan="3"><textarea name="completeContent" class="form-control" type="text">${boardVO.completeContent}</textarea></td>
					</tr>
					
				</tbody>
			</table>
		</c:if>
		
		
		<div class="button_rtbox">
			<div style="margin-left:500px;">
			<c:if test="${boardVO.progress eq '처리대기' }">
				<c:if test="${sessionScope.LOGIN_NAME eq boardVO.writer || sessionScope.LOGIN_BELONG eq '관리자' }">
						<span class="button bt01"><button style="color:#FFFFFF; font-weight:bold;"  type="submit" class="button" id ="submitBtn_update" onclick="javascript: form.action='/board/modify';">수정하기</button></span>
						<span class="button bt01"><button  style="color:#FFFFFF; font-weight:bold;" type="submit" class="button" id ="submitBtn_delete" onclick="javascript: form.action='/board/delete';">삭제하기</button></span>
				</c:if>
		
			</c:if>
			</div>
		</div>
		
		<div class="button_rtbox">
		<div style="margin-left:500px;">
			<c:set var="data" value="boardVO.progress" />
				<c:choose>
					<c:when test="${boardVO.progress eq '처리중' && (sessionScope.LOGIN_NAME eq boardVO.completeId|| sessionScope.LOGIN_NAME eq boardVO.writer || sessionScope.LOGIN_BELONG eq '관리자')}">
							<span class="button bt01"><button style="color:#FFFFFF; font-weight:bold;"  type="submit" class="button" id ="submitBtn_update" onclick="javascript: form.action='/board/modify';">수정하기</button></span>
							<span class="button bt01"><button  style="color:#FFFFFF; font-weight:bold;" type="submit" class="button" id ="submitBtn_delete" onclick="javascript: form.action='/board/delete';">삭제하기</button></span> 
							<span class="button bt01"><button  style="color:#FFFFFF; font-weight:bold;" type="submit" class="bt01" id ="submitBtn_updateIng" onclick="javascript: form.action='/board/updateEnd';">처리완료</button></span>
							</c:when>
				
					<%-- <c:when test="${boardVO.progress eq '처리중' && (sessionScope.LOGIN_NAME ne boardVO.completeId|| sessionScope.LOGIN_NAME ne boardVO.writer || sessionScope.LOGIN_BELONG ne '관리자')}">
							<span class="button bt01"><button type="button" class="bt01" id ="submitBtn_updateIng" onclick="javascript: form.action='/board/updateIng';">처리중</button></span>
							<span class="button bt02"><button class="bt01"	onclick="window.close()">닫기</button></span>
					</c:when> --%>
				
					<c:when test="${boardVO.progress eq '처리완료' && (sessionScope.LOGIN_NAME eq boardVO.completeId|| sessionScope.LOGIN_NAME eq boardVO.writer || sessionScope.LOGIN_BELONG eq '관리자')}">
						<span class="button bt01"><button  style="color:#FFFFFF; font-weight:bold; " type="submit" class="button" id ="submitBtn_update" onclick="javascript: form.action='/board/modify';">수정하기</button></span>
						<span class="button bt01"><button  style="color:#FFFFFF; font-weight:bold" type="submit" class="button" id ="submitBtn_delete" onclick="javascript: form.action='/board/delete';">삭제하기</button></span> 
							</c:when>
				
					<%-- <c:when test="${boardVO.progress eq '처리완료' && (sessionScope.LOGIN_NAME ne boardVO.completeId|| sessionScope.LOGIN_NAME ne boardVO.writer || sessionScope.LOGIN_BELONG ne '관리자')}">
						<span class="button bt02"><button class="bt01"	onclick="window.close()">닫기</button></span>
					</c:when> --%>
				
				</c:choose>
			</div>
			</div>	
	</form>
</div>
	</div>



      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; INHA TECHNICAL COLLEGE</span><br>
            <span>22212 인천광역시 미추홀구 인하로100 인하공업전문대학 TEL. 032)870-2662</span><br>
            <span>Jeon SeYeon(tktktk654@naver.com)</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->


    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->




