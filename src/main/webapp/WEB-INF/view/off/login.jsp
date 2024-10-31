<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body class="container">
	<h1>Staff Login</h1>
	<span>${msg}</span>

	<form action="${pageContext.request.contextPath}/off/login" method="post">
		<div class="mb-3 mt-3">
			<label for="staffId" class="form-label">staffId:</label>
			<input type="text" class="form-control" id="staffId" name="staffId">
	 	</div>
	 	<div class="mb-3">
			<label for="password" class="form-label">password:</label>
			<input type="password" class="form-control" id="password" name="password">
		</div>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
</body>
</html>