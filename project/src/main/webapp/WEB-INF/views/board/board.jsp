<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../js/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../js/sb-admin-2.min.js"></script>


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
              <h6 class="m-0 font-weight-bold text-primary">현재 처리현황</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							
								
								<tr style="background: #2980b9;">
										<th>접수번호</th>
										<th>의뢰받은시간</th>
										<th>의뢰인</th>
										<th>의뢰자 소속</th>
										<th>의뢰자 구분</th>
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
									<td>${boardList[rowIndex.index].client_division}</td>
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
						<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="width:40px; margin-left:1020px;" onclick="fncWrite()">등록</button>
						</c:if> 
						
				<div class="form-inline">
						<select id="searchTypeSel" name="searchType">
							<option value="">검색조건</option>
							<option value="t">의뢰자 구분</option> 
							<option value="c">실구분</option>
							<!-- <option value="w">기계명</option> -->
							<option value="tc">의뢰인</option>
							<option value="lo">위치</option>
							<option value="all">현황</option>
						</select>
						<input class="form-control" type="text" id="keyword" name="keyword" 
							value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
						<button id="searchBtn" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">검색</button>
						
					</div>
						
						<div class="text-center" style="margin-left: 450px;">
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
function fncWrite() {
	 if('<%=session.getAttribute("LOGIN_ID")%>' == "null") {
			alert("로그인후 이용해주세요.");
			location.href='/';
			return false;
		} else {
			location.href='/board/write';
			//gfnOpenPop('/board/write', '등록', '780', '550');
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
			//gfnOpenPop('/board/read?bno=' + idx, '상세보기', '780', '550');
			location.href ='/board/read?bno=' + idx
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

</body>

</html>