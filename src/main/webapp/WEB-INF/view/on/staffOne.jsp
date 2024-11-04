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
        /* 공통 테이블 스타일 */
        .table-custom {
            width: 800px; 
            margin-top: 15px;
            border-collapse: collapse;
            text-align: left;
            font-size: 0.9rem;
        }

        /* 테이블 셀 스타일 */
        .table-custom th, .table-custom td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .table-custom th {
            background-color: #f8f9fa;
            font-weight: bold;
        }
        /* 열 너비*/
        .col-20 { width: 20%; }
        .col-80 { width: 80%; }
    </style>

</head>
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2">
			<!-- leftMune.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="container mt-3 col-sm-10">
			<!-- main content -->
			<h2>${staff.firstName} ${staff.lastName}님</h2>
			<br>
			<h4>나의 정보</h4>
			<table class="table-custom">
				<colgroup>
			        <col class="col-20">
			        <col class="col-80">
			    </colgroup>
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
			
			<h4>Store</h4>
			<table class="table-custom">
				<colgroup>
			        <col class="col-20">
			        <col class="col-80">
			    </colgroup>
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
			
			<h4>Manager</h4>
			<table class="table-custom">
				<colgroup>
			        <col class="col-20">
			        <col class="col-80">
			    </colgroup>
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