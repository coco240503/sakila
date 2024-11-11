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
				<h1>FILM ONE</h1>
				<span>영화 상세정보</span>
			</div>
			<br>
			<h2><i class="fa-solid fa-film"></i></h2>
			<table class="table">
				<tr>
					<td>Film Id</td>
					<td></td>
				</tr>
				<tr>
					<td>Title</td>
					<td></td>
				</tr>
				<tr>
					<td>Release Year</td>
					<td></td>
				</tr>
				<tr>
					<td>Language</td>
					<td></td>
				</tr>
				<tr>
					<td>Original Language</td>
					<td></td>
				</tr>
				<tr>
					<td>Length</td>
					<td></td>
				</tr>
				<tr>
					<td>Rating</td>
					<td></td>
				</tr>
				<tr>
					<td>Description</td>
					<td></td>
				</tr>
				<tr>
					<td>Special Features</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" class="fw-bold"></td>
				</tr>
				<tr>
					<td>Rental Duration</td>
					<td></td>
				</tr>
				<tr>
					<td>Rental Rate($)</td>
					<td></td>
				</tr>
				<tr>
					<td>Replacement Cost($)</td>
					<td></td>
				</tr>
				<tr>
					<td>Last Update</td>
					<td></td>
				</tr>
			</table>
			
			<div>
				<a href="${pageContext.request.contextPath}/on/">영화 수정</a>
				<a href="${pageContext.request.contextPath}/on/">영화 삭제</a>
			</div>
			<div>
				<h2>출연 배우들</h2>
				<div>
					<c:forEach var="a" items="${actorList}">
						<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">${a.firstName} ${a.lastName}</a>
					</c:forEach>
				</div>
			</div>
			
			<br>
			<a href="javascript:history.back()" class="material-symbols-outlined" style="font-size: 24px;">undo</a>
		</div>
	</div>
</body>
</html>
<!-- 
	film 상세
	film 수정 - on/modifyFilm 
	film 삭제 - on/removeFilm (inventory 렌탈정보 확인 + filmCatatory+filmActor+film 삭제)
 
 	filmCategory 리스트
 	filmCategory 추사 on/addFilmCategory -> 카테고리 전체 목록에서 선택
 	filmCategory 삭제 on/removeFilmCategory
 	
 	filmActor 리스트
 	filmActor 추가 on/addActorByFilm -> 배우 검색 후 선택
 	filmActor 삭제 on/removeFileActor
 	
 	inventory 정보
 -->