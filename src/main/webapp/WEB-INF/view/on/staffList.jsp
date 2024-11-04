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
			<h2>STAFF LIST</h2>
			<table class="table" style="width:80%">
				<tr>
					<td>Staff Id</td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>Address Id</td>
					<td>Email</td>
					<td>Store Id</td>
					<td>User Name</td>
					<td>Last Update</td>
					<td>Active</td>
					<td>활성화</td>
				</tr>
				<c:forEach var='s' items="${staffList}">
					<tr>
						<td>${s.staffId}</td>
						<td>${s.firstName}</td>
						<td>${s.lastName}</td>
						<td>${s.addressId}</td>
						<td>${s.email}</td>
						<td>${s.storeId}</td>
						<td>${s.username}</td>
						<td>${s.lastUpdate}</td>
						<td>${s.active}</td>
						<td>
							<c:if test="${s.active==1}">
								<a href="${pageContext.request.contextPath}/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}" 
									class="btn btn-outline-danger">
								비활성화하기</a>
							</c:if> 
							<c:if test="${s.active==2}">
								<a href="${pageContext.request.contextPath}/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}" 
									class="btn btn-outline-primary">
								활성화하기</a>
							</c:if> 
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>