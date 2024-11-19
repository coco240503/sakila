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
				<h1>CUSTOMER LIST <i class="fa-solid fa-users"></i></h1>
				<span>고객 리스트</span>
			</div>
			<br>
			
			<table class="table table-hover" style="width:80%">
				<thead>
					<tr>
						<th>Customer Id</th>
						<th>Name <i class="fa-solid fa-link"></i></th>
						<th>Address Id</th>
						<th>Email</th>
						<th>Store Id</th>
						<th>Active</th>
						<th>Create Date</th>
						<th>Last Update</th>
					</tr>
				</thead>
				<c:forEach var='cl' items="${customerList}">
					<tr>
						<td>&nbsp;${cl.customerId}</td>
						<td><a href="${pageContext.request.contextPath}/on/customerOne?customerId=${cl.customerId}">${cl.firstName} ${cl.lastName}</a></td>
						<td>${cl.addressId}</td>
						<td>${cl.email}</td>
						<td>${cl.storeId}</td>
						<td>${cl.active}</td>
						<td>${cl.createDate}</td>
						<td>${cl.lastUpdate}</td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- 페이징 -->
			<nav style="width: 100%; text-align: center;">
				<ul class="pagination pagination-lg justify-content-start" style="margin-right: 20%;">
					<c:if test="${currentPage > 10}">
						<li class="page-item"> <!-- 이전 10 페이지 -->
							<a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage-10}"> 
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
								<a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${num}">${num}</a>
							</li>
						</c:if>
					</c:forEach>
					
					<c:if test="${currentPage + 10 <= lastPage}">
					    <li class="page-item"> <!-- 다음 10 페이지 -->
					        <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${currentPage + 10}" aria-label="Next">
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
			
		</div>
	</div>
</body>
</html>