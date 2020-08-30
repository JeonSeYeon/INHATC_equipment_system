<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.io.PrintWriter"%> 

<script src="http://code.jquery.com/jquery.js"></script>

<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../js/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../js/sb-admin-2.min.js"></script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>IT지원실</title>

  <!-- Custom fonts for this template-->
  <link href="../../css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin-2.min.css" rel="stylesheet">

</head>
<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />

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

	if (!(session.getAttribute("LOGIN_BELONG").equals("관리자")) ) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = '/'");
		script.println("</script>");
	}
%> 

<body id="page-top">
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
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">회원관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              
		<form method="post"><input type="hidden" name="Id" value="${UserVO.id}">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tbody>
				
				
				<tr>
					<th>아이디</th>
					<td  colspan="3"><input type="text" placeholder="아이디를 입력해주세요." name="id" id="id" class="form-control" /><!-- <button type="button" id="idBtn" class="button"> 조회</button>--></td>
				<tr>
					<th>비밀번호</th>
					<td  colspan="3"><input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요." class="form-control" ></td>
				</tr>
				
				
				<tr>
					<th>이름</th>
					<td  colspan="3"><input type="text" placeholder="이름을 입력해주세요." name="manager_name" id="manager_name" class="form-control" ></td>
				</tr>
				<tr>
					<th>담당소속</th>										
					<td colspan="3">
					<select name="manager_belong" id="manager_belong">
						<c:set var="data" value="${UserVO.manager_belong}" />
						<option value="" selected>선택해주세요.</option>
					    <option value="IT지원실" <c:if test="${data eq 'IT지원실'}">selected</c:if>>IT지원실</option>
					    <option value="관리자" <c:if test="${data eq '관리자'}">selected</c:if>>관리자</option>
					</select></td>

					</tr>
				</tbody>
			</table>
			<div style="margin-left:450px;">
				<span class="button bt01"><button style="color:#FFFFFF; font-weight:bold"  type="submit" id="submitBtn1" class="button" onclick="javascript: form.action='/userInsert';" >추가하기</button></span>
				
				<span class="button bt01"><button style="color:#FFFFFF; font-weight:bold" type="submit" id="submitBtn2" class="button" onclick="javascript: form.action='/userModify';">수정하기</button></span>
					
				<span class="button bt01"><button style="color:#FFFFFF; font-weight:bold" type="submit" class="button" id="submitBtn3" onclick="javascript: form.action='/userDelete';">삭제하기</button></span>
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
  </div>
		</div>
  
  
  
<script>

$(document).ready(function(){

	$("input:radio[name='manager_belong']:radio[value=${userVO.manager_belong}]").prop('checked', true);
});
						$("#idBtn").click(function() {
							if ($("#id").val() == "") {
												alert("아이디를 입력해주세요.");
												$("#id").focus();
												return false;
											}
											var pData = {};
											/* jQuery("form#saveForm :input[type!='button']").each(function(e) {
											pData[$(this).prop('name')] = $(this).val().toString();
											}); */
											//alert($("#number").val().toString());
											pData['id'] = $("#id").val().toString();

											$.ajax({
														type : "post",
														url : '/user/list',
														data : pData,
														type : 'post',

														success : function(response,txtStatus, xhr) {
																$('#pw').val(response.pw);
																$('#manager_name').val(response.manager_name);
																$('#manager_belong').val(response.manager_belong);
														},

														error : function(request,status, error) {
															alert("code = "+ request.status + " message = " + request.responseText 
																	+ " error = "
																	+ error);
														}
													})

										});
						

					    $("#submitBtn1").click(function() {
					    	if ($("#id").val() == "") {
								alert("아이디를 입력해주세요.");
								$("#id").focus();
								return false;
							}
							if ($("#pw").val() == "") {
									alert("비밀번호를 입력해주세요.");
									$("#pw").focus();
									return false;
							}
							if ($("#manager_name").val() == "") {
								alert("이름을 입력해주세요.");
								$("#manager_name").focus();
								return false;
							}

							if ($("#manager_belong").val() == "") {
								alert("소속를 입력해주세요.");
								$("#manager_belong").focus();
								return false;
							}
							
							if (confirm('추가하시겠습니까?') == true){ 
								location.href='/';
								}
							else{ return false; }
							

						});
					    
					    
					    $("#submitBtn2").click(function() {
					    	if ($("#id").val() == "") {
								alert("아이디를 입력해주세요.");
								$("#id").focus();
								return false;
							}
							if ($("#pw").val() == "") {
									alert("비밀번호를 입력해주세요.");
									$("#pw").focus();
									return false;
							}
							if ($("#manager_name").val() == "") {
								alert("이름을 입력해주세요.");
								$("#manager_name").focus();
								return false;
							}

							if ($("#manager_belong").val() == "") {
								alert("소속를 입력해주세요.");
								$("#manager_belong").focus();
								return false;
							}
							if (confirm('수정하시겠습니까?') == true){ 
								location.href='/';
							}
							else{ return false; }
							

						});
					    
					    
					    $("#submitBtn3").click(function() {
					    	if ($("#id").val() == "") {
								alert("아이디를 입력해주세요.");
								$("#id").focus();
								return false;
							}
							if ($("#pw").val() == "") {
									alert("비밀번호를 입력해주세요.");
									$("#pw").focus();
									return false;
							}
							if ($("#manager_name").val() == "") {
								alert("이름을 입력해주세요.");
								$("#manager_name").focus();
								return false;
							}

							if ($("#manager_belong").val() == "") {
								alert("소속를 입력해주세요.");
								$("#manager_belong").focus();
								return false;
							}
							if (confirm('삭제하시겠습니까?') == true){ 
								location.href='/';
							}
							else{ return false; }
							

						});
						
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


</script>








