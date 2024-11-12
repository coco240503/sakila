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
				<h1>MODIFY FILM <i class="fa-solid fa-clapperboard"></i></h1>
				<span>영화 수정</span>
			</div>
			<br>
			<table class="table table-hover" style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; width: 80%;">
				<tr>
					<td colspan="2" style="text-align: center;"><i class="fa-solid fa-clapperboard"></i>[ ${film.title} ]</td>
					<td>수정</td>
				</tr>
				<tr>
					<td>Title</td>
					<td>
						<form id="formTitle" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.title}" name="title" id="title"> 
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnTitle" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
				<tr>
					<td>Release Year</td>
					<td>
						<form id="formReLeaseYear" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="text" value="${film.releaseYear}" name="releaseYear" id="releaseYear"> 
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnReleaseYear" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
				<tr>
					<td>Length</td>
					<td>
						<form id="formLength" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="number" value="${film.length}" name="length" id="length"> 분
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnLength" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
				<tr>
					<td>Rating</td>
					<td>
						<form id="formRating" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<p style="color:Gray;">${film.rating}</p>
							<input type="radio" name="rating" class="rating" value="G">G
							<input type="radio" name="rating" class="rating" value="PG">PG
							<input type="radio" name="rating" class="rating" value="PG-13">PG-13
							<input type="radio" name="rating" class="rating" value="R">R
							<input type="radio" name="rating" class="rating" value="NC-17">NC-17 
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnRating" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
				<tr>
					<td>Description</td>
					<td>
						<form id="formDescription" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<textarea rows="3" cols="50" id="description" name="description">${film.description}</textarea>
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnDescription" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
				<tr>
					<td>Special Features</td>
					<td>
						<form id="formSpecialFeatures" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<p style="color:Gray;">${film.specialFeatures}</p>
							<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Trailers">Trailers
							<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Commentaries">Commentaries
							<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Deleted Scenes">Deleted Scenes
							<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Behind the Scenes">Behind the Scenes
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnSpecialFeatures" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
				
				<tr>
					<td colspan="3"></td>
				</tr>
				<tr>
					<td>Rental Duration</td>
					<td>
						<form id="formRentalDuration" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							<input type="number" value="${film.rentalDuration}" name="rentalDuration" id="rentalDuration"> 일
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnRentalDuration" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
				<tr>
					<td>Rental Rate</td>
					<td>
						<form id="formRentalRate" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							$ <input type="number" value="${film.rentalRate}" name="rentalRate" id="rentalRate"> 
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnRentalRate" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
				<tr>
					<td>Replacement Cost</td>
					<td>
						<form id="formReplacementCost" action="${pageContext.request.contextPath}/on/modifyFilm" method="post">
							<input type="hidden" name="filmId" value="${film.filmId}">
							$ <input type="number" value="${film.replacementCost}" name="replacementCost" id="replacementCost"> 
						</form>
					</td>
					<td><!-- 수정버튼 -->
						<button type="button" id="btnReplacementCost" class="btn btn-outline-primary"><i class="fa-regular fa-pen-to-square"></i></button>
					</td>
				</tr>
			</table>
			<br>
			<a href="javascript:history.back()" class="material-symbols-outlined" style="font-size: 24px;">undo</a>
		</div>
	</div>
</body>
<script>
	$('#btnTitle').click(function(){
		if($('#title').val() == '') {
			alert('수정할 title을 입력하세요');
		} else {
			$('#formTitle').submit();
		}
	});
	$('#btnLength').click(function(){
		if($('#length').val() == '') {
			alert('수정할 length를 입력하세요');
		} else {
			$('#formLength').submit();
		}
	});
	$('#btnReLeaseYear').click(function(){
		if($('#reLeaseYear').val() == '') {
			alert('수정할 ReLease Year를 입력하세요');
		} else {
			$('#formReLeaseYear').submit();
		}
	});
	$('#btnSpecialFeatures').click(function(){
		if($('#specialFeatures').val() == '') {
			alert('수정할 Special Features를 입력하세요');
		} else {
			$('#formSpecialFeatures').submit();
		}
	});
	$('#btnDescription').click(function(){
		if($('#description').val() == '') {
			alert('수정할 Description을 입력하세요');
		} else {
			$('#formDescription').submit();
		}
	});
	$('#btnRentalDuration').click(function(){
		if($('#rentalDuration').val() == '') {
			alert('수정할 Rental Duration을 입력하세요');
		} else {
			$('#formRentalDuration').submit();
		}
	});
	$('#btnRentalRate').click(function(){
		if($('#rentalRate').val() == '') {
			alert('수정할 Rental Rate를 입력하세요');
		} else {
			$('#formRentalRate').submit();
		}
	});
	$('#btnReplacementCost').click(function(){
		if($('#replacementCost').val() == '') {
			alert('수정할 Replacement Cost를 입력하세요');
		} else {
			$('#formReplacementCost').submit();
		}
	});
	$('#btnRating').click(function(){
		if($('#rating').val() == '') {
			alert('수정할 Rating을 입력하세요');
		} else {
			$('#formRating').submit();
		}
	});
</script>
</html>