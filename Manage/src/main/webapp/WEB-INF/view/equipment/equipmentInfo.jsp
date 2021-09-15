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
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<c:if test="${empty authInfo}">
<script type="text/javascript">location.href="/login"</script>
</c:if>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<form id="frm" method="post" onsubmit="return false;">
			<div class="section-title">장비 상세정보</div>
				<input type="hidden" name="code" value="${item.CODE }" />
				<input type="hidden" name="id" value="${item.ID }" />
				<table>
					<tr>
						<td>구분</td>
						<td><span class="ability" id="gubun"></span></td>
					</tr>
					<tr>
						<td>소유자</td>
						<td>
							<select name="owner" id="emp" <c:if test="${authInfo.auth ne 'ADMIN' }">disabled</c:if>>
								<option value="">사원을 선택하세요.</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><span class="ability" id="manufacture"></span></td>
					</tr>
				</table>
				<table id="monitor" class="ability-box">
					<tr>
						<td>제품명</td>
						<td><span class="ability" id="mo_name"></span></td>
					</tr>
					<tr>
						<td>패널</td>
						<td><span class="ability" id="mo_pannel"></span></td>
					</tr>
					<tr>
						<td>화면 주사율(hz)</td>
						<td><span class="ability" id="mo_hz"></span></td>
					</tr>
					<tr>
						<td>해상도</td>
						<td><span class="ability" id="mo_resolution"></span></td>
					</tr>
					<tr>
						<td>응답속도(ms)</td>
						<td><span class="ability" id="mo_speed"></span></td>
					</tr>
					<tr>
						<td>형태</td>
						<td><span class="ability" id="mo_shape"></span></td>
					</tr>
					<c:if test="${authInfo.auth eq 'ADMIN' }">
					<tr>
						<td colspan="2" class="btn-area">
							<button onclick="updateOwn();" class="btn submit">수정</button>
							<button onclick="deleteOwn();" class="btn">삭제</button>
						</td>
					</tr>
					</c:if>
				</table>
				<table id="pc" class="ability-box">
					<tr>
						<td>종류</td>
						<td><span class="ability" id="pc_division"></span></td>
					</tr>
					<tr>
						<td>제품명</td>
						<td><span class="ability" id="pc_name"></span></td>
					</tr>
					<tr>
						<td>OS</td>
						<td><span class="ability" id="pc_os"></span></td>
					</tr>
					<tr>
						<td>CPU</td>
						<td><span class="ability" id="pc_cpu"></span></td>
					</tr>
					<tr>
						<td>RAM(GB)</td>
						<td><span class="ability" id="pc_ram"></span></td>
					</tr>
					<tr>
						<td>GPU</td>
						<td><span class="ability" id="pc_gpu"></span></td>
					</tr>
					<tr>
						<td>저장공간(GB)</td>
						<td><span class="ability" id="pc_capacity"></span></td>
					</tr>
					<c:if test="${authInfo.auth eq 'ADMIN' }">
					<tr>
						<td colspan="2" class="btn-area">
							<button onclick="updateOwn();" class="btn submit">수정</button>
							<button onclick="deleteOwn();" class="btn">삭제</button>
						</td>
					</tr>
					</c:if>
				</table>
				<table id="phone" class="ability-box">
					<tr>
						<td>제품명</td>
						<td><span class="ability" id="p_name"></span></td>
					</tr>
					<tr>
						<td>AP칩셋</td>
						<td><span class="ability" id="p_ap"></span></td>
					</tr>
					<tr>
						<td>운영체제</td>
						<td><span class="ability" id="p_os"></span></td>
					</tr>
					<tr>
						<td>CPU</td>
						<td><span class="ability" id="p_cpu"></span></td>
					</tr>
					<tr>
						<td>RAM(GB)</td>
						<td><span class="ability" id="p_ram"></span></td>
					</tr>
					<tr>
						<td>저장공간(GB)</td>
						<td><span class="ability" id="p_capacity"></span></td>
					</tr>
					<tr>
						<td>배터리(mAh)</td>
						<td><span class="ability" id="p_battery"></span></td>
					</tr>
					<c:if test="${authInfo.auth eq 'ADMIN' }">
					<tr>
						<td colspan="2" class="btn-area">
							<button onclick="updateOwn();" class="btn submit">수정</button>
							<button onclick="deleteOwn();" class="btn">삭제</button>
						</td>
					</tr>
					</c:if>
				</table>
				<table id="equipment"></table>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	window.onload = getInfo();

	function getInfo() {
		
		// 테이블 초기화
		var phone = document.getElementById('phone');
		var pc = document.getElementById('pc');
		var monitor = document.getElementById('monitor');
		
		phone.classList.add('ability-box');
		pc.classList.add('ability-box');
		monitor.classList.add('ability-box');

		var tag = document.getElementsByTagName('input');
		var select = document.getElementsByTagName('select');
		
		// 사원 리스트
		// option 초기화
		$('#emp').children('option:not(:first)').remove();
		var target = document.getElementById('emp');
		
		<c:forEach items="${emp }" var="emp" varStatus="s">
			var option = document.createElement('option');
			option.innerText = "${emp.M_NAME}(${emp.D_TIM})";
			option.value = "${emp.CODE}";
			target.append(option);
		</c:forEach>
		
		
		document.getElementById('gubun').innerText = '${item.GUBUN}';
		select.owner.value = '${item.CODE}';
		document.getElementById('manufacture').innerText = '${item.MA_NAME}';
		
		console.log('${item}');
		
		if ("${item.GUBUN}" === 'MONITOR') {
			monitor.classList.remove('ability-box');
			
			document.getElementById('mo_name').innerText = '${item.NAME}';
			document.getElementById('mo_pannel').innerText = '${item.PANNEL}';
			document.getElementById('mo_hz').innerText = '${item.HZ}';
			document.getElementById('mo_resolution').innerText = '${item.RESOLUTION}';
			document.getElementById('mo_speed').innerText = '${item.SPEED}';
			document.getElementById('mo_shape').innerText = '${item.SHAPE}';
			
		} else if ("${item.GUBUN}" === 'PC') {
			pc.classList.remove('ability-box');
			
			document.getElementById('pc_division').innerText = '${item.DIVISION}';
			document.getElementById('pc_name').innerText = '${item.NAME}';
			document.getElementById('pc_os').innerText = '${item.OS}';
			document.getElementById('pc_cpu').innerText = '${item.CPU}';
			document.getElementById('pc_ram').innerText = '${item.RAM}';
			document.getElementById('pc_gpu').innerText = '${item.GPU}';
			document.getElementById('pc_capacity').innerText = '${item.CAPACITY}';

		} else if ("${item.GUBUN}" === 'PHONE') {
			phone.classList.remove('ability-box');
			
			document.getElementById('p_name').innerText = '${item.NAME}';
			document.getElementById('p_os').innerText = '${item.OS}';
			document.getElementById('p_cpu').innerText = '${item.CPU}';
			document.getElementById('p_ram').innerText = '${item.RAM}';
			document.getElementById('p_ap').innerText = '${item.GPU}';
			document.getElementById('p_capacity').innerText = '${item.CAPACITY}';
			document.getElementById('p_battery').innerText = '${item.BATTERY}';
		}
		
	}

	var frm = document.getElementById('frm');
	// 장비 소유관계 수정
	function updateOwn() {
		var params = $('#frm').serialize();
		
		$.ajax({
			type : "POST"
			,url : "/equipment/update"
			,data : params
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				
				if(msg === 'success') {
					alert('장비 소유자 변경이 완료되었습니다.');
					location.href = responseText.location;
				}
			}
		});
		
		return false;
	}	
	
	// 장비 소유관계 삭제
	function deleteOwn() {
		var params = $('#frm').serialize();
		
		$.ajax({
			type : "POST"
			,url : "/equipment/delete"
			,data : params
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				
				if(msg === 'success') {
					alert('장비 소유자 삭제가 완료되었습니다.');
					location.href = "/equipment";
				}
			}
		});
	}
</script>
</html>