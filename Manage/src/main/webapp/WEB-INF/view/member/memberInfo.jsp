<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Equipment</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<form id="frm" method="post" onsubmit="return checkParam();" action="/employee/update">
			<div class="section-title">사원 상세정보</div>
				<input type="hidden" name="phPattern" value="true"/>
				<input type="hidden" name="emailPattern" value="true"/>
				<div style="width: 930px; overflow:auto;">
					<table>
						<tr>
							<td>사번</td>
							<td><input type="text" name="code" value="${empList.CODE }" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="m_name" value="${empList.M_NAME }" /></td>
						</tr>
						<tr>
							<td>부서</td>
							<td>
								<select name="m_depart">
									<option value="">부서를 선택하세요.</option>
									<option value="공공사업팀"
										<c:if test="${empList.M_DEPART eq '공공사업팀' }">selected</c:if>
									>공공사업팀</option>
									<option value="SI사업팀"
										<c:if test="${empList.M_DEPART eq 'SI사업팀' }">selected</c:if>
									>SI사업팀</option>
									<option value="전략제안팀"
										<c:if test="${empList.M_DEPART eq '전략제안팀' }">selected</c:if>
									>전략제안팀</option>
									<option value="기술지원팀"
										<c:if test="${empList.M_DEPART eq '기술지원팀' }">selected</c:if>
									>기술지원팀</option>
									<option value="재경팀"
										<c:if test="${empList.M_DEPART eq '재경팀' }">selected</c:if>
									>재경팀</option>
									<option value="경영관리팀"
										<c:if test="${empList.M_DEPART eq '경영관리팀' }">selected</c:if>
									>경영관리팀</option>
									<option value="전략구매실"
										<c:if test="${empList.M_DEPART eq '전략구매실' }">selected</c:if>
									>전략구매실</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>직책</td>
							<td>
								<select name="m_job">
									<option value="">직급을 선택하세요.</option>
									<option value="임원"
										<c:if test="${empList.M_JOB eq '임원' }">selected</c:if>
									>임원</option>
									<option value="수석"
										<c:if test="${empList.M_JOB eq '수석' }">selected</c:if>
									>수석</option>
									<option value="부장"
										<c:if test="${empList.M_JOB eq '부장' }">selected</c:if>
									>부장</option>
									<option value="차장"
										<c:if test="${empList.M_JOB eq '차장' }">selected</c:if>
									>차장</option>
									<option value="과장"
										<c:if test="${empList.M_JOB eq '과장' }">selected</c:if>
									>과장</option>
									<option value="대리"
										<c:if test="${empList.M_JOB eq '대리' }">selected</c:if>
									>대리</option>
									<option value="사원"
										<c:if test="${empList.M_JOB eq '사원' }">selected</c:if>
									>사원</option>
									<option value="인턴"
										<c:if test="${empList.M_JOB eq '인턴' }">selected</c:if>
									>인턴</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" name="m_age" value="${empList.M_AGE }" /></td>
						</tr>
						<tr>
							<td>핸드폰</td>
							<td><input type="text" name="m_phone" value="${empList.M_PHONE }" onkeyup="checkPh();"/>
							<span id="ph-err"></span></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="m_email" value="${empList.M_EMAIL }" onkeyup="checkEmail();"/>
							<span id="email-err"></span></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="m_address" value="${empList.M_ADDRESS }" /></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<input type="radio" name="m_gender" value="M" 
									<c:if test="${empList.M_GENDER eq 'M' }">checked</c:if>
								/>남 
								<input type="radio" name="m_gender" value="F" 
									<c:if test="${empList.M_GENDER eq 'F' }">checked</c:if>
								/>여
							</td>
						</tr>
						<tr>
							<th colspan="2" class="btn-area">
								<input type="submit" value="수정"  class="btn submit"/> 
								<input type="button" value="삭제" onclick="deleteEmp();" class="btn"/>
							</th>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	window.onload = getInfo();

	function getInfo() {
		var target = document.getElementsByTagName('input')[name='m_age'];
		var date = "${empList.M_AGE}".substr(0,10);
		
		target.value = date;
	}
	
	// 전송 전 파라미터 확인
	function checkParam() {
		var param = document.getElementsByTagName('input');
		
		if(param[name="phPattern"].value == null || param[name="phPattern"].value == '') {
			alert('핸드폰 번호의 형식이 올바르지 않습니다.');
			param[name="phPattern"].focus();
			return false;
		} else if(param[name="emailPattern"].value == null || param[name="emailPattern"].value == '') {
			alert('이메일 형식이 올바르지 않습니다.');
			param[name="emailPattern"].focus();
			return false;
		}
	}
	
	function checkPh() {
		var param = document.getElementsByTagName('input');
		
		if(!patternPhone.test(param[name="m_phone"].value)) {
			document.getElementById('ph-err').innerText = '핸드폰 형식이 올바르지 않습니다.';
			param[name="phPattern"].value = 'false';
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
			param[name="emailPattern"].value = 'false';
		} else {
			document.getElementById('email-err').innerText = '';
			param[name="emailPattern"].value = 'true';
		}
		
	}
	
	function deleteEmp() {
		var frm = document.getElementById('frm');
		
		frm.action = "/employee/delete";
		frm.method = "post";
		frm.submit();
	}

</script>
</html>