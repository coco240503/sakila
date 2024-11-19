<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=undo"/>
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
			<div>
				<table class="table table-hover" style="width:80%">
					<tr>
						<td>Inventory Id</td>
						<td>(Film Id) Title <i class="fa-solid fa-link"></i></td>
						<td>Last Update</td>
						<td>Rental</td> <!-- 대여가능/대여-고객id,대여날짜 -->
						<td>Customer Id</td> <!-- 대여한 고객 -->
						<td>Delete</td>
					</tr>
					<c:forEach var="iv" items="${inventoryList}">
						<tr>
							<td>&nbsp; ${iv.inventoryId}</td>
							<td>
								(${iv.filmId}) <a href="${pageContext.request.contextPath}/on/filmOne?filmId=${iv.filmId}">
									${iv.title} </a>
							</td>
							<td>${iv.lastUpdate}</td>
							<td>${iv.rentalDate}</td>
							<td style="text-align: center;">
								<c:if test="${iv.customerId != null}">
									<a href="${pageContext.request.contextPath}/on/cutomerOne?customerId=${iv.customerId}">${iv.customerId}</a>
								</c:if>
								<c:if test="${iv.customerId == null}">
									<a href="${pageContext.request.contextPath}/on/addRental?inventoryId=${iv.inventoryId}">대여</a>
								</c:if>	
							</td>
							<td style="text-align: center;">
								<a href="${pageContext.request.contextPath}/on/removeInventoryByKey?inventoryId=${iv.inventoryId}&storeId=${storeId}">
								<i class="fa-solid fa-xmark"></i></a> <!-- 삭제 X 아이콘 -->
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- 페이징 -->
				<nav style="width: 100%; text-align: center;">
					<ul class="pagination pagination-lg justify-content-start" style="margin-right: 20%;">
						<c:if test="${currentPage > 10}">
							<li class="page-item"> <!-- 이전 10 페이지 -->
								<a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&urrentPage=${currentPage-10}"> 
								<span aria-hidden="true">&laquo;</span></a>
							</li>
						</c:if>
						<c:if test="${currentPage <= 10}"> <!-- 이전 10 페이지가 없으면 비활성화-->
							<li class="page-item disabled"> 
						      <span class="page-link">&laquo;</span>
						    </li>
						</c:if>
						
						<c:forEach var="num" begin="${startPagingNum}" end="${endPagingNum}">
							<c:if test="${num == currentPage}">
								<li class="page-item"><span class="page-link" style="font-weight:bold;">${num}</span></li>
							</c:if>
							<c:if test="${num != currentPage}">
								<li class="page-item">
									<a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${num}">${num}</a>
								</li>
							</c:if>
						</c:forEach>
						
						<c:if test="${currentPage + 10 <= lastPage}">
						    <li class="page-item"> <!-- 다음 10 페이지 -->
						        <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${currentPage + 10}" aria-label="Next">
						            <span aria-hidden="true">&raquo;</span>
						        </a>
						    </li>
						</c:if>
						<c:if test="${currentPage + 10 > lastPage}"> <!-- 다음 10 페이지가 없으면 비활성화-->
						    <li class="page-item disabled">
						        <span class="page-link">&raquo;</span>
						    </li>
						</c:if>
					</ul>
				</nav>
				
				<a href="${pageContext.request.contextPath}/on/addInventory?storeId=${storeId}"><i class="fa-solid fa-warehouse"></i> 인벤토리 추가</a>
			</div>
			<br>
			<div>
				<a href="${pageContext.request.contextPath}/on/storeList" class="material-symbols-outlined" style="font-size: 24px;">undo</a>
			</div>
		</div>
		
	</div>
</body>
</html>