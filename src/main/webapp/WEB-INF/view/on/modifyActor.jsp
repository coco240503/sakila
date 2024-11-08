<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMune.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<div class="two">
				<h1>MODIFY ACTOR <i class="fa-solid fa-id-card-clip"></i></h1>
				<span>배우 정보 수정</span>
			</div>
			<br>
			<table class="table">
				<tr>
					<td>First Name</td>
					<td>
						<form id="formFirstName" action="${pageContext.request.contextPath}/on/modifyActor" method="post">
							<input type="hidden" name="actorId" value="${actor.actorId}">
							<input type="text" name="firstName" id="firstName" value="${actor.firstName}">
							<button type="button" id="btnFirstName">수정</button>
						</form>
					</td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td>
						<form id="formLastName" action="${pageContext.request.contextPath}/on/modifyActor" method="post">
							<input type="hidden" name="actorId" value="${actor.actorId}">
							<input type="text" name="lastName" id="lastName" value="${actor.lastName}">
							<button type="button" id="btnLastName">수정</button>
						</form>
					</td>
				</tr>
			</table>
			
			
		</div>
		
	</div>
</body>
<script>
	$('#btnFirstName').click(function(){
		if($('#firstName').val() == ''){
			alert('수정할 First Name을 입력하세요')
		} else{
			$('#formFirstName').submit();
		}
	})
	$('#btnLastName').click(function(){
		if($('#lastName').val() == ''){
			alert('수정할 Last Name을 입력하세요')
		} else{
			$('#formLastName').submit();
		}
	})

</script>
</html>