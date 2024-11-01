<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="list-group text=center bg-light">
  <a href="${pageContext.request.contextPath}/on/main" class="list-group-item list-group-item-action bg-light">홈으로</a>
  <a href="${pageContext.request.contextPath}/on/staffOne" class="list-group-item list-group-item-action bg-light">${loginStaff.username}님</a>
  <a href="${pageContext.request.contextPath}/on/logout" class="list-group-item list-group-item-action bg-light">로그아웃</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light fw-bold">::지점 관리::</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">지점 추가</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">지점 수정</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light fw-bold">::STAFF 관리::</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">STAFF 추가</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">STAFF 수정</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light fw-bold">::고객 관리::</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">고객</a>
  <a href="${pageContext.request.contextPath}" class="list-group-item list-group-item-action bg-light">고객</a>
</div>