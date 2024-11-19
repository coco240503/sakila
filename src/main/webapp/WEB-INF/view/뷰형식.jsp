<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 아이콘 Font Awesom -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- add 폼 스타일 -->
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
				<h1>ADD  <i class="fa-solid fa-globe"></i></h1>
				<span> 추가</span>
			</div>
			<br>
			
	<!--  	</div>
	</div>  -->
			
			<!-- add 폼 -->
			<div style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; width: 80%;">
				<form id="formAdd" action="${pageContext.request.contextPath}/on/add" method="post">
					<label>Address Id</label> 
						<input type="text" id="addressId" name="addressId"><br>
					
					<label>Store Id</label> 
						<select name="storeId" id="storeId">
								<option value="">:::선택:::</option>
								<c:forEach var="s" items="${storeList}">
									<option value="${s.storeId}">${s.storeId}</option>
								</c:forEach>
						</select><br>
						
					<label>First Name</label> 
						<input type="text" name="firstName" id="firstName"><br>
					<label>Last Name</label> 
						<input type="text" name="lastName" id="lastName"><br>
					<label>Email</label> 
						<input type="text" name="email" id="email"><br>
					<label>User Name</label> 
						<input type="text" name="username" id="username"><br>
					<label>Password</label> 
						<input type="password" name="password" id="password">
						
					<div class="d-grid gap-2 col-6 mx-auto">
						<button id="btnAdd" type="button" class="btn btn-outline-primary">추가</button>
					</div>
				</form>
			</div>
			
			<!-- 페이징 -->
			<nav style="width: 100%; text-align: center;">
				<ul class="pagination pagination-lg justify-content-start" style="margin-right: 20%;">
					<c:if test="${currentPage > 10}">
						<li class="page-item"> <!-- 이전 10 페이지 -->
							<a class="page-link" href="${pageContext.request.contextPath}/on/~List?currentPage=${currentPage-10}"> 
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
								<a class="page-link" href="${pageContext.request.contextPath}/on/~List?currentPage=${num}">${num}</a>
							</li>
						</c:if>
					</c:forEach>
					
					<c:if test="${currentPage + 10 <= lastPage}">
					    <li class="page-item"> <!-- 다음 10 페이지 -->
					        <a class="page-link" href="${pageContext.request.contextPath}/on/~List?currentPage=${currentPage + 10}" aria-label="Next">
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