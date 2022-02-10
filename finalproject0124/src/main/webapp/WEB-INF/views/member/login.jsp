<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
  
<style>
	#findId {
		font-size: 13px;
		padding-left: 0%;
		margin-left: 45px;
	}
	#findPwd {
		font-size: 13px;
	}
	
	div .main {
		padding-top: 10%;
		margin-left: 35%;
	}
	div .button {
		padding-top: 1%;
		padding-left: 0%;	
	}
	div #login{
		margin-left: 25px;
		padding-left: 0%;
		margin-top: 1%;	
	}
	#saveId{
		font-size: 13px;
	}
	#stayLogin{
		font-size: 13px;
	}

	table tr td {	
		text-align: left;
	}
</style>

<div class="main">
	<form:form method="post" action="${cp }/login" onsubmit="return subm(this)" name="submitForm">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="username" id="username" value="${id }"><span style="color: red; padding-left: 10px; font-size: 15px;"><strong>${requestScope.LoginFailMessage }</strong></span></td>
			</tr>			
			<tr>
				<th>비밀번호</th>				
				<td><input type="password" name="password"></td>
			</tr>
		</table>
	<!-- 			<input type="submit" value="로그인" id="login"><br> -->		
		
	 <div class="form-check" id="login">
		<input type="checkbox" class="form-check-input" id="checkbox1" name="remember-me">
		<label class="form-check-label" for="checkbox1" style="width: 150px;" id="stayLogin">로그인 상태 유지</label>	      
	</div>
	<div>
		<input type="checkbox" class="form-check-input" id="checkbox2" name="checkbox2" value="1" >
		<label class="form-check-label" for="checkbox2" id="saveId">아이디 저장</label>
	</div>
	
	
	<div class="button">
		<button type="button" class="btn btn-primary" onclick="subm()" style="width: 200pt;">로그인</button><br>
	</div>
	</form:form>
		<input type="button" class="btn" id="findId" onclick="findId()" value="아이디 찾기">
		<input type="button" class="btn" id="findPwd" onclick="findPwd()" value="비밀번호 찾기">
</div>
<button type="button" id="test">test</button>

<script>
//  	$("#checkbox2").click(function(){
//  		if (document.getElementById("checkbox2").value) {
 			
//  		}
//  	});

	// 아이치 찾기 페이지로 이동
	function findId(){
		location.href="${cp}/findId";
	}
	
	// 비밀번호 찾기 페이지로 이동
	function findPwd(){
		location.href="${cp}/findPwd";
	}
	
	// form 데이터 전송
	function subm(){
		document.submitForm.submit();		
	}
</script>



