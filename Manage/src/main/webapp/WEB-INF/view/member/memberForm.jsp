<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberForm.jsp</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>
		<div id="right">
			<div class="section-title">사원 등록</div>
			<form action="addMember" method="post" modelAttribute="memberCommand" onsubmit="return checkParam();">
				<input type="hidden" name="checkDuplicate" value=""/>
				<input type="hidden" name="phPattern" value=""/>
				<input type="hidden" name="emailPattern" value=""/>
				<table border=1>
					<tr>
						<th>사번</th>
						<td><input type="text" name="code" class="not-duplicate"/><input type="button" value="중복검사" onclick="isDuplicate();"></td>
					</tr>
					<tr>
						<th>성명</th>
						<td><input type="text" name="m_name" /></td>
					</tr>
					<tr>
						<th>부서</th>
						<td>
							<select name="m_depart">
								<option value="">부서를 선택하세요.</option>
								<option value="공공사업팀">공공사업팀</option>
								<option value="SI사업팀">SI사업팀</option>
								<option value="전략제안팀">전략제안팀</option>
								<option value="기술지원팀">기술지원팀</option>
								<option value="재경팀">재경팀</option>
								<option value="경영관리팀">경영관리팀</option>
								<option value="전략구매실">전략구매실</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>직책</th>
						<td>
							<select name="m_job">
								<option value="">직급을 선택하세요.</option>
								<option value="임원">임원</option>
								<option value="수석">수석</option>
								<option value="부장">부장</option>
								<option value="차장">차장</option>
								<option value="과장">과장</option>
								<option value="대리">대리</option>
								<option value="사원">사원</option>
								<option value="인턴">인턴</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" name="m_age" /></td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td><input type="text" name="m_phone" placeholder="010-0000-0000" onkeyup="checkPh();">
							<span id="ph-err"></span>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" name="m_email" placeholder="email@truebon.co.kr" onkeyup="checkEmail();"/>
							<span id="email-err"></span>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="m_address" /></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><input type="radio" name="m_gender" value="M" />남 <input
							type="radio" name="m_gender" value="F" />여</td>
					</tr>
					<tr >
						<th colspan="2" class="btn-area"><input type="submit" value="등록"  class="btn submit"/> <input
							type="button" value="홈으로"
							onclick="javascript: location.href='/';" class="btn"/></th>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		function isDuplicate() {
			var code = document.getElementsByTagName('input')[name='code'].value;
			
			// 입력 값 확인
			if(code == '' || code == null) {
				alert('사번을 입력하세요.');
				document.getElementsByTagName('input')[name='code'].focus();
				return;
			}			
			
			$.ajax({
				type : "post"
				,url : "/employee/isDuplicate"
				,data : {"code" : code}
				,dataType : "json"
				,error : function(request, stataus, error) {
					console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
// 					alert('error');
				}
				,success : function(responseText, statusText, xhr) {
					var msg = responseText.message;
					var cnt = responseText.cnt;
					var input = document.getElementsByTagName('input');
					
					if(msg === 'success' && cnt > 0){
						alert('이미 등록된 사번입니다.');
					} else if(msg === 'success' && cnt == 0) {
						input[name='checkDuplicate'].value = 'true';
						alert('등록 가능한 사번입니다.');
					}
				}
			});
		}
		
		// 입력 값 확인
		function checkParam() {
			var param = document.getElementsByTagName('input');
			var select = document.getElementsByTagName('select');
			
			if(param[name="code"].value == '' || param[name="code"].value == null) {
				alert('사번을 입력하세요.');
				param[name="code"].focus();
				return false;
			} else if(param[name="checkDuplicate"].value == '' || param[name="checkDuplicate"].value == null) {
				alert('사번 중복확인을 하세요.');
				return false;
			} else if(param[name="m_name"].value == '' || param[name="m_name"].value == null) {
				alert('이름을 입력하세요.');
				param[name="m_name"].focus();
				return false;
			} else if(select[name="m_depart"].value == '' || select[name="m_depart"].value == null) {
				alert('부서를 입력하세요.');
				select[name="m_depart"].focus();
				return false;
			}  else if(select[name="m_job"].value == '' || select[name="m_job"].value == null) {
				alert('직책을 입력하세요.');
				select[name="m_job"].focus();
				return false;
			} else if(param[name="m_age"].value == '' || param[name="m_age"].value == null) {
				alert('생년월일을 입력하세요.');
				param[name="m_age"].focus();
				return false;
			}  else if(param[name="m_phone"].value == '' || param[name="m_phone"].value == null ) {
				alert('핸드폰을 입력하세요.');
				param[name="m_phone"].focus();
				return false;
			}  else if(param[name="m_email"].value == '' || param[name="m_email"].value == null) {
				alert('이메일을 입력하세요.');
				param[name="m_email"].focus();
				return false;
			} else if(param[name="m_address"].value == '' || param[name="m_address"].value == null) {
				alert('주소를 입력하세요.');
				param[name="m_address"].focus();
				return false;
			} else if(param[name="m_gender"].value == '' || param[name="m_gender"].value == null) {
				alert('성별을 입력하세요.');
				param[name="m_gender"].focus();
				return false;
			}  else if(param[name="phPattern"].value == '' || param[name="phPattern"].value == '') {
				alert('핸드폰 번호 형식이 올바르지 않습니다.');
				return false;
			} else if(param[name="emailPattern"].value == '' || param[name="emailPattern"].value == '') {
				alert('이메일 형식이 올바르지 않습니다.');
				return false;
			}
			
		}
		
		function checkPh() {
			var param = document.getElementsByTagName('input');
			
			if(!patternPhone.test(param[name="m_phone"].value)) {
				document.getElementById('ph-err').innerText = '핸드폰 형식이 올바르지 않습니다.';
			} else {
				document.getElementById('ph-err').innerText = '';
				param[name="phPattern"].value = 'true';
			}
		}
		
		function checkEmail() {
			var param = document.getElementsByTagName('input');
			var email = param[name="m_email"].value;
			
			if(email.length < 6 || !regExpEmail.test(email)) {
				document.getElementById('email-err').innerText = '이메일 형식이 올바르지 않습니다.';
			} else {
				document.getElementById('email-err').innerText = '';
				param[name="emailPattern"].value = 'true';
			}
			
		}
	</script>
</body>
</html>