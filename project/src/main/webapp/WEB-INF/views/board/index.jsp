<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/js/main/util.js" type="text/javascript"></script>

<!-- html,jsp선언문,jstl선언문이 담겨있는 home -->

<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />
<!-- Custom fonts for this template-->
  <link href="../../css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin-2.min.css" rel="stylesheet">
<html>

<head>

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

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
        </div>
        <div>IT지원실 <sup>2020</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="/">
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          
          <span>차트</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" href="buttons.html">Buttons</a>
            <a class="collapse-item" href="cards.html">Cards</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          
          <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Utilities:</h6>
            <a class="collapse-item" href="utilities-color.html">Colors</a>
            <a class="collapse-item" href="utilities-border.html">Borders</a>
            <a class="collapse-item" href="utilities-animation.html">Animations</a>
            <a class="collapse-item" href="utilities-other.html">Other</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Admin
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          
          <span>보고서 출력</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Login Screens:</h6>
            <a class="collapse-item" href="login.html">Login</a>
            <a class="collapse-item" href="register.html">Register</a>
            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">Other Pages:</h6>
            <a class="collapse-item" href="404.html">404 Page</a>
            <a class="collapse-item" href="blank.html">Blank Page</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <span>내선번호 관리</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <span>회원 관리</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">


    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>



            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
            
            <!-- Begin Page Content -->
        <div class="container-fluid">

		<!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							
								
								<tr style="background: #2980b9;">
										<th>접수번호</th>
										<th>의뢰받은시간</th>
										<th>의뢰인</th>
										<th>소속</th>
										<th>위치</th>
										<th>실 구분</th>
										<th>연락처</th>
										<th>접수 품목</th>
										<th>접수 내용</th>
										<th>처리자</th>
										<th>진행상태</th>
										<th>접수자</th>
								</tr>
							<c:choose>
									<c:when test="${fn:length(boardList)-1 >= 0}">
										<c:forEach end="${fn:length(boardList)-1}" begin="0"
											varStatus="rowIndex">
							<tbody>
								<!-- Start: list_row -->
								<tr>
									<td>${boardList[rowIndex.index].bno}</td>
									<td>${boardList[rowIndex.index].regdate}</td>
									<td>${boardList[rowIndex.index].client_name}</td>	
									<td>${boardList[rowIndex.index].client_belong}</td>
									<td>${boardList[rowIndex.index].client_local}</td>
									<td>${boardList[rowIndex.index].manager_classification}</td>
									<td>${boardList[rowIndex.index].client_number}</td>
									<td ><c:if test="${boardList[rowIndex.index].instrument == '1'}">모니터</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '2'}">프린터</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '3'}">PC</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '4'}">인터넷</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '5'}">전화기</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '6'}">프로젝터 빔</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '7'}">앰프</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '8'}">소프트웨어 설치</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '10'}">소프트웨어 인증</c:if>
									<c:if test="${boardList[rowIndex.index].instrument == '11'}">Net-class 관련</c:if>						
									<c:if test="${boardList[rowIndex.index].instrument == '9'}">기타</c:if>
									</td>
									<td>${boardList[rowIndex.index].content}</td>
									<td>${boardList[rowIndex.index].completeId}</td>
									<td><a href="#" onclick="fncView('${boardList[rowIndex.index].bno}');" ><c:if test="${boardList[rowIndex.index].progress == '처리완료'}"><font color="blue" >
처리완료</font></c:if><c:if test="${boardList[rowIndex.index].progress == '처리중'}"><font color="red">처리중</font></c:if></a></td>
									<td>${boardList[rowIndex.index].writer}</td>
								
								</tr>
								</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="12">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<!-- End: list_row -->
							</tbody>
						</table>
					</div>
				</div>
		
		
	<%-- <c:if test="${sessionScope.LOGIN_BELONG eq '내비게이션'}"> --%>
						<c:if test="${sessionScope.LOGIN_BELONG eq '내비게이션' || sessionScope.LOGIN_BELONG eq 'IT지원실' || sessionScope.LOGIN_BELONG eq '관리자' || sessionScope.LOGIN_BELONG eq 'PC지원실' }">
						<button type="button" class="btn btn-primary" onclick="fncWrite()" style="float: right;">
							<strong>등록</strong>
						</button>
						</c:if> 
				<div class="form-inline">
						<select id="searchTypeSel" name="searchType">
							<option value="">검색조건</option>
							<option value="t">작업분류</option> 
							<option value="c">내용</option>
							<!-- <option value="w">기계명</option> -->
							<option value="tc">의뢰인</option>
							<option value="lo">위치</option>
							<option value="all">현황</option>
						</select>
						<input class="form-control" type="text" id="keyword" name="keyword" 
							value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
						<button id="searchBtn" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">검색</button>
						
					</div>
					
				
						
						
						<div class="text-center" style="margin-left: 600px;">
							<nav aria-label="pagination">
								<ul class="pagination">
									<li id="page-prev">
										<a href="${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">
											<span aria-hidden="true">«</span>
										</a>
									</li>
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									    <li id="page${idx}">
										    <a href="${pageMaker.makeQuery(idx)}">
										      	<span>${idx}<span class="sr-only">(current)</span></span>
										    </a>
									    </li>
									</c:forEach>
									<li id="page-next">
									    <a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}" aria-label="Next">
									    	<span aria-hidden="true">»</span>
									    </a>
									</li>
									
								</ul>
							</nav>
						</div>
						
						
			
</div>


			</div>
			
          </div>
          
          
		</div>
                


      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->


  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="../../js/jquery.min.js"></script>
  <script src="../../js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../js/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../../js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../../js/chart-area-demo.js"></script>
  <script src="../../js/chart-pie-demo.js"></script>
  <script>
function fncWrite() {
	 if('<%=session.getAttribute("LOGIN_ID")%>' == "null") {
			alert("로그인후 이용해주세요.");
			location.href='/';
			return false;
		} else {
			//location.href='/board/write';
			gfnOpenPop('/board/write', '등록', '780', '550');
			return false;
		}
	
	return false;
}
function fncView(idx) {
	 if('<%=session.getAttribute("LOGIN_ID")%>' == "null") {
			alert("로그인후 이용해주세요.");
			location.href = '/';
			return false;
		
	 }else {
			gfnOpenPop('/board/read?bno=' + idx, '상세보기', '780', '550');
			return false;
		}

		return false;
	}
	
$(function(){
	//perPageNum select 박스 설정
	setPerPageNumSelect();
	//searchType select 박스 설정
	setSearchTypeSelect();
	
	/* //등록, 삭제 후 문구 처리
	var result = '${result}';
	$(function(){
		if(result === 'registerOK'){
			$('#registerOK').removeClass('hidden');
			$('#registerOK').fadeOut(2000);
		}
		if(result === 'removeOK'){
			$('#removeOK').removeClass('hidden');
			$('#removeOK').fadeOut(2000);
		}
	}) */
	
	//prev 버튼 활성화, 비활성화 처리
	var canPrev = '${pageMaker.prev}';
	if(canPrev !== 'true'){
		$('#page-prev').addClass('disabled');
	}
	
	//next 버튼 활성화, 비활성화 처리
	var canNext = '${pageMaker.next}';
	if(canNext !== 'true'){
		$('#page-next').addClass('disabled');
	}
	
	//현재 페이지 파란색으로 활성화
	var thisPage = '${pageMaker.cri.page}';
	//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
	$('#page'+thisPage).addClass('active');
})

function setPerPageNumSelect(){
	var perPageNum = '${pageMaker.cri.perPageNum}';
	var $perPageSel = $('#perPageSel');
	var thisPage = '${pageMaker.cri.page}';
	
	$perPageSel.val(perPageNum).prop("selected",true);
	$perPageSel.on('change',function(){
		window.location.href = "="+thisPage+"&perPageNum="+$perPageSel.val();
	})
}
function setSearchTypeSelect(){
	var $searchTypeSel = $('#searchTypeSel');
	var $keyword = $('#keyword');
	
	$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected",true);
	//검색 버튼이 눌리면
	$('#searchBtn').on('click',function(){
		var searchTypeVal = $searchTypeSel.val();
		var keywordVal = $keyword.val();
		//검색 조건 입력 안했으면 경고창 
		if(!searchTypeVal){
			alert("검색 조건을 선택하세요!");
			$searchTypeSel.focus();
			return;
		//검색어 입력 안했으면 검색창
		}else if(!keywordVal){
			alert("검색어를 입력하세요!");
			$('#keyword').focus();
			return;
		}
		var url = "?page=1"
			+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
			+ "&searchType=" + searchTypeVal
			+ "&keyword=" + encodeURIComponent(keywordVal);
		window.location.href = url;
	})
}
</script>

</body>

</html>
</html>