<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title></title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital@0;1&display=swap');
	*{
	  font-family: "Gowun Dodum", sans-serif;
	  font-weight: 400;
	  font-style: normal;
	 }
	.two h1 {
	  text-transform: capitalize;
	}
	.two h1:before {
	  position: absolute;
	  left: 0;
	  bottom: 0;
	  width: 60px;
	  height: 2px;
	  content: "";
	  background-color: #0059b8;
	}
	.two h1 span {
	  font-size: 13px;
	  font-weight: 500;
	  text-transform: uppercase;
	  letter-spacing: 4px;
	  line-height: 3em;
	  padding-left: 0.25em;
	  color: rgba(0, 0, 0, 0.4);
	  padding-bottom: 10px;
	}
	
	h1 {
	  position: relative;
	  padding: 0;
	  margin: 0;
	  font-family: "Raleway", sans-serif;
	  font-weight: 300;
	  font-size: 40px;
	  color: #080808;
	  -webkit-transition: all 0.4s ease 0s;
	  -o-transition: all 0.4s ease 0s;
	  transition: all 0.4s ease 0s;
	}
	
	h1 span {
	  display: block;
	  font-size: 0.5em;
	  line-height: 1.3;
	}
	input[type=text], select {
	  width: 100%;
	  padding: 8px 12px;
	  margin: 6px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	}
	input[type=password], select {
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
			<div class="two">
				<h1>ADD STAFF <i class="fa-solid fa-id-card-clip"></i></h1>
					<span>Staff 추가</span>
			</div>
			<br>
			<!-- main content -->
			<div style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; width: 80%;">
				<!-- 주소 폼-->
				<label>주소 검색</label>
					<form id="formAddress" action="${pageContext.request.contextPath}/on/addStaff" method="get">
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
				
				<!-- staff 추가 폼 -->
				<form id="addForm" action="${pageContext.request.contextPath}/on/addStaff" method="post">
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
					<label for="username">User Name</label> 
						<input type="text" name="username" id="username"><br>
					<label for="password">Password</label> 
						<input type="password" name="password" id="password">
					<div class="d-grid gap-2 col-6 mx-auto">
						<button id="btnAddStaff" type="button" class="btn btn-outline-primary">Staff 추가</button>
					</div>
				</form>
			</div>
			
		</div>
	</div>
</body>
<script>
	// staff 추가 폼 제출
	$('#btnAddStaff').click(function() {
			// 입력폼 유효성 검사
			console.log($('#storeId').val(), $('#firstName').val(),
					$('#lastName').val());
			if ($('#storeId').val() == ''
					|| $('#storeId').val() == null) {
				alert('Store Id를 입력하세요');
			} else if ($('#firstName').val() == ''
					|| $('#firstName').val() == null) {
				alert('FirstName을 입력하세요');
			} else if ($('#lastName').val() == ''
					|| $('#lastName').val() == null) {
				alert('LastName를 입력하세요');
			} else if ($('#email').val() == ''
					|| $('#email').val() == null) {
				alert('Email을 입력하세요');
			} else if ($('#username').val() == ''
					|| $('#username').val() == null) {
				alert('userName을 입력하세요');
			} else if ($('#password').val() == ''
					|| $('#password').val() == null) {
				alert('Password를 입력하세요');
			} else {
				console.log('submit...')
				$('#addForm').submit();
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