<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR PAGE</title>

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


</script>
</head>

<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />

<!-- Custom fonts for this template-->
  <link href="../../css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
  <script src="../../js/jquery.min.js"></script>
  <script src="../../js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../js/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../js/sb-admin-2.min.js"></script>



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
            <a class="collapse-item" href="#" onclick="fncJoin();" >회원정보</a>
            
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
  
  
  
<br><br><br><br><br><br><br>
    <center><h1>에러가 발생했습니다.</h1></center>
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
         <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="400">400</div>
            <p class="lead text-gray-800 mb-5">Bad Request</p>
            <a href="/">&larr; 메인으로</a>
          </div>

        </div>
        <!-- /.container-fluid -->
    </c:if>
    
    
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 403}">
         <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="403">403</div>
            <p class="lead text-gray-800 mb-5">Forbidden</p>
            <a href="/">&larr; 메인으로</a>
          </div>

        </div>
        <!-- /.container-fluid -->
    </c:if>
    
    
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="404">404</div>
            <p class="lead text-gray-800 mb-5">Page Not Found</p>
            <a href="/">&larr; 메인으로</a>
          </div>

        </div>
        <!-- /.container-fluid -->
        
    </c:if>
    
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
         <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="405">405</div>
            <p class="lead text-gray-800 mb-5">Method Not Allowed</p>
            <a href="/">&larr; 메인으로</a>
          </div>

        </div>
        <!-- /.container-fluid -->
    </c:if>
    
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="500">500</div>
            <p class="lead text-gray-800 mb-5">Internal Server Error</p>
            <a href="/">&larr; 메인으로</a>
          </div>

        </div>
        <!-- /.container-fluid -->
    </c:if>
    
    <c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="503">503</div>
            <p class="lead text-gray-800 mb-5">Service Unavailable</p>
            <a href="/">&larr; 메인으로</a>
          </div>

        </div>
        <!-- /.container-fluid -->
    </c:if>
    
    <br><br><br>
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
  
  
</body>
</html>