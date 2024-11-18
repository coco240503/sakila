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
				<h1>STORE LIST <i class="fa-solid fa-shop"></i></h1>
				<span>지점 목록</span>
			</div>
			<br>
			<table class="table table-hover" style="width:80%">
				<tr>
					<td>storeId</td>
					<td>Manager Staff Id</td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach var="s" items="${storeList}">
					<tr>
						<td>&nbsp; ${s.storeId}</td>
						<td>${s.managerStaffId}</td>
						<td><a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${s.storeId}">인벤토리</a></td>
						<td><a href="${pageContext.request.contextPath}/on/addInventory?storeId=${s.storeId}">추가</a></td>
					</tr>
				</c:forEach>
			</table>
			&nbsp; <a href="${pageContext.request.contextPath}/on/addStore"><i class="fa-solid fa-house-chimney"></i> 지점 추가</a>
		</div>
	</div>
</body>
</html>