<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.io.PrintWriter"%>

<script src="http://code.jquery.com/jquery.js"></script>
<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

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

	if (!(session.getAttribute("LOGIN_BELONG").equals("관리자"))) {

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
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
        
<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<div class="box-name"></div>
				<div class="box-icons"></div>
				<div class="no-move"></div>
			</div>
			<div class="box-content no-padding">
				<form method="post">
					<input type="hidden" name="id" value="${userVO.id}">

					<table
						class="table table-bordered table-striped table-hover table-heading table-datatable">
						<thead>
							<tr>
								<th>소속</th>
								<th>이름</th>
								<th>ID</th>
								<th>비밀번호</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${fn:length(UserList)-1 >= 0}">
								<c:forEach end="${fn:length(UserList)-1}" begin="0"
									varStatus="rowIndex">
									<tbody id="table_list">
										<!-- Start: list_row -->
										<tr>
											<td>${UserList[rowIndex.index].manager_belong}</td>
											<td>${UserList[rowIndex.index].manager_name}</td>
											<td>${UserList[rowIndex.index].id}</td>
											<td>${UserList[rowIndex.index].pw}</td>
										</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="9">조회된 결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

						<!-- End: list_row -->
						</tbody>

					</table>

				</form>
				
				</div>
				
			</div>
				
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
	</script>
