<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />
<link rel="stylesheet" href="/css/board/content.css">
<link rel="stylesheet" href="/calendar/daterangepicker.css">
<script src="/js/main/util.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script src="/calendar/jquery-1.11.2.min.js"></script>
<script src="/calendar/moment.min.js"></script>
<script src="/calendar/jquery.daterangepicker.js"></script>
<script src="/calendar/demo.js"></script>


<%
	String userID = null;
	System.out.println(session.getAttribute("LOGIN_BELONG"));
	if (session.getAttribute("LOGIN_ID") != null) {
		userID = (String) session.getAttribute("LOGIN_ID");
	}
	
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
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
 
 <head>
<style>
{ .no-print, .no-print * { display: none !important; } }
</style>

  <!-- Custom fonts for this template-->
  <link href="../../css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin-2.min.css" rel="stylesheet">

<title>업무 보고서 출력</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/board/common.css">
<link rel="stylesheet" href="/css/board/default.css">
<link rel="stylesheet" href="/css/board/content.css">

<script type="text/javascript">

	var goPrints = function(title){
	 window.print();
	
	   };
   $(function()
			{
				$('a.show-option').click(function(evt)
				{
					evt.preventDefault();
					$(this).siblings('.options').slideToggle();
				});
			});
   

   function fncPrint() {
   	document.form.action='/board/print';
   	document.form.submit();
   }
 
   </script>
<!-- 프린트를 위해 따로 나눠준 자바스크립트 파일 -->
</head>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column" style="margin-top:-20px">

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

	
<div class="no-print">
	<div id="wrapper">
	<form>
		<span style="margin-left:150px;" class="button bt02"><input type="button" value="출력하기" onclick="goPrints(title);" /></span>
	</form>
		<form action="/print/date" method="post">
			<div class="demo" style="color:black; font-weight:bold">
				기간설정: <input type="text" id="date_range0" name="date_range0" size="40" value=""> 
				<button style="color:#FFFFFF; font-weight:bold"> 검색 </button>
				
			</div>
			
			
		</form>
		<form action="/board/print" method="post" name="form">
		<a href="#" type="submit" onclick="fncPrint();"><button style="color:#FFFFFF; font-weight:bold; margin-left:-600px;">초기화</button></a>
	    </form>
		
	</div>
</div>

<div id="printarea">

		<!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">현재 처리현황</h6>
            </div>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							
							<thead>
								
								<tr>
										<th>접수일자</th>
										<th>의뢰인</th>
										<th>의뢰 소속</th>
										<th>위치(호관-호실)</th>
										<th>실 구분</th>
										<th>연락처</th>
										<th>접수품목</th>
										<th>접수내용</th>
										<th>처리내용</th>
										<th>접수자</th>
										<th>완료일자</th>
										<th>처리자</th>
								</tr>
							</thead>
							<c:choose>
									<c:when test="${fn:length(boardList)-1 >= 0}">
										<c:forEach end="${fn:length(boardList)-1}" begin="0"
											varStatus="rowIndex">
							<tbody>
								<!-- Start: list_row -->
								<tr>
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
										<c:if test="${boardList[rowIndex.index].instrument == '9'}">기타</c:if>
										<c:if test="${boardList[rowIndex.index].instrument == '10'}">소프트웨어 인증</c:if>
										<c:if test="${boardList[rowIndex.index].instrument == '11'}">Net-class 관련</c:if>
										</td>
									
									<td>${boardList[rowIndex.index].content} </td>
									<td>${boardList[rowIndex.index].completeContent}</td>
									<td>${boardList[rowIndex.index].writer}</td>
									<td>${boardList[rowIndex.index].completeDate}</td>
									<td>${boardList[rowIndex.index].completeId}</td>
								</tr>
								</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="13">조회된 결과가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<!-- End: list_row -->
							</tbody>
						</table>
</div>

</div>
					</div>
				</div>






