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
				<h1>ADD STORE <i class="fa-solid fa-shop"></i></h1>
				<span>지점 추가</span>
			</div>
			<br>
			<div style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; width: 80%;">
				<form id="formAddStore" action="${pageContext.request.contextPath}/on/addStore" method="post">
					<table class="table" style="background-color: #f2f2f2; width: 80%;">
						<tr>
							<td>Manager Staff Id</td>
							<td>
								<select name="managerStaffId" id="managerStaffId">
									<option value="">:::선택:::</option>
									<c:forEach var="sl" items="${staffList}">
										<option value="${sl.staffId}">${sl.staffId}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>Address Id</td>
							<td><input type="number" id="addressId" name="addressId"></td>
						</tr>
					</table>
					<div class="d-grid gap-2 col-6 mx-auto">
						<button id="btnAddStore" type="button" class="btn btn-outline-primary">Store 추가</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnAddStore').click(function(){
		// 유효성 검사
		if($('#managerStaffId').val() == ""){
			alert('Manager Staff Id를 입력하세요');
		} else if($('#addressId').val() == ""){
			alert('Address Id를 입력하세요');
		} else { // 모두 통과하면 폼 제출
			$('#formAddStore').submit();
		}
	});
</script>
</html>