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
				<h1>FILM ONE <i class="fa-solid fa-clapperboard"></i></h1>
				<span>영화 상세정보</span>
			</div>
			<br>
			<h2><i class="fa-solid fa-clapperboard"></i> [ ${film.title} ]</h2>
			<table class="table" style="width:80%">
				<tr>
					<td>Film Id</td>
					<td>${film.filmId}</td>
				</tr>
				<tr>
					<td>Title</td>
					<td>${film.title}</td>
				</tr>
				<tr>
					<td>Category</td>
					<td>
						<c:forEach var="fc" items="${filmCategoryList}">
							${fc.name}
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>Release Year</td>
					<td>${film.releaseYear}</td>
				</tr>
				<tr>
					<td>Language</td>
					<td>${film.language}</td>
				</tr>
				<tr>
					<td>Original Language</td>
					<td>${film.originalLanguage}</td>
				</tr>
				<tr>
					<td>Length</td>
					<td>${film.length} 분</td>
				</tr>
				<tr>
					<td>Rating</td>
					<td>${film.rating}</td>
				</tr>
				<tr>
					<td>Description</td>
					<td>${film.description}</td>
				</tr>
				<tr>
					<td>Special Features</td>
					<td>${film.specialFeatures}</td>
				</tr>
				
				<tr>
					<td colspan="2" class="fw-bold"></td>
				</tr>
				<tr>
					<td>Rental Duration</td>
					<td>${film.rentalDuration} 일</td>
				</tr>
				<tr>
					<td>Rental Rate</td>
					<td>$ ${film.rentalRate}</td>
				</tr>
				<tr>
					<td>Replacement Cost</td>
					<td>$ ${film.replacementCost}</td>
				</tr>
				<tr>
					<td>Last Update</td>
					<td>${film.lastUpdate}</td>
				</tr>
			</table>
			
			<div>
				<a href="${pageContext.request.contextPath}/on/modifyFilm?filmId=${film.filmId}">
					<i class="fa-solid fa-pen-to-square"></i>영화 수정</a> &nbsp;
				<a href="${pageContext.request.contextPath}/on/removeFilm?filmId=${film.filmId}">
					<i class="fa-solid fa-trash-can"></i>영화 삭제</a>
				<span style="color:Tomato;">${removeFilmMsg}</span>
			</div>
			
			<br>
			<div>
				<!-- model.CategoryList -->
				<div>
					<h3>카테고리</h3>
					<table class="table" style="width:10%">
						<c:forEach var="fc" items="${filmCategoryList}">
							<tr>	
								<td>${fc.name}</td>
								<td>
									<a href="${pageContext.request.contextPath}/on/removeFilmCategory?filmId=${film.filmId}&categoryId=${fc.categoryId}">
									<i class="fa-solid fa-xmark"></i><!-- 삭제 X표 --></a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- 카테고리 추가 -->
				<form id="formFilmCategory" method="post" action="${pageContext.request.contextPath}/on/addFilmCategory">
					<input type="hidden" name="filmId" value="${film.filmId}">
					<select name="categoryId" id="categoryId">
						<option value="">카테고리 선택</option>
						<!-- model.allCategoryList -->
						<c:forEach var ="ac" items="${allCategoryList}">
							<option value="${ac.categoryId}">${ac.name}</option>
						</c:forEach>
					</select>
					<button id="btnFilmCategory" type="button" class="btn btn-outline-primary">카테고리 추가</button>
				</form>
			</div>
			<br>
			<div>
				<h3>출연 배우</h3>
				<c:forEach var="a" items="${actorList}">
					<div>
						<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">${a.firstName} ${a.lastName}</a>
						&nbsp;
						<a href="${pageContext.request.contextPath}/on/removeFilmActorByFilm?filmId=${film.filmId}&actorId=${a.actorId}">
						<i class="fa-solid fa-xmark"></i><!-- 삭제 X표 --></a>
					</div>
				</c:forEach>
				<!-- 배우 검색 -->
				<form id="formSearchName" method="get" action="${pageContext.request.contextPath}/on/filmOne">
					<input type="hidden" name="filmId" value="${film.filmId}">
					<input type="text" name="searchName">
					<button id="btnSearchName" type="button" class="btn btn-outline-primary">이름 검색</button>
				</form>

				<form id="formFilmActor" method="post" action="${pageContext.request.contextPath}/on/addFilmActorByFilm">
					<select name="actorId" id="actorId" size="5">
						<c:forEach var="sa" items="${searchActorList}">
							<option value="${sa.actorId}">${sa.firstName} ${sa.lastName}</option>
						</c:forEach>
					</select>
					<button id="btnFilmActor" type="button" class="btn btn-outline-primary">배우 추가</button>
				</form>
			</div>
			
			<br>
			<a href="javascript:history.back()" class="material-symbols-outlined" style="font-size: 24px;">undo</a>
		</div>
	</div>
</body>
<script>
	$('#btnFilmActor').click(function(){
		if($('#actorId').val() == '' || $('#actorId').val() == null){
			alert('배우를 선택하세요');
		} else{
			$('#formFilmActor').submit();
		}
	});

	$('#btnSearchName').click(function(){
		if($('#searchName').val() == ''){
			alert('이름을 입력하세요');
		} else{
			$('#formSearchName').submit();
		}
	});

	$('#btnFilmCategory').click(function(){
		if($('#categoryId').val() == ''){
			alert('category를 선택하세요');
		} else{
			$('#formFilmCategory').submit();
		}
	});

</script>
</html>