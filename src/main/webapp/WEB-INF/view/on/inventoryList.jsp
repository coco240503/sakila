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
				<h1>INVENTORY LIST <i class="fa-solid fa-warehouse"></i></h1>
				<span>인벤토리 리스트</span>
			</div>
			<br>
			<h3>${storeId} 지점</h3>
			<table class="table table-hover" style="width:80%">
				<tr>
					<td>Inventory Id</td>
					<td>Film Id</td>
					<td>Title <i class="fa-solid fa-link"></i></td>
					<td>Last Update</td>
				</tr>
				<c:forEach var="iv" items="${inventoryList}">
					<tr>
						<td>&nbsp; ${iv.inventoryId}</td>
						<td>${iv.filmId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${iv.filmId}">
								${iv.title} </a>
						</td>
						<td>${iv.lastUpdate}</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
		
	</div>
</body>
</html>