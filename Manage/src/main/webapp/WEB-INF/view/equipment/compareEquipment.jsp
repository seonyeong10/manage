<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>compare equipment ability</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/compare.css"/>" rel="stylesheet"
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
			<form action="#" method="post" id="frm"  onsubmit="return false;">
				<div class="section-title">장비 성능 비교</div>
				<div>
					
				<table>
					<thead>
						<tr>
							<td>
								<select name="gubun" onchange="showEquipment();" id="gubun">
									<option value="">항목을 선택하세요.</option>
									<option value="PC"
										<c:if test="${selected.gubun eq 'PC' }">selected</c:if>
									>PC</option>
									<option value="PHONE"
										<c:if test="${selected.gubun eq 'PHONE' }">selected</c:if>
									>핸드폰</option>
									<option value="MONITOR"
										<c:if test="${selected.gubun eq 'MONITOR' }">selected</c:if>
									>모니터</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<select name="code1" class="emp" onchange="getEquipment('1');">
									<option value="">사원을 선택하세요.</option>
								</select>
								<br/>
								<select name="device1" class="device" onchange="getDevice('1');">
									<option>장비를 선택하세요.</option>
								</select>
							</td>
							<c:if test="${authInfo.auth eq 'ADMIN' }">
							<td>
								<button onclick="giveEquipment('1');" class="give">→</button>
								<br />
								<button onclick="giveEquipment('2');" class="give">←</button>
							</td>
							</c:if>
							<td>
								<select name="code2" class="emp" onchange="getEquipment('2');">
									<option value="">사원을 선택하세요.</option>
								</select>
								<br/>
								<select name="device2" class="device" onchange="getDevice('2');">
									<option>장비를 선택하세요.</option>
								</select>
							</td>
						</tr>
					</thead>
				</table>
				<table id="phone-ability" class="ability-box">
						<tr>
							<td><input type="text" name="name1" readonly="readonly" class="ph1"/></td>
							<td class="col">제품명</td>
							<td><input type="text" name="name2" readonly="readonly" class="ph2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_ap1" readonly="readonly" class="ph1"/></td>
							<td class="col">AP칩셋</td>
							<td><input type="text" name="p_ap2" readonly="readonly" class="ph2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_os1" readonly="readonly" class="ph1"/></td>
							<td class="col">운영체제</td>
							<td><input type="text" name="p_os2" readonly="readonly" class="ph2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_cpu1" readonly="readonly" class="ph1"/></td>
							<td class="col">CPU</td>
							<td><input type="text" name="p_cpu2" readonly="readonly" class="ph2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_ram1" readonly="readonly" class="ph1"/></td>
							<td class="col">RAM</td>
							<td><input type="text" name="p_ram2" readonly="readonly" class="ph2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_capacity1" readonly="readonly" class="ph1"/></td>
							<td class="col">저장공간(GB)</td>
							<td><input type="text" name="p_capacity2" readonly="readonly" class="ph2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_battery1" readonly="readonly" class="ph1"/></td>
							<td class="col">배터리(mAh)</td>
							<td><input type="text" name="p_battery2" readonly="readonly" class="ph2"/></td>
						</tr>
				</table>
				<table id="pc-ability" class="ability-box">
						<tr>
							<td><input type="text" name="pc_division1" readonly="readonly" class="pc1"/></td>
							<td class="col">종류</td>
							<td><input type="text" name="pc_division2" readonly="readonly" class="pc2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="name1" readonly="readonly" class="pc1"/></td>
							<td class="col">제품명</td>
							<td><input type="text" name="name2" readonly="readonly" class="pc2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_os1" readonly="readonly" class="pc1"/></td>
							<td class="col">운영체제</td>
							<td><input type="text" name="pc_os2" readonly="readonly" class="pc2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_cpu1" readonly="readonly" class="pc1"/></td>
							<td class="col">CPU</td>
							<td><input type="text" name="pc_cpu2" readonly="readonly" class="pc2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_ram1" readonly="readonly" class="pc1"/></td>
							<td class="col">RAM</td>
							<td><input type="text" name="pc_ram2" readonly="readonly" class="pc2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_gpu1" readonly="readonly" class="pc1"/></td>
							<td class="col">GPU</td>
							<td><input type="text" name="pc_gpu2" readonly="readonly" class="pc2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_capacity1" readonly="readonly" class="pc1"/></td>
							<td class="col">저장공간(GB)</td>
							<td><input type="text" name="pc_capacity2" readonly="readonly"/ class="pc2"></td>

						</tr>
				</table>
				<table id="monitor-ability" class="ability-box">
						<tr>
							<td><input type="text" name="name1" readonly="readonly" class="mo1"/></td>
							<td class="col">제품명</td>
							<td><input type="text" name="name2" readonly="readonly" class="mo2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_pannel1" readonly="readonly" class="mo1"/></td>
							<td class="col">패널</td>
							<td><input type="text" name="mo_pannel2" readonly="readonly" class="mo2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_Hz1" readonly="readonly" class="mo1"/></td>
							<td class="col">화면 주사율(Hz)</td>
							<td><input type="text" name="mo_Hz2" readonly="readonly" class="mo2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_resolution1" readonly="readonly" class="mo1"/></td>
							<td class="col">해상도(픽셀)</td>
							<td><input type="text" name="mo_resolution2" readonly="readonly" class="mo2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_speed1" readonly="readonly" class="mo1"/></td>
							<td class="col">응답속도(ms)</td>
							<td><input type="text" name="mo_speed2" readonly="readonly" class="mo2"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_shape1" readonly="readonly" class="mo1"/></td>
							<td class="col">형태</td>
							<td><input type="text" name="mo_shape2" readonly="readonly" class="mo2"/></td>
						</tr>
				</table>
				<c:if test="${authInfo.auth eq 'ADMIN' }">
				<table>
					<tr class="btn-area">
							<td colspan="3">
								<button onclick="changeEquipment();">장비 교환</button>
							</td>
						</tr>
				</table>
				</c:if>
			</div>
			</form>
		</div>

	</div>
	<script type="text/javascript">
	var frm = document.getElementById('frm');
		window.onload = tableLoad();

		function tableLoad() {
			var table = '${selected.gubun}';
			hideTable();
			
			// select option 추가
			var target = document.getElementsByClassName('emp');
			var code1 = "${selected.code1}";
			var code2 = "${selected.code2}";
			
			var phone = document.getElementById('phone-ability');
			var pc = document.getElementById('pc-ability');
			var monitor = document.getElementById('monitor-ability');
			
				<c:forEach items="${emp }" var="emp" varStatus="s">
					var option = document.createElement('option');
					option.innerText = "${emp.M_NAME}(${emp.D_TIM})";
					option.value = "${emp.CODE}";
					
					if('${emp.CODE}' === code1) {
						option.selected = 'true';
					}
					
					target[0].append(option);
				</c:forEach>
				
				<c:forEach items="${emp }" var="emp" varStatus="s">
					var option = document.createElement('option');
					option.innerText = "${emp.M_NAME}(${emp.D_TIM})";
					option.value = "${emp.CODE}";
					
					if('${emp.CODE}' === code2) {
						option.selected = 'true';
					}
					
					target[1].append(option);
				</c:forEach>


			if(table === 'PHONE') phone.classList.remove('ability-box');
			else if(table === 'MONITOR') monitor.classList.remove('ability-box');
			else if(table === 'PC') pc.classList.remove('ability-box');

		}

		// 테이블 숨김
		function hideTable() {
			var phone = document.getElementById('phone-ability');
			var pc = document.getElementById('pc-ability');
			var monitor = document.getElementById('monitor-ability');
			
			phone.classList.add('ability-box');
			pc.classList.add('ability-box');
			monitor.classList.add('ability-box');
		}

		// 항목 선택하면 테이블 표시
		function showEquipment() {
			var target = document.getElementById('gubun');
			var selected = target.options[target.selectedIndex].value;
			
			var phone = document.getElementById('phone-ability');
			var pc = document.getElementById('pc-ability');
			var monitor = document.getElementById('monitor-ability');

			hideTable();

			if (selected === 'PC') {
				pc.classList.remove('ability-box');
			} else if (selected === 'PHONE') {
				phone.classList.remove('ability-box');
			} else if (selected === 'MONITOR') {
				monitor.classList.remove('ability-box');
			}
		}
		
		// 장치 성능정보 가져오기(0909 수정)
		function getDevice(no) {
			// 대상
			var empNo = 'code' + no;
			var device = 'device' + no;
			
			// 사번
			var select = document.getElementsByTagName('select')[name=empNo];
			var code = select.options[select.selectedIndex].value;	// 조회할 사원 번호
			
			// 장치 id
			select = document.getElementsByTagName('select')[name=device];
			var id = select.options[select.selectedIndex].value;
			
			$.ajax({
				type : "post"
				,url : "/equipment/compare/getAbility"
				,data : {"code" : code, "id" : id}
				,dataType : "json"
				,error : function(request, stataus, error) {
					console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
				}
				,success : function(responseText, statusText, xhr) {
					var msg = responseText.message;		// 전송 성공여부 판단
					var ability = responseText.ability;	// 성능 정보가 담긴 객체
					var className = null;				// 정보를 출력할 객체의 class명
					
					if(ability.GUBUN === 'PHONE') {
						className = document.getElementsByClassName('ph' + no);
						
						className[0].value = ability.NAME;
						className[1].value = ability.AP;
						className[2].value = ability.OS;
						className[3].value = ability.CPU;
						className[4].value = ability.RAM + 'GB';
						className[5].value = ability.CAPACITY + 'GB';
						className[6].value = ability.BATTERY + 'mAh';
						
					} else if(ability.GUBUN === 'MONITOR') {
						className = document.getElementsByClassName('mo' + no);
						
						className[0].value = ability.NAME;
						className[1].value = ability.PANNEL;
						className[2].value = ability.HZ + 'hz';
						className[3].value = ability.RESOLUTION;
						className[4].value = ability.SPEED + 'ms';
						className[5].value = ability.SHAPE;
						
					} else if(ability.GUBUN === 'PC') {
						className = document.getElementsByClassName('pc' + no);
						
						className[0].value = ability.DIVISION;
						className[1].value = ability.NAME;
						className[2].value = ability.OS;
						className[3].value = ability.CPU;
						className[4].value = ability.RAM + 'GB';
						className[5].value = ability.GPU;
						className[6].value = ability.CAPACITY + 'GB';
						
					}
				}
			});
		}

		// 장치 목록 가져오기
		function getEquipment(no) {
			// 대상
			var code = 'code' + no;
			var device = 'device' + no;
			
			// 테이블
			var gubun = document.getElementById('gubun');
			var selected = gubun.options[gubun.selectedIndex].value;
			
			// 사번
			var target = document.getElementsByTagName('select')[name=code];
			var code = target.options[target.selectedIndex].value;
			
			$.ajax({
				type : "post"
				,url : "/equipment/compare/getEquipmentList"
				,data : {"code" : code, "gubun" : selected}
				,dataType : "json"
				,error : function(request, stataus, error) {
					console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
				}
				,success : function(responseText, statusText, xhr) {
					var msg = responseText.message;
					var deviceBox = document.getElementsByTagName('select')[name=device];
					var equipList = responseText.equip;
					
					if(msg === 'success') {
						for(var i=0 ; i < equipList.length ; i++) {
							var option = document.createElement('option');
							option.innerText = equipList[i].NAME;
							option.value = equipList[i].ID;
							
							deviceBox.append(option);
						}
					}
				}
			});

		}
		
		// 장비 교체 버튼 클릭
		function changeEquipment() {
			frm.action = '/equipment/changeEquipment';
			frm.submit();
		}
		
		// 장비 양도 버튼 클릭
		function giveEquipment(no) {
			var target = document.getElementsByTagName('select');
			var table = target[name='gubun'].options[target[name='gubun'].selectedIndex].value;	
			var giver = target[name='code' + no].options[target[name='code' + no].selectedIndex].value;	// 주는 사람
			var id = target[name='device' + no].options[target[name='device' + no].selectedIndex].value;;	// 장비 id
			
			if(no === '1') no = 2;
			else no = 1;
			var receiver = target[name='code' + no].options[target[name='code' + no].selectedIndex].value;	// 받는 사람
			
			$.ajax({
				type: 'post'
				,url: '/equipment/compare/giveEquipment'
				,data: {'giver' : giver, 'receiver' : receiver, 'id' : id, 'table' : table}
				,dataType: 'json'
				,error: function(request, stataus, error) {
					console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
				}
				,success: function(responseText, statusText, xhr) {
					var msg = responseText.message;
					
					if(msg === 'success') {
						alert('장비가 양도되었습니다.');
						location.reload();
					}
				}
			});
			
		}
	</script>
	</body>
</html>