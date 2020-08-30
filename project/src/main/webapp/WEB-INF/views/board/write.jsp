<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.PrintWriter"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

	if (!(session.getAttribute("LOGIN_BELONG").equals("IT지원실") || session.getAttribute("LOGIN_BELONG").equals("PC지원실")  || session.getAttribute("LOGIN_BELONG").equals("내비게이션") || session.getAttribute("LOGIN_BELONG").equals("관리자")) ) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓸 권한이 없습니다.')");
		script.println("location.href = '/'");
		script.println("</script>");
	}
%>


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
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">접수하기</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
		<form action="/board/register" method="post">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tbody>
				<tr>
					<th colspan="4"><p style = "font-size:1.5em; text-align:center;">의뢰 정보</p></th>
				</tr>
				
				<tr>
					<th style = "text-align:center; background:white; color:black;">작업분류</th>
					<td><select name="manager_classification">
							<option value="PC실습실" selected="selected">PC실습실</option>
							<option value="행정사무실">행정사무실</option>
							<option value="강의실">강의실</option>
							<option value="교수실">교수실</option>
							<option value="기타">기타</option>
					</select></td>
					
					<th style = "text-align:center; background:white; color:black;">의뢰자 구분</th>
					<td><select name="client_division">
							<option value="교수" selected="selected">교수</option>
							<option value="직원">직원</option>
							<option value="학생">학생</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>

				<tr>
					<th style = "text-align:center; background:white; color:black;">의뢰자 연락처</th>
					<td><input type="text" placeholder="연락처를 입력해주세요." name="client_number" id="client_number" class="form-control" >
						<!-- <button type="button" id="numberBtn" class="button">조회</button></td> -->
					
					<th style = "text-align:center; background:white; color:black;">의뢰자 이름</th>
					<td><input type="text"  placeholder="이름을 입력해주세요." name="client_name"	id="client_name" class="form-control"></td>
					
					
				</tr>
				
				<tr>
					<th style = "text-align:center; background:white; color:black;">의뢰자 소속</th>
					<td><input type="text"  placeholder="소속을 입력해주세요." name="client_belong" id="client_belong" class="form-control"></td>
					
					<th style = "text-align:center; background:white; color:black;">의뢰자 위치</th>
					<td><input type="text"  placeholder="위치를 입력해주세요." name="client_local" id="client_local" class="form-control"></td>
				
				
				</tr>
				

				<tr>
					<th style = "text-align:center; height:20px; background:white; color:black;">기기종류</th>
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
						<td><input type="text" placeholder="접수자를 입력해주세요." name="writer" id="writer" class="form-control"/></td>
						
					
						<th style = "text-align:center; background:white; color:black;">접수분류</th>
						<td><select name="call_classification">
								<option value="전화" selected="selected">전화</option>
								<option value="방문">방문</option>
								<option value="이메일">이메일</option>
								<option value="업무연락 전">업무연락 전</option>
						</select></td>
					</tr>
					
					<tr>
						<th style = "text-align:center; background:white; color:black;">접수내용</th>
						<td colspan="3"><textarea placeholder="접수내용을 입력해주세요." name="content" class="form-control" type="text"></textarea></td>
					</tr>
					
					
					<%-- <tr>
					
						<c:if test="${boardVO.progress eq '처리중'}">
						<th>처리자</th>
						<td><input type="text" placeholder="처리자를 입력해주세요." name="completeId" id="completeId" class="form-control"></td>
						</c:if>
					</tr>
					<tr>
						<c:if test="${boardVO.progress eq '처리중'}">
						<th>처리내용</th>
						<td colspan="3"><textarea placeholder="처리내용을 입력해주세요." name="completeContent" class="form-control" type="text"></textarea></td>
						</c:if>
					</tr> --%>
					
				</tbody>
			</table>
			<div class="button_rtbox">
				<span class="button bt01"><button style="color:#FFFFFF; font-weight:bold; margin-left:500px;" type="submit" id="submitBtn" class="bt01">등록</button></span>
			</div>
		</form>
	</div>
</div>

<!-- In Content End -->




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

	$(document).ready(function() {
						$("#numberBtn").click(function() {
							/* if ($("#client_number").val() == "") {
												alert("전화번호를 입력해주세요.");
												$("#client_number").focus();
												return false;
											} */

											var pData = {};
											/* jQuery("form#saveForm :input[type!='button']").each(function(e) {
											pData[$(this).prop('name')] = $(this).val().toString();
											}); */
											//alert($("#number").val().toString());
											pData['client_number'] = $("#client_number").val().toString();

											$.ajax({
														type : "post",
														url : '/board/information',
														data : pData,
														type : 'post',

														success : function(response,txtStatus, xhr) {

															$('#client_belong').val(response.client_belong);
															$('#client_local').val(response.client_local);
															$('#client_name').val(response.client_name);
														},

														error : function(request,status, error) {
															alert("code = "+ request.status + " message = " + request.responseText 
																	+ " error = "
																	+ error);
														}
													})

										});

						$("#submitBtn").click(function() {

											/* if ($("#client_number").val() == "") {
												alert("전화번호를 입력해주세요.");
												$("#client_number").focus();
												return false;
											} */

											if ($("#client_belong").val() == "") {
												alert("소속을 입력해주세요.");
												$("#client_belong").focus();
												return false;
											}

											if ($("#client_local").val() == "") {
												alert("위치를 입력해주세요.");
												$("#client_local").focus();
												return false;
											}

											if ($("#client_name").val() == "") {
												alert("이름을 입력해주세요.");
												$("#client_name").focus();
												return false;
											}
											
											if ($("#writer").val() == "") {
												alert("접수자를 입력해주세요.");
												$("#client_name").focus();
												return false;
											}

											if ($(':radio[name="instrument"]:checked').length < 1) {
												alert("고장난 기자재를 체크해주세요.");
												$("#instrument").focus();
												return false;
											}
											
											if (confirm('등록 하시겠습니까?') == true){ 
												}
											else{ return false; } ;
											

										});
					});
</script>

