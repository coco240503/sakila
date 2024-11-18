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
	input#title, 
	input[type=number], 
	select {
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
				<h1>ADD INVENTORY <i class="fa-solid fa-shop"></i></h1>
				<span>인벤토리 추가</span>
			</div>
			<br>
			
			<div style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; width: 80%;">
				<label>Film Title</label>
					<form id="formSearchTitle" method="get" action="${pageContext.request.contextPath}/on/addInventory">
						<input type="hidden" name="storeId" value="${storeId}">
						<i class="fa-solid fa-magnifying-glass"></i> &nbsp;<input type="text" name="searchTitle">
						<button type="button" id="btnSearchTitle" class="btn btn-outline-primary">영화 제목 검색</button>
					</form>
				
				<form id="formAddInventory" method="post" action="${pageContext.request.contextPath}/on/addInventory">
					<select size="5" name="filmId" id="resultFilmId" style="width:80%;">
						<c:forEach var="f" items="${filmList}">
							<option value="${f.filmId}">${f.title}</option>
						</c:forEach>
					</select>
					<button id="btnSelectFilm" type="button" class="btn btn-outline-primary">영화 선택</button><br>
						<input type="text" id="title" name="title"><br>
					
					<label>Film Id</label>
						<input type="number" id="filmId" name="filmId"><br>
					
					<label>Store Id</label>
						<input type="number" name="storeId" value="${storeId}" readonly><br>
					
					<div class="d-grid gap-2 col-6 mx-auto">
						<button id="btnAddInventory" type="button" class="btn btn-outline-primary">인벤토리 추가</button>
					</div>	
				</form>
			</div>
			<br>
			<div>
				<a href="javascript:history.back()" class="material-symbols-outlined" style="font-size: 24px;">undo</a>
			</div>
		</div>
	</div>
</body>
<script>
	// 영화 검색 버튼
	$('#btnSearchTitle').click(function(){
		if($('#searchTitle').val()=='') {
			alert('검색할 영화 제목을 입력하세요');
		} else {
			$('#formSearchTitle').submit();
		}
	});
	
	// 영화 검색 결과 선택 버튼
	$('#btnSelectFilm').click(function() {
		if($('#resultFilmId').val() == '' || $('#resultFilmId').val() == null) {
			alert('영화 제목을 선택하세요');
		} else {
			$('#filmId').val($('#resultFilmId').val()); // 영화를 선택하면 filmId가 자동 입력
			$('#title').val($('#resultFilmId option:selected').text()); // 영화를 선택하면 제목이 자동 입력
		}
	})
	
	// 인벤토리 추가 폼 제출
	$('#btnAddInventory').click(function(){
		// consol.log($('#filmId').val());
		if($('#filmId').val() == null) {
			alert('영화 제목을 선택하세요');
		} else {
			$('#formAddInventory').submit();
		}
	});
</script>
</html>