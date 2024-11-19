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
				<h1>CUSTOMER ONE <i class="fa-solid fa-user"></i></h1>
				<span>고객 상세정보</span>
			</div>
			<br>
			
			<h2>${customer.firstName} ${customer.lastName} 님</h2>
			<table class="table" style="width:80%">
				<tr>
					<td>Customer Id</td>
					<td>${customer.customerId}</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>${customer.email}</td>
				</tr>
				<tr>
					<td>Address(District)</td>
					<td>${customer.address} (${customer.district})</td>
				</tr>
				<tr>
					<td>Postal Code</td>
					<td>${customer.postalCode}</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td>${customer.phone}</td>
				</tr>
				<tr>
					<td>Create Date</td>
					<td>${customer.createDate}</td>
				</tr>
				<tr>
					<td>Last Update</td>
					<td>${customer.lastUpdate}</td>
				</tr>
			</table>
			
			<h3>대여 정보</h3>
	  	</div>
	</div>
</body>
</html>