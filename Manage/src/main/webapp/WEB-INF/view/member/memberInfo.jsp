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
				<div class="section-sub-title">
					<a onclick="show('personal-info', this);" class="color-line">인적정보</a>
					<a onclick="show('device-info', this);" class="">장비정보</a>
				</div>
				<div class="section-divice-title">
					<a href="#monitor" onclick="active(this);" class="device-btn">모니터</a>
					<a href="#pc" class="device-btn"  onclick="active(this);">PC</a>
					<a href="#phone" class="device-btn"  onclick="active(this);">핸드폰</a>
				</div>
				
				<!-- 인적정보 -->
				<input type="hidden" name="phPattern" value="true"/>
				<input type="hidden" name="emailPattern" value="true"/>
				<div style="width: 930px; overflow:auto;" id="personal-info">
					<table>
						<tr>
							<td>사번</td>
							<td><input type="text" name="code" value="${empList.CODE }" readonly="readonly" style="background:#eee"/></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="m_name" value="${empList.M_NAME }" /></td>
						</tr>
						<tr>
							<td>부서</td>
							<td>
								<select name="m_depart" id="department">
									<option value="">부서를 선택하세요.</option>
									<c:forEach items="${deptList }" var="item">
										<option value="${item.D_ID}"
											<c:if test="${empList.M_DEPART eq item.D_ID}">selected</c:if>
										>${item.D_NAME } | ${item.D_TIM }</option>
									</c:forEach>
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
				
				<!-- 장비정보 -->
				<div id="device-info">
				
				<c:forEach items="${devList }" var="item" varStatus="i">
				<c:if test="${item.GUBUN eq 'MONITOR' }">
				<c:if test="${item.NO eq '1' }"><div class="device-info-title" id="monitor">모니터</div></c:if>
				<table >
					<tr>
						<td>제품명</td>
						<td><span class="ability" id="mo_name">${item.NAME }</span></td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><span class="ability" id="manufacture">${item.MA_NAME }</span></td>
					</tr>
					<tr>
						<td>패널</td>
						<td><span class="ability" id="mo_pannel">${item.PANNEL }</span></td>
					</tr>
					<tr>
						<td>화면 주사율(hz)</td>
						<td><span class="ability" id="mo_hz">${item.HZ }</span></td>
					</tr>
					<tr>
						<td>해상도</td>
						<td><span class="ability" id="mo_resolution">${item.RESOLUTION }</span></td>
					</tr>
					<tr>
						<td>응답속도(ms)</td>
						<td><span class="ability" id="mo_speed">${item.SPEED }</span></td>
					</tr>
					<tr>
						<td>형태</td>
						<td><span class="ability" id="mo_shape">${item.SHAPE }</span></td>
					</tr>
				</table>
				</c:if>
				
				<c:if test="${item.GUBUN eq 'PC' }">
				<c:if test="${item.NO eq '1' }"><div class="device-info-title" id="pc">PC</div></c:if>
				<table >
					<tr>
						<td>종류</td>
						<td><span class="ability" id="pc_division">${item.DIVISION }</span></td>
					</tr>
					<tr>
						<td>제품명</td>
						<td><span class="ability" id="pc_name">${item.NAME }</span></td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><span class="ability" id="manufacture">${item.MA_NAME }</span></td>
					</tr>
					<tr>
						<td>운영체제</td>
						<td><span class="ability" id="pc_os">${item.OS }</span></td>
					</tr>
					<tr>
						<td>CPU</td>
						<td><span class="ability" id="pc_cpu">${item.CPU }</span></td>
					</tr>
					<tr>
						<td>RAM(GB)</td>
						<td><span class="ability" id="pc_ram">${item.RAM }</span></td>
					</tr>
					<tr>
						<td>GPU</td>
						<td><span class="ability" id="pc_gpu">${item.GPU }</span></td>
					</tr>
					<tr>
						<td>저장공간(GB)</td>
						<td><span class="ability" id="pc_capacity">${item.CAPACITY }</span></td>
					</tr>
				</table>
				</c:if>
				
				<c:if test="${item.GUBUN eq 'PHONE' }">
				<c:if test="${item.NO eq '1' }"><div class="device-info-title" id="phone">핸드폰</div></c:if>
				<table >
					<tr>
						<td>제품명</td>
						<td><span class="ability" id="p_name">${item.NAME }</span></td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><span class="ability" id="manufacture">${item.MA_NAME }</span></td>
					</tr>
					<tr>
						<td>AP칩셋</td>
						<td><span class="ability" id="p_ap">${item.AP }</span></td>
					</tr>
					<tr>
						<td>운영체제</td>
						<td><span class="ability" id="p_os">${item.OS }</span></td>
					</tr>
					<tr>
						<td>CPU</td>
						<td><span class="ability" id="p_cpu">${item.CPU }</span></td>
					</tr>
					<tr>
						<td>RAM(GB)</td>
						<td><span class="ability" id="p_ram">${item.RAM }</span></td>
					</tr>
					<tr>
						<td>저장공간(GB)</td>
						<td><span class="ability" id="p_capacity">${item.CAPACITY }</span></td>
					</tr>
					<tr>
						<td>배터리(mAh)</td>
						<td><span class="ability" id="p_battery">${item.BATTERY }</span></td>
					</tr>
				</table>
				</c:if>
				
				</c:forEach>

				</div>	<!-- device-info 끝 -->
				
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	window.onload = getInfo();
	
	// 장비 부제목 클릭
	function active(section) {
		var btn = document.getElementsByClassName('device-btn');
		var length = btn.length;
		
		for(var i=0; i < length; i++) {
			btn[i].style.background = '#eee';
			btn[i].style.color = '#333';
		}
		section.style.background = '#fff';
		section.style.color = '#0067a3';
	}
	
	// 부제목 클릭
	function show(sub, btn) {
		var personal = 'personal-info';
		var device = 'device-info';
		var element = document.getElementsByClassName('color-line')[0];
		
		if(sub === personal) {
			document.getElementById('personal-info').style.display="block";
			document.getElementById('device-info').style.display="none";
			document.getElementsByClassName('section-divice-title')[0].style.display="none";
		} else if(sub === device) {
			document.getElementById('personal-info').style.display="none";
			document.getElementById('device-info').style.display="block";
			document.getElementsByClassName('section-divice-title')[0].style.display="block";
		}
		
		element.classList.remove('color-line');
		btn.classList.add('color-line');
		
	}

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