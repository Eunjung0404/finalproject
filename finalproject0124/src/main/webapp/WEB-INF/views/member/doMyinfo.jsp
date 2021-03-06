<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>		<!-- daum post API -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
h3 {
	padding-top: 80px;
	margin-left: 300px;
}
#editForm{
	margin-left: 300px;
}
table tr td {	
	text-align: left;
}

table tr td input[name=mphone] {
	width: 185px;
}

table tr td input[name=maddr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}
div .sign {
	padding-left: 300px;
}

.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}

.valid, .invalid {
	font-size: 11px;
	font-weight: bold;
}

.valid {
	color: green;
}

.invalid {
	color: red;
}
#editBtn {
	border: 0;
	color: #fff;
	background-color: #503396;
	height: 46px;
	padding: 0 30px;
	border-radius: 4px;
	margin-right: 10px;
	margin-top: 10px;
	margin-right: 20px;
}
#cancle {
	border-width: 0.5px;
	border-color: #503396;
	color: #503396;
	background-color: #fff;
	height: 46px;
	padding: 0 30px;
	border-radius: 4px;
	margin-right: 10px;
	margin-top: 10px;
}
#execPostCode{
	border-width: 0.5px;
	border-color: #503396;
	color: #503396;
	background-color: #fff;
	border-radius: 4px;
}
#withdrawal {
	border-width: 0.5px;
	border-color: #503396;
	color: #503396;
	background-color: #fff;
	height: 30px;
	padding: 0 10px;
	border-radius: 4px;
	margin-right: 10px;
	margin-top: 10px;
	margin-left: 600px;
}
</style>
<h3>개인정보 변경</h3>
<hr style="color: #503396; ">
<form:form id="editForm" name="editForm">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" title="아이디" id="mid" name="mid"  value="${info.mid }" readonly="readonly" style="margin-bottom: 10px;"/> 				
				<button type="button" id="withdrawal" >회원탈퇴</button>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="button" title="비밀번호" id="mpwdChange"  value="비밀번호 변경" style="margin-bottom: 10px; 
					background-color: #FFFFFF; border-width: 1px; border-radius: 4px; height: 40px; border-color: #503396;">
					<input type="hidden" id="mpwd" name="mpwd" value="${info.mpwd }">
		<tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" title="이메일"  id="memail" name="memail" class="chk" value="${info.memail }" style="margin-bottom: 10px;">
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" class="chk" title="이름" id="mname" name="mname" value="${info.mname }" style="margin-bottom: 10px;"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" id="birth" name="birth" value="${info.birth }" style="margin-bottom: 10px;" readonly="readonly"> 
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" id="mphone" name="mphone" value="${info.mphone }" style='margin-bottom: 10px;' maxlength="11">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly" style="margin-bottom: 5px;" value="${info.postcode }">
				<input type="button" id="execPostCode" value="우편번호 찾기"><br>
				<input type="text" id="roadAddress" name="roadaddress" placeholder="도로명주소" readonly="readonly" style="margin-bottom: 5px;" value="${info.roadaddress }">
				<input type="text" id="jibunAddress" name="jibunaddress" placeholder="지번주소" readonly="readonly" value="${info.jibunaddress }">
				<span id="guide" style="color:#999;display:none"></span><br>
				<input type="text" id="detailAddress" name="detailaddress" placeholder="상세주소" value="${info.detailaddress }">
		</tr>
	</table><br>

	<hr>
	<div class="sign">
		<input type="button" value="수정"style="width: 200pt;" name="editBtn" id="editBtn">
		<input type="button" value="취소" id="cancle"  style="width: 200pt;" name="cancle">
	</div>
</form:form>

<form:form name="withdrawalForm" id="withdrawalForm">
	<input type="hidden" name="mid" id="mid" value="${info.mid }">
</form:form>

<form:form method="post" action="${cp }/logout" name="logoutForm">
</form:form>

<script>
	let regExpName = /^[가-힣]*$/;
	let regExpPhone = /^\d{3}\d{3,4}\d{4}$/;
	
	

//버튼 마우스 오버
	$("#mpwd").mouseover(function(){
		$("#mpwd").css("background-color", "#EFF2FB");
	});
	$("#mpwd").mouseout(function(){
		$("#mpwd").css("background-color", "#ffffff");
	});
	$("#execPostCode").mouseover(function(){
		$("#execPostCode").css("background-color", "#EFF2FB");
	});
	$("#execPostCode").mouseout(function(){
		$("#execPostCode").css("background-color", "#ffffff");
	});
	$("#withdrawal").mouseover(function(){
		$("#withdrawal").css("background-color", "#EFF2FB");
	});
	$("#withdrawal").mouseout(function(){
		$("#withdrawal").css("background-color", "#ffffff");
	});
	
	// 비밀번호 변경 페이지 이동
	$("#mpwdChange").on("click", function(){
		location.href="${cp}/member/changePwdForm";
	});
	
	// 회원 탈퇴
	$("#withdrawal").on("click", function(){
		let withdrawalForm = $("#withdrawalForm").serialize();
		if (confirm("회원 탈퇴를 하시겠습니까?") == false) {
			return false;
		} else {
			$.ajax({
				url: "${cp}/member/withdrawal",
				type: "POST",
				data: withdrawalForm,
				dataType: "json",
				success: function(data){
					alert("그동안 이용해주셔서 감사합니다.");
					document.logoutForm.submit();
				}, error: function() {
					alert("탈퇴 에러");
				}
			});
		}
	});
	
	//주소 API
	$("#execPostCode").click(function(){
		document.getElementById("detailAddress").value = "";
		
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	           var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("roadAddress").value = roadAddr;
	            document.getElementById("jibunAddress").value = data.jibunAddress;                
	          
	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open();
	});
	
	// 회원정보 변경
	$("#editBtn").on("click", function(){
// 		console.log(${info.mpwd});
		if ($("#memail").val() == "" || $("#memail").val() == null) {
			alert("이메일을 입력해주세요.");
			$("#memail").focus();
			return false;
		}
		if ($("#mname").val() == "" || $("#mname").val() == null) {
			alert("이름을 입력해주세요.");
			$("#mname").focus();
			return false;
		}
		if (!isNaN(document.editForm.mname.value.substr(0,1))){
 			alert("이름은 숫자로 시작할 수 없습니다.");
 			document.editForm.mname.select();
 			return false;
 		}
		if (!regExpName.test(document.editForm.mname.value)){
 			alert("이름은 한글만 입력해주세요!");
 			document.editForm.mname.select();
 			return false;
 		}
		if (!regExpPhone.test(document.editForm.mphone.value)){
 			alert("전화번호 입력을 확인해주세요!");
 			document.editForm.mphone.focus();
 			return false;
 		}
 		if (document.getElementById("postcode").value == ""){
 			alert("주소를 입력해주세요.");
 			return false;
 		}
 		if (document.getElementById("roadAddress").value == "" && document.getElementById("jibunAddress").value == ""){
 			alert("주소를 입력해주세요.");
 			return false;
 		}	
 		if (document.getElementById("detailAddress").value == ""){
 			alert("상세주소를 입력해주세요.");
 			return false;
 		}
 		let editForm = $("#editForm").serialize();

 		$.ajax({
 			url: "${cp}/member/edit",
 			type: "post",
 			dataType: "json",
 			data: editForm,
 			success: function(data) {
 				if (data == 1){
					alert("회원 정보가 변경되었습니다.");
					location.href="${cp}/member/mypage";
 				}
 			}, error: function() {
 				alert('회원 정보를 변경하지 못 했습니다.');
 			}
 		});
	});
	
	
	
	$("#cancle").on("click", function(){
		
	});
</script>
