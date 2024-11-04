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
			<h1>ADD STAFF</h1>
			
			<h3>주소 검색</h3>
			<form id="formAddress" action="${pageContext.request.contextPath}/on/addStaff" method="get">
				<input id="searchAddress" type="text" name="searchAddress">
				<button type="button" id="btnAddress">주소 검색</button>
			</form>
			
			<div>
				<h4>주소를 선택하세요</h4>
				<select id="resultAddress" size="10">
					<c:forEach var="a" items="${addressList}">
						<option value="${a.addressId}">[ID: ${a.addressId}] ${a.address}</option>
					</c:forEach>
				</select>
				<br>
				<button type="button" id="btnAddrSel">주소 선택</button>
			</div>
			
			<h4>입력 폼</h4>
			<form id="addForm" action="${pageContext.request.contextPath}/on/addStaff" method="post">
				<table class="table" style="width:80%">
					<tr>
						<td>Store Id</td>
						<td>
							<select name="storeId" id="storeId">
								<option value="">:::선택:::</option>
								<c:forEach var="s" items="${storeList}">
									<option value="${s.storeId}">${s.storeId}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>Address Id</td>
						<td>
							<input type="text" name="addressId" id="addressId" readonly>
						</td>
					</tr>
					<tr>
						<td>Fisrt Name</td>
						<td><input type="text" name="firstName" id="firstName"></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="lastName" id="lastName"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="email" name="email" id="email"></td>
					</tr>
					<tr>
						<td>User Name</td>
						<td><input type="text" name="userName" id="userName"></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" id="password"></td>
					</tr>
				</table>
				<button id="btnAddStaff" type="button">Staff 추가</button>
			</form>
		</div>
	</div>
</body>
<script>
	// action submit button
	$('#btnAddStaff').click(function(){
		// 입력폼 유효성 검사
		console.log($('#storeId').val(),$('#firstName').val(),$('#lastName').val());
		if($('#storeId').val()=='' || $('#storeId').val()==null){
			alert('Store Id를 입력하세요');
		} else if($('#firstName').val()=='' || $('#firstName').val()==null){
			alert('FirstName을 입력하세요');
		} else if($('#lastName').val()=='' || $('#lastName').val()==null){
			alert('LastName를 입력하세요');
		} else if($('#email').val()=='' || $('#email').val()==null){
			alert('Email을 입력하세요');
		} else if($('#userName').val()=='' || $('#userName').val()==null){
			alert('userName을 입력하세요');
		} else if($('#password').val()=='' || $('#password').val()==null){
			alert('Password를 입력하세요');
		} else{
			console.log('submit...')
			$('#addForm').submit();
		}
	});
	// 주소 선택 button
	$('#btnAddrSel').click(function(){
		console.log($('#resultAddress').val());
		if($('#resultAddress').val()=='' || $('#resultAddress').val()==null){
			alert('주소를 선택하세요');
		} else{
			$('#addressId').val($('#resultAddress').val());
		}
	});
	// 주소 검색 button
	$('#btnAddress').click(function(){
		if($('#searchAddress').val() == ""){
			alert('검색어를 입력하세요');
		} else{
			console.log("검색어: " +  $('#searchAddress').val());
			$('#formAddress').submit();
		}
	});
</script>

</html>