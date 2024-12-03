<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<link
	href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-3.6.4.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<meta charset="UTF-8">
<title>Navbar Example</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">

			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="thongTinTiecCuoi/add">Add </a></li>
				<li class="nav-item"><a class="nav-link"
					href="thongTinTiecCuoi/add/list">List</a></li>
			</ul>
		</div>

	</nav>
	<h1 th:text="${message}">Nội dung mặc định</h1>
</body>
</html>