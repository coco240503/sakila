<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Montserrat:ital@0;1&display=swap');
	*{
	  font-family: "Gowun Dodum", sans-serif;
	  font-weight: 400;
	  font-style: normal;
	 }
</style>

<div class="list-group text-center bg-light">
  <a href="${pageContext.request.contextPath}/on/main" class="list-group-item list-group-item-action bg-light fw-bold">홈으로</a>
  <a href="${pageContext.request.contextPath}/on/staffOne" class="list-group-item list-group-item-action bg-light fw-bold">${loginStaff.username}님</a>
  <a href="${pageContext.request.contextPath}/on/logout" class="list-group-item list-group-item-action bg-light">로그아웃</a>
  
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light fw-bold">::지점 관리::</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">지점 추가</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">지점 수정</a>
  
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light fw-bold">::STAFF 관리::</a>
  <a href="${pageContext.request.contextPath}/on/staffList" class="list-group-item list-group-item-action bg-light">STAFF List</a>
  <a href="${pageContext.request.contextPath}/on/addStaff" class="list-group-item list-group-item-action bg-light">STAFF 추가</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">STAFF 수정</a>
  
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light fw-bold">::고객 관리::</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">고객</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">고객</a>
  
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light fw-bold">::배우 관리::</a>
  <a href="${pageContext.request.contextPath}/on/actorList" class="list-group-item list-group-item-action bg-light fw-bold">배우 리스트</a>
  <a href="${pageContext.request.contextPath}/on/addActor" class="list-group-item list-group-item-action bg-light fw-bold">배우 추가</a>
</div>