<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title></title>

<style>
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
</style>
</head>
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2">
			<!-- leftMune.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
			
		<div class="col-sm-10">
			<!-- main content -->
			<div class="two">
				<h1>${staff.firstName} ${staff.lastName}님</h1>
				<span>Staff 정보<span>
			</div>
			<br>	
			
			<h2><i class="fa-solid fa-id-card-clip"></i> 나의 정보</h2>
			<table class="table" style="width:80%">
				<tr>
					<td>ID</td>
					<td>${staff.staffId}</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td>${staff.staffPhone}</td>
				</tr>
				<tr>
					<td>Address</td>
					<td>${staff.staffAddress}</td>
				</tr>
				<tr>
					<td>District</td>
					<td>${staff.staffDistrict}</td>
				</tr>
				<tr>
					<td>City</td>
					<td>${staff.staffCity}</td>
				</tr>
				<tr>
					<td>Country</td>
					<td>${staff.staffCountry}</td>
				</tr>
				<tr>
					<td>Post Code</td>
					<td>${staff.staffPostCode}</td>
				</tr>
			</table>
			
			<h2><i class="fa-solid fa-shop"></i> Store</h2>
			<table class="table" style="width:80%">
				<tr>
					<td>Store ID</td>
					<td>${staff.staffId}</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td>${staff.storePhone}</td>
				</tr>
				<tr>
					<td>Address</td>
					<td>${staff.storeAddress}</td>
				</tr>
				<tr>
					<td>City</td>
					<td>${staff.storeCity}</td>
				</tr>
				<tr>
					<td>Country</td>
					<td>${staff.storeCountry}</td>
				</tr>
				<tr>
					<td>Post Code</td>
					<td>${staff.storePostCode}</td>
				</tr>
			</table>
			
			<h2><i class="fa-solid fa-user"></i> Manager</h2>
			<table class="table" style="width:80%">
				<tr>
					<td>ID</td>
					<td>${staff.managerId}</td>
				</tr>
				<tr>
					<td>Name</td>
					<td>${staff.managerName}</td>
				</tr>
			</table>
			<br>
			<div>
				<a href="">비밀번호 수정</a><br>
				<a href="">이메일 수정</a><br>
				<a href="">주소 수정</a><br>
				<a href="">Store 수정</a>
			</div>
		</div>
	</div>
</body>
</html>