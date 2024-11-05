<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital@0;1&display=swap');
	*{
	  font-family: "Gowun Dodum", sans-serif;
	  font-weight: 400;
	  font-style: normal;
	 }
</style>

<div class="list-group text-center">
  <a href="${pageContext.request.contextPath}/on/main" class="list-group-item list-group-item-action bg-light fw-bold"><i class="fa-solid fa-house"></i></a>
  <a href="${pageContext.request.contextPath}/on/staffOne" class="list-group-item list-group-item-action bg-light fw-bold">${loginStaff.username}님</a>
  <a href="${pageContext.request.contextPath}/on/logout" class="list-group-item list-group-item-action">로그아웃</a>
  
  <a class="list-group-item list-group-item-action bg-light fw-bold">::지점 관리::</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action">지점 추가</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action">지점 수정</a>
  
  <a class="list-group-item list-group-item-action bg-light fw-bold">::STAFF 관리::</a>
  <a href="${pageContext.request.contextPath}/on/staffList" class="list-group-item list-group-item-action">STAFF List</a>
  <a href="${pageContext.request.contextPath}/on/addStaff" class="list-group-item list-group-item-action">STAFF 추가</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action">STAFF 수정</a>
  
  <a class="list-group-item list-group-item-action bg-light fw-bold">::고객 관리::</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action">고객</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action">고객</a>
  
  <a class="list-group-item list-group-item-action bg-light fw-bold">::배우 관리::</a>
  <a href="${pageContext.request.contextPath}/on/actorList" class="list-group-item list-group-item-action">배우 리스트</a>
  <a href="${pageContext.request.contextPath}/on/addActor" class="list-group-item list-group-item-action">배우 추가</a>
</div>
