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
<style>
	input[type=text], select {
	  width: 100%;
	  padding: 8px 12px;
	  margin: 6px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	}
</style>
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
				<h1>Customer List <i class="fa-solid fa-user-plus"></i></h1>
				<span>고객 추가</span>
			</div>
			<br>
			<div style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; width: 80%;">
				<div>
					<label>주소 검색</label>
					<form id="formAddress" action="${pageContext.request.contextPath}/on/addCustomer" method="get">
						<input id="searchAddress" type="text" name="searchAddress">
						<button type="button" id="btnAddress" class="btn btn-outline-primary">주소 검색</button>
					</form>
					
					<lable>주소를 선택하세요</lable>
					<select id="resultAddress" size="5">
						<c:forEach var="a" items="${addressList}">
							<option value="${a.addressId}">[ID: ${a.addressId}] ${a.address}</option>
						</c:forEach>
					</select> <br>
					<button type="button" id="btnAddrSel" class="btn btn-outline-primary">주소 선택</button>
				</div>
				
				<div>
					<form id="formAddCustomer" action="${pageContext.request.contextPath}/on/addCustomer" method="post">
						<label for="addressId">Address Id</label> 
						<input type="text" id="addressId" name="addressId"><br>
					
						<label for="storeId">Store Id</label> 
						<select name="storeId" id="storeId">
							<option value="">:::선택:::</option>
							<c:forEach var="s" items="${storeList}">
								<option value="${s.storeId}">${s.storeId}</option>
							</c:forEach>
						</select><br>
						
						<label for="firstName">First Name</label> 
							<input type="text" name="firstName" id="firstName"><br>
						<label for="lastName">Last Name</label> 
							<input type="text" name="lastName" id="lastName"><br>
						<label for="email">Email</label> 
							<input type="text" name="email" id="email"><br>
						<div class="d-grid gap-2 col-6 mx-auto">
							<button id="btnAddCustomer" type="button" class="btn btn-outline-primary">고객 추가</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	// 고객 추가 폼 제출
	$('#btnAddCustomer').click(function() {
		// 입력폼 유효성 검사
		console.log($('#storeId').val(), $('#firstName').val(),
				$('#lastName').val());
		if ($('#storeId').val() == '' || $('#storeId').val() == null) {
			alert('Store Id를 입력하세요');
		} else if ($('#firstName').val() == '' || $('#firstName').val() == null) {
			alert('FirstName을 입력하세요');
		} else if ($('#lastName').val() == '' || $('#lastName').val() == null) {
			alert('LastName를 입력하세요');
		} else if ($('#email').val() == '' || $('#email').val() == null) {
			alert('Email을 입력하세요');
		} else {
			console.log('submit...')
			$('#formAddCustomer').submit();
		}
	});

	// 주소 선택 button
	$('#btnAddrSel').click(function() {
			console.log($('#resultAddress').val());
			if ($('#resultAddress').val() == '' || $('#resultAddress').val() == null) {
				alert('주소를 선택하세요');
			} else {
				$('#addressId').val($('#resultAddress').val());
			}
	});
	// 주소 검색 button
	$('#btnAddress').click(function(){
		if($('#searchAddress').val() == "") {
			alert('검색어를 입력하세요');
		} else {
			$('#formAddress').submit();
		}
	});

</script>
</html>