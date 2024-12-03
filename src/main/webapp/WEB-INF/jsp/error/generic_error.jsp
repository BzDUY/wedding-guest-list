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
<title>Generic Error</title>
</head>
<body>
	<div class="error-container">
		<a href="${pageContext.request.contextPath}" class="btn btn-secondary">Trang
			Chủ</a>
		<h1>Generic Error</h1>
		<h2>Oops! maybe my code is stupid</h2>
		<div class="image-container">
			<img src="<c:url value='/resources/bootstrap/images/500.png' />"
				alt="404 Error">
		</div>
		<p>We're sorry, but the page you are looking for doesn't exist or
			has been moved.</p>
		<a href="<c:url value='/' />" class="btn-home">Back to Home</a>
	</div>
</body>
</html>