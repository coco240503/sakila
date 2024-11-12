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
		<div class="col-sm-2 bg-light">
			<!-- leftMune.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<div class="two">
				<h1>FILM LIST <i class="fa-solid fa-clapperboard"></i></h1>
				<span>영화 목록</span>
			</div>
			<br>
			<!-- 카테고리 선택 -->
			<form id="formCategory" action="${pageContext.request.contextPath}/on/filmList" method="get">
				<select name="categoryId" id="categoryId">
					<option value="0">전체</option>
					<c:forEach var="c" items="${categoryList}">
						<c:if test="${c.categoryId == currentCategoryId}">
							<option selected value="${c.categoryId}">${c.name}</option>
						</c:if>
						<c:if test="${c.categoryId != currentCategoryId}">
							<option value="${c.categoryId}">${c.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</form>
			
			<!-- filmList -->
			<table class="table table-hover">
				<tr>
					<td>Film Id</td>
					<td>Title <i class="fa-solid fa-link"></i></td>
					<td>Rating</td>
					<td>Length</td>
					<td>Release Year</td>
					<td>Rental Duration</td>
					<td>Rental Rate</td>
					<td>Replacement Cost</td>
				</tr>
				<c:forEach var="f" items="${filmList}">
					<tr>
						<td>${f.filmId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
								${f.title}
							</a>
						</td>
						<td>${f.rating}</td>
						<td style="text-align: center;">${f.length}</td>
						<td>${f.releaseYear}</td>
						<td style="text-align: center;">${f.rentalDuration}</td>
						<td style="text-align: center;">${f.rentalRate}</td>
						<td style="text-align: center;">${f.replacementCost}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>	
</body>
<script>
	$('#categoryId').change(function() {
		$('#formCategory').submit();
	});
</script>
</html>