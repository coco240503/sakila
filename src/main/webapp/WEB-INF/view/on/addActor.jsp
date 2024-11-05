<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style>
	.btn-custom {
      background-color: transparent; /* 배경색 제거 */
      border-color: #c5e1fc;         /* 테두리 색상 */
      color: #0059b8;                /* 텍스트 및 아이콘 색상 */
    }
    	.two h1 {
	  text-transform: capitalize;
	}
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
<meta charset="UTF-8">
<title>addActor</title>
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
				<h1>ADD ACTOR</h1>
				<span>배우 추가</span>
			</div>
			<br>
			<form id="formActor" method="post" action="${pageContext.request.contextPath}/on/addActor" enctype="multipart/form-data">
				<table class="table" style="width:80%">
					<tr>
						<td>First Name</td>
						<td><input type="text" name="firstName" id="firstName"></td>
					</tr>
					<tr>
						<td>Last Name</td>
						<td><input type="text" name="lastName" id="lastName"></td>
					</tr>
					<tr>
						<td>File</td>
						<td>
							<div id="fileDiv">
								<button type="button" id="btnAddFile" class="btn btn-custom"><i class="fa-regular fa-image fa-2x"></i></button>
								<button type="button" id="btnRemoveFile" class="btn btn-custom"><i class="fa-solid fa-trash fa-2x"></i></button>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="text-center"> <!-- colspan으로 두 열 병합, 가운데 정렬 -->
							<button type="button" id="btnAddActor" class="btn btn-outline-primary">배우 추가</button>
						</td>
					</tr>
				</table>
			</form>	
		</div>
	</div>
</body>
<script>
	// 배우 추가 버튼
	$('#btnAddActor').click(function(){
		if($('#firstName').val()=='' || $('#lastName').val()==''){
			alert('이름을 입력하세요');
		} else if($('.actorFile').length > 0 && $('.actorFile').last().val() == ''){
			alert('파일을 첨부하세요');
		} else{
			$('#formActor').submit();
		}
	});

	// 파일 추가 버튼
	$('#btnAddFile').click(function(){
		if($('.actorFile').last().val() == ''){ // 마지막 input_file값이 공백이라면
			alert('파일을 첨부하세요');
		} else{
			let html = '<input type="file" name="actorFile" class="form-control" style="width:40%;">';
			$('#fileDiv').append(html);
		}
	});
	
	// 파일 삭제 버튼
	$('#btnRemoveFile').click(function(){
		if($('.actorFile').length == 0){
			alert('삭제할 파일이 없습니다.');
		} else{
			// 마지막 <input> 태그 제거
			$('.actorFile').last().remove();
		}
	})
</script>
</html>