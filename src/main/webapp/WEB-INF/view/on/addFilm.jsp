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
				<h1>ADD FILM <i class="fa-solid fa-clapperboard"></i></h1>
				<span>영화 추가</span>
			</div>
			<br>
			<div style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; width: 80%;">
				<form id="formAddFilm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/on/addFilm"">
					<table>
						<tr>
							<td colspan="2" class="fw-bold">필수 항목</td>
						</tr>
						<tr>
							<td>Title</td>
							<td><input type="text" id="title" name="title"></td>
						</tr>
						<tr>
							<td>Language</td>
							<td><select id="languageId" name="languageId">
									<option value="">언어</option>
									<c:forEach var="la" items="${languageList}">
										<option value="${la.languageId}">${la.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>Rental Duration</td>
							<td><input type="number" id="rentalDuration" name="rentalDuration" value="3">일</td>
						</tr>
						<tr>
							<td>Rental Rate($)</td>
							<td><input type="number" id="rentalRate" name="rentalRate" value="4.99"></td>
						</tr>
						<tr>
							<td>Replacement Cost($)</td>
							<td><input type="number" id="replacementCost" name="replacementCost" value="19.99"></td>
						</tr>
						<tr>
							<td>Rating</td>
							<td>
								<input type="radio" name="rating" class="rating" value="G">G
								<input type="radio" name="rating" class="rating" value="PG">PG
								<input type="radio" name="rating" class="rating" value="PG-13">PG-13
								<input type="radio" name="rating" class="rating" value="R">R
								<input type="radio" name="rating" class="rating" value="NC-17">NC-17
							</td>
						</tr>
						
						<tr>
							<td colspan="2" class="fw-bold"><br>선택적 항목</td>
						</tr>
						<tr>
							<td>Length</td>
							<td><input type="number" id="length" name="length">분</td>
						</tr>
						<tr>
							<td>Original Language</td>
							<td>
								<select id="originalLanguageId" name="originalLanguageId">
									<option value="">original 언어</option>
									<c:forEach var="la" items="${languageList}">
										<option value="${la.languageId}">${la.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>Release Year</td>
							<td>
								<input type="number" id="releaseYear" name="releaseYear">
							</td>
						</tr>
						<tr>
							<td>Special Features</td>
							<td>
								<input type="checkbox" name="specialFeatures" class="specialFeatures"
									value="Trailers">Trailers
								<input type="checkbox" name="specialFeatures" class="specialFeatures"
									value="Commentaries">Commentaries
								<input type="checkbox" name="specialFeatures" class="specialFeatures"
									value="Deleted Scenes">Deleted Scenes
								<input type="checkbox" name="specialFeatures" class="specialFeatures"
									value="Behind the Scenes">Behind the Scenes
							</td>
						</tr>
						<tr>
							<td>Description</td>
							<td>
								<textarea rows="3" cols="50" id="description" name="description"></textarea>
							</td>
						</tr>
					</table>
					<div class="d-grid gap-2 col-6 mx-auto">
						<button id="btnAddFilm" type="button" class="btn btn-outline-primary">영화 추가</button>
					</div>
				</form>
			</div>
		</div>
	</div>			
</body>
<script>
	$('#btnAddFilm').click(function(){
		// 폼 유효성 검사(description,releaseYear,originalLanguageId,length,specialFeatures 제외)
		if($('#title').val()==''){
			alert('Title을 입력하세요');
		} else if($('#languageId').val()==''){
			alert('언어를 선택하세요');
		} else if($.isNumeric($('#rentalDuration').val()) == false){
			alert('Rental Duration을 입력하세요');
		} else if($.isNumeric($('#rentalRate').val()) == false){
			alert('Rental Rate를 입력하세요');
		} else if($.isNumeric($('#replacementCost').val()) == false){
			alert('Replacement Cost을 입력하세요');
		} else if($('.rating:checked').length == 0){
			alert('Rating을 선택하세요');
		} else { // 검증 통과 -> 폼 제줄
			$('#formAddFilm').submit();
			alert('영화 추가가 완료되었습니다');
		}
	})
</script>
</html>