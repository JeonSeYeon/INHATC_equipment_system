<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/includes/home.jsp" flush="true" />
<jsp:include page="/WEB-INF/views/includes/header.jsp" flush="true" />

<%
					request.setCharacterEncoding("utf-8");
					
					String id =request.getParameter("date-range0");
					
					
%>