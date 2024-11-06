<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0&icon_names=undo"/>
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
				<h1>ACTOR ONE</h1>
				<span>배우 상세정보</span>
			</div>
			<br>
		
			<h2><i class="fa-solid fa-user"></i> ${actor.firstName} ${actor.lastName}</h2>
			<table class="table">
				<tr>
					<td>Actor Id</td>
					<td>${actor.actorId}</td>
				</tr>
				<tr>
					<td>Name</td>
					<td>${actor.firstName} ${actor.lastName}</td>
				</tr>
				<tr>
					<td>Last Update</td>
					<td>${actor.lastUpdate}</td>
				</tr>
			</table>
			<div>
				<a href=""><i class="fa-solid fa-user-pen"></i> actor 수정</a>
			</div>
			
			
			<h2><i class="fa-regular fa-image"></i> FILE</h2>
			<table class="table" style="text-align:center;">
				<tr >
					<td>Image</td>
					<td>Type</td>
					<td>Size</td>
					<td>Create Date</td>
					<td>DELETE</td>
				</tr>
				<c:forEach var="af" items="${actorFileList}">
					<td>
						<img src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}">
					</td>
					<td>${af.type}</td>
					<td>${af.size} Byte</td>
					<td>${af.createDate}</td>
					<td><a href="" class="fa-solid fa-trash"></a></td>
				</c:forEach>
			</table>
			<div>
				<a href=""><i class="fa-regular fa-image"></i> 이미지파일 추가</a>
			</div>
			
			<!-- FILM -->
			<h2><i class="fa-solid fa-film"></i> 출연 작품</h2>
			<div>
				<c:forEach var="f" items="${filmList}">
					<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">${f.title}</a>&nbsp;&nbsp;
				</c:forEach>
			</div>
			<br>
			 <a href="${pageContext.request.contextPath}/on/actorList" class="material-symbols-outlined" style="font-size: 24px;">undo</a>
		</div>
	</div>
</body>
</html>