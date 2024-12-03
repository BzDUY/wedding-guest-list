<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />"
	rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-3.6.4.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
<link href="<c:url value='/resources/bootstrap/css/styles.css' />"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Error 404 - Page Not Found</title>
<style>
body {
	background-color: #f8f9fa;
	color: #333;
	font-family: 'Arial', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
}

.error-container {
	text-align: center;
}

.error-container h1 {
	font-size: 120px;
	margin: 0;
	color: #dc3545;
}

.error-container h2 {
	font-size: 36px;
	margin: 10px 0;
	color: #6c757d;
}

.error-container p {
	font-size: 18px;
	color: #6c757d;
}

.btn-home {
	margin-top: 20px;
	font-size: 16px;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	text-decoration: none;
}

.btn-home:hover {
	background-color: #0056b3;
	color: white;
}

.image-container img {
	max-width: 100%;
	height: auto;
	margin: 20px 0;
}
</style>
</head>
<body>
	<a href="${pageContext.request.contextPath}" class="btn btn-secondary">Trang
		Chủ</a>
	<h1>404</h1>
	<div class="error-container">

		<h2>Oops! Page Not Found</h2>
		<div class="image-container">
			<img src="<c:url value='/resources/bootstrap/images/404.png' />"
				alt="404 Error">
		</div>
		<p>We're sorry, but the page you are looking for doesn't exist or
			has been moved.</p>
	</div>
</body>
</html>
