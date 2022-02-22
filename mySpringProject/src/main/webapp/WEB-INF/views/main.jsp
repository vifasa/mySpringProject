<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQurry -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stlesheet" href="css/main.css">
</head>
<body>
<div id="main_box" style="">
	<div id="header">
		<%@include file="layout/header.jsp" %>
	</div>
	
	<c:if test="${ page eq 'board_list_main' }">
		<h3 style="text-align: center;">최근 개시물</h3>
		<div id="main">
			<%@include file="layout/board/board_list_main.jsp" %>
		</div>
	</c:if>
	
	<c:if test="${ page eq 'board_list' }">
		<div id="main">
			<%@include file="layout/board/board_list.jsp" %>
		</div>
	</c:if>

	<c:if test="${ page eq 'board_insert' }">
		<div id="main">
			<%@include file="layout/board/board_insert_form.jsp" %>
		</div>
	</c:if>
	
	<c:if test="${ page eq 'board_view' }">
		<div id="main">
			<%@include file="layout/board/board_view.jsp" %>
		</div>
	</c:if>
	
	<c:if test="${ page eq 'board_modify_form' }">
		<div id="main">
			<%@include file="layout/board/board_modify_form.jsp" %>
		</div>
	</c:if>

	<c:if test="${ page eq 'category_serch' }">
		<div id="main">
			<%@include file="layout/category/category_list.jsp" %>
		</div>
	</c:if>
	
	<c:if test="${ page eq 'category_insert' }">
		<div id="main">
			<%@include file="layout/category/category_insert_form.jsp" %>
		</div>
	</c:if>
	
	<c:if test="${ page eq 'member_modify_form' }">
		<div id="main">
			<%@include file="member/member_modify_form.jsp" %>
		</div>
	</c:if>
	

	<hr>
	
	<div id="footer">
		<%@include file="layout/footer.jsp" %>
	</div>
</div>	


</body>
</html>