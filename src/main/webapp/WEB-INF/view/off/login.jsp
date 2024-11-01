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
<body class="container col-6">
	<h1>Staff Login</h1>
	<span>${msg}</span>

	<form id="form" action="${pageContext.request.contextPath}/off/login" method="post">
		<div class="mb-3 mt-3">
			<input id="staffId" name="staffId" type="text" class="form-control" placeholder="Staff Id">
	 	</div>
	 	<div class="mb-3">
			<input id="password" name="password" type="password" class="form-control" placeholder="Password">
		</div>
		<button id="btn" type="button" class="btn btn-primary">로그인</button>
	</form>
</body>

<script>
	// btn 버튼 클릭 시 폼값 유효성 검사 (Id: 숫자, Pw: 4자 이상)
	$('#btn').click(function(){
		console.log('click');
		 // 숫자가 아니면 isNaN() or $.isNumeric()
		if($.isNumeric($('#staffId').val()) == false){
			alert('Staff Id는 숫자만 입력 가능');
		} else if($('#password').val().length < 4){
			alert('Password는 4자 이상');
		} else {
			$('#form').submit();
		}
	});
</script>
</html>

