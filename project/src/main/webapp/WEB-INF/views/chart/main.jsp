<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />
<script src="/js/main/util.js" type="text/javascript"></script>

<script src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

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
        
        
<div >
<table>
	<tr>
		<td style="border:aliceblue; padding:0px;"> <select name="YEAR" id="YEAR" title="년도" class="select w80" onchange="javascript:viewChart(this)"></select> 
		</td>
	</tr>
</table>
</div>

    <div id="container" style="min-width: 310px; height: 400px;  margin-top: 10px"></div>
    <br>
    <br>
	 <div id="container2" style="min-width: 310px; height: 400px;"></div>
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
    $(document).ready(function(){ //홈페이지 로딩 시 호출
        var dt = new Date();	// date 객체생성?
        var pre_year = dt.getFullYear(); // 현재 년도 -> 변수에 저장
        setDateBox(pre_year); // selectbox에 동적으로 년도 생성   현재년도 변수를 매개변수로 보내서    ? <현재년도< ? 로 생성 
        chartData(pre_year); // 위 차트 생성 매개변수 현재년도 
      	chartData2(pre_year);
    });    
 
    // select box 연도 , 월 표시
    function setDateBox(com_year){ // 매개변수 현재년도
        var year = "";
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-1); y <= (com_year); y++){
            $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
        $("#YEAR").val(com_year).prop("selected", true); //셀렉트박스에서 벨류 값이 현재년도 인것 셀렉트 */
	
    }
    
    function viewChart(year){
		chartData(year.value);
		chartData2(year.value);
    }
    
    function chartData2(com_year){ //기자재별 차트 생성 함수
    	 var pData = {};
    	 pData['year'] = com_year;
    	 getChartData2 = new Array();
    	 $.ajax({
    	      type : "post",
    	      url : "/chart2",
    	      data: pData,
    	      dataType: "json",
    	      success : function(jsonData){
    	    	  console.log(jsonData);
    	    	  $.each(jsonData, function(key,value){
    	    		  getChartData2.push(value);
    	    		  
    	    	  })
    
     	         var chartOption = {
     	         	    chart: {
     	         	        type: 'column'
     	         	    },
     	         	    title: {
     	         	        text: '기자재별 수리통계'
     	         	    },
     	         	    subtitle: {
     	         	        text: '(년)'
     	         	    },
     	         	    xAxis: {
     	         	        categories: [
     	         	            'Jan',
     	         	            'Feb',
     	         	            'Mar',
     	         	            'Apr',
     	         	            'May',
     	         	            'Jun',
     	         	            'Jul',
     	         	            'Aug',
     	         	            'Sep',
     	         	            'Oct',
     	         	            'Nov',
     	         	            'Dec'
     	         	        ],
     	         	        crosshair: true
     	         	    },
     	         	    yAxis: {
     	         	        min: 0,
     	         	        title: {
     	         	            text: '건수 (개)'
     	         	        }
     	         	    },
     	         	    tooltip: {
     	         	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
     	         	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
     	         	            '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
     	         	        footerFormat: '</table>',
     	         	        shared: true,
     	         	        useHTML: true
     	         	    },
     	         	    plotOptions: {
     	         	        column: {
     	         	            pointPadding: 0.2,
     	         	            borderWidth: 0
     	         	        }
     	         	    },
     	         	    series: getChartData2
     	         	}
     	   	
     	         Highcharts.chart('container2', chartOption);
     	      }
    	      
    	       
    	   
    	   }); 
    	 }
    	 
    	  function chartData(com_year){
    	    	/* alert(com_year+"ajax"); */
    	    	 var pData = {};
    	    	 pData['year'] = com_year; // 매개변수 담아서 전송
    	    	   
    	    	 $.ajax({
    	    	      type : "post",
    	    	      url : "/chart",
    	    	      data: pData,
    	    	      dataType: "json",
    	    	      success : function(response){
    	    	         /* alert(response) */
    	    	         var chartOption = {
    	    	         	    chart: {
    	    	         	        type: 'column'
    	    	         	    },
    	    	         	    title: {
    	    	         	        text: '부서별 수리 통계'
    	    	         	    },
    	    	         	    subtitle: {
    	    	         	        text: '(년)'
    	    	         	    },
    	    	         	    xAxis: {
    	    	         	        categories: [
    	    	         	            'Jan',
    	    	         	            'Feb',
    	    	         	            'Mar',
    	    	         	            'Apr',
    	    	         	            'May',
    	    	         	            'Jun',
    	    	         	            'Jul',
    	    	         	            'Aug',
    	    	         	            'Sep',
    	    	         	            'Oct',
    	    	         	            'Nov',
    	    	         	            'Dec'
    	    	         	        ],
    	    	         	        crosshair: true
    	    	         	    },
    	    	         	    yAxis: {
    	    	         	        min: 0,
    	    	         	        title: {
    	    	         	            text: '건수 (개)'
    	    	         	        }
    	    	         	    },
    	    	         	    tooltip: {
    	    	         	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    	    	         	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
    	    	         	            '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
    	    	         	        footerFormat: '</table>',
    	    	         	        shared: true,
    	    	         	        useHTML: true
    	    	         	    },
    	    	         	    plotOptions: {
    	    	         	        column: {
    	    	         	            pointPadding: 0.2,
    	    	         	            borderWidth: 0
    	    	         	        }
    	    	         	    },
    	    	         	    series: response
    	    	         	}
    	    	   	
    	    	         Highcharts.chart('container', chartOption);
    	    	      }
    	    	   
    	    	   }); 
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
    