<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>ActorList</title>
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
				<h1>ACTOR LIST</h1>
				<span>배우 리스트</span>
			</div>
			<br>
			<table class="table table-hover" style="width:80%">
				<thead>
					<tr>
						<th>Actor ID</th>
						<th>Name <i class="fa-solid fa-link"></i></th>
					<tr>
				</thead>
				<c:forEach var="a" items="${actorList}">
					<tr>
						<td>&nbsp; ${a.actorId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
							 ${a.firstName} ${a.lastName}</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- 페이징 -->
			<nav>
				<ul class="pagination pagination-lg justify-content-center">
					<li class="page-item"> <!-- 처음 -->
						<a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=1" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span></a>
					</li>
					<c:if test="${currentPage > 1}"> <!-- 0 안보이게 -->
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage-1}">${currentPage-1}</a>
						</li>
					</c:if>
					<li class="page-item"><span class="page-link">${currentPage}</span></li>
					
					<c:if test="${currentPage < lastPage}">
						<li class="page-item">
							<a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage+1}">${currentPage+1}</a>
						</li>
					</c:if>
					<li class="page-item"><!-- 마지막 -->
						<a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${lastPage}" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span></a>
					</li>
				</ul>
			</nav>
			
			<form id="formSearch" action="${pageContext.request.contextPath}/on/actorList" method="get">
				<i class="fa-solid fa-magnifying-glass"></i> &nbsp;
				<input type="text" name="searchWord" id="searchWord">
				<button id="btnSearch" class="btn btn-outline-primary">이름 검색</button>
			</form>
		</div>
	</div>
</body>
<script>
	$('#btnSearch').click(function(){
		if($('#searchWord').val()==''){
			alert('검색어를 입력하세요');
			return;
		}
		$('#formSearch').submit();
	});
</script>
</html>