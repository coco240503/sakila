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
	input[type=date], 
	input#inventoryId, input#staffId, input#customerId {
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
				<h1>ADD RENTAL <i class="fa-solid fa-compact-disc"></i></h1>
				<span>대여</span>
			</div>
			<br>
			
			<div style="border-radius: 5px; background-color: #f2f2f2; padding: 20px; width: 80%;">
				<label>Customer Id</label> 
					<form id="formSearchName" action="${pageContext.request.contextPath}/on/addRental" method="get">
						<i class="fa-solid fa-magnifying-glass"></i> &nbsp;<input type="hidden" name="inventoryId" value="${inventoryId}">
						<input type="text" name="searchName" id="searchName">
						<button type="button" id="btnSearchName" class="btn btn-outline-primary">이름 검색</button>
					</form>
			
				<form id="formAddRental" action="${pageContext.request.contextPath}/on/addRental" method="post">
					<select id="resultCustomerId" name="customerId" size="5" style="width:80%;">
							<c:forEach var="c" items="${customerList}">
								<option value="${c.customerId}">
									&nbsp;${c.email}
								</option>
							</c:forEach>
					</select>
					<button id="btnSelectCustomer" type="button" class="btn btn-outline-primary">선택</button><br>
						<input type="text" id="customerId" name="customerId">
					
					<label>Inventory Id</label> 
						<input type="text" id="inventoryId" name="inventoryId" value="${inventoryId}" readonly><br>
		
					<label>Staff Id</label> 
						<input type="text" id="staffId" name="staffId" value="${loginStaff.staffId}" readonly><br><!-- loginController의 session -->
					
					<label>Rental Date</label> 
						<input type="date" id="rentalDate" name="rentalDate"><br>
					
					<div class="d-grid gap-2 col-6 mx-auto">
						<button id="btnAddRental" type="button" class="btn btn-outline-primary">대여</button>
					</div>
				</form>
			</div>
			
		</div>
	</div>
</body>
<script>
	// 고객 이름 검색 버튼
	$('#btnSearchName').click(function(){
		if($('#searchName').val() == '' || $('#searchName').val() == null) {
			alert('검색할 이름을 입력하세요');
		} else {
			$('#formSearchName').submit();
		}
	});

	// 고객 이름 검색 결과 선택 버튼
	$('#btnSelectCustomer').click(function() {
		let result = $('#resultCustomerId option:selected').val();
		console.log("선택된 이름 result: ",result);
		
		if(result == null || result == '') {
			alert('이름을 선택하세요');
		} else {
			$('#customerId').val(result); // 이름을 선택하면 customerId가 자동 입력
		}
	})
	
	// 렌탈 추가 폼 제출
	$('#btnAddRental').click(function(){
		if($('#customerId').val() == null) {
			alert('고객 ID를 입력하세요');
		} else if($('#rentalDate').val() == '') {
			alert('대여 날짜를 입력하세요');
		} else {
			$('#formAddRental').submit();
		}
	});
</script>
</html>