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
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<form action="#" method="post" id="frm">
				<div class="section-title">장비 성능 비교</div>
				<div>
					<table>
						<thead>
							<tr>
								<td><select name="code1" class="emp"
									onchange="getEquipment();">
										<option value="">사원을 선택하세요.</option>
								</select>
								</td>
								<td>
								<select name="gubun" onchange="showEquipment();" id="gubun">
									<option value="">항목을 선택하세요.</option>
									<option value="pc"
										<c:if test="${selected.gubun eq 'pc' }">selected</c:if>
									>PC</option>
									<option value="핸드폰"
										<c:if test="${selected.gubun eq '핸드폰' }">selected</c:if>
									>핸드폰</option>
									<option value="모니터"
										<c:if test="${selected.gubun eq '모니터' }">selected</c:if>
									>모니터</option>
								</select>
							</td>
							<td>
								<select name="code2" class="emp" onchange="getEquipment();">
									<option value="">사원을 선택하세요.</option>
								</select>
							</td>
						</tr>
					</thead>
<!-- 					<tfoot> -->
<!-- 						<tr class="btn-area"> -->
<!-- 							<td colspan="3"> -->
<!-- 								<button onclick="changeEquipment();">장비 교체</button> -->
<!-- 							</td> -->
<!-- 						</tr> -->
<!-- 					</tfoot> -->
<!-- 					<tbody id="phone-ability"> -->
<!-- <!-- 						<tr> --> -->
<!-- <!-- 							<td colspan="2" class="equip-title">핸드폰</td> --> -->
<!-- <!-- 						</tr> --> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="p_ap1" readonly="readonly" /></td> -->
<!-- 							<td class="col">AP칩셋</td> -->
<!-- 							<td><input type="text" name="p_ap2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="p_os1" readonly="readonly"/></td> -->
<!-- 							<td class="col">운영체제</td> -->
<!-- 							<td><input type="text" name="p_os2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="p_cpu1" readonly="readonly"/></td> -->
<!-- 							<td class="col">CPU</td> -->
<!-- 							<td><input type="text" name="p_cpu2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="p_ram1" readonly="readonly"/></td> -->
<!-- 							<td class="col">RAM</td> -->
<!-- 							<td><input type="text" name="p_ram2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="p_capacity1" readonly="readonly"/></td> -->
<!-- 							<td class="col">저장공간(GB)</td> -->
<!-- 							<td><input type="text" name="p_capacity2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="p_battery1" readonly="readonly"/></td> -->
<!-- 							<td class="col">배터리(mAh)</td> -->
<!-- 							<td><input type="text" name="p_battery2" readonly="readonly" /></td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 					<tbody id="pc-ability"> -->
<!-- <!-- 						<tr> --> -->
<!-- <!-- 							<td colspan="2" class="equip-title">PC</td> --> -->
<!-- <!-- 						</tr> --> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="pc_division1" readonly="readonly"/></td> -->
<!-- 							<td class="col">종류</td> -->
<!-- 							<td><input type="text" name="pc_division2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="pc_os1" readonly="readonly"/></td> -->
<!-- 							<td class="col">운영체제</td> -->
<!-- 							<td><input type="text" name="pc_os2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="pc_cpu1" readonly="readonly"/></td> -->
<!-- 							<td class="col">CPU</td> -->
<!-- 							<td><input type="text" name="pc_cpu2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="pc_ram1" readonly="readonly"/></td> -->
<!-- 							<td class="col">RAM</td> -->
<!-- 							<td><input type="text" name="pc_ram2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="pc_gpu1" readonly="readonly"/></td> -->
<!-- 							<td class="col">GPU</td> -->
<!-- 							<td><input type="text" name="pc_gpu2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="pc_capacity1" readonly="readonly"/></td> -->
<!-- 							<td class="col">저장공간(GB)</td> -->
<!-- 							<td><input type="text" name="pc_capacity2" readonly="readonly"/></td> -->

<!-- 						</tr> -->
<!-- 					</tbody> -->
<!-- 					<tbody id="monitor-ability"> -->
<!-- <!-- 						<tr> --> -->
<!-- <!-- 							<td colspan="2" class="equip-title">모니터</td> --> -->
<!-- <!-- 						</tr> --> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="mo_pannel1" readonly="readonly"/></td> -->
<!-- 							<td class="col">패널</td> -->
<!-- 							<td><input type="text" name="mo_pannel2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="mo_Hz1" readonly="readonly"/></td> -->
<!-- 							<td class="col">화면 주사율(Hz)</td> -->
<!-- 							<td><input type="text" name="mo_Hz2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="mo_resolution1" readonly="readonly"/></td> -->
<!-- 							<td class="col">해상도(픽셀)</td> -->
<!-- 							<td><input type="text" name="mo_resolution2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="mo_speed1" readonly="readonly"/></td> -->
<!-- 							<td class="col">응답속도(ms)</td> -->
<!-- 							<td><input type="text" name="mo_speed2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td><input type="text" name="mo_shape1" readonly="readonly"/></td> -->
<!-- 							<td class="col">형태</td> -->
<!-- 							<td><input type="text" name="mo_shape2" readonly="readonly"/></td> -->
<!-- 						</tr> -->
<!-- 					</tbody> -->
				</table>
				<table id="phone-ability">
					<tr>
							<td><input type="text" name="p_ap1" readonly="readonly" /></td>
							<td class="col">AP칩셋</td>
							<td><input type="text" name="p_ap2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_os1" readonly="readonly"/></td>
							<td class="col">운영체제</td>
							<td><input type="text" name="p_os2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_cpu1" readonly="readonly"/></td>
							<td class="col">CPU</td>
							<td><input type="text" name="p_cpu2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_ram1" readonly="readonly"/></td>
							<td class="col">RAM</td>
							<td><input type="text" name="p_ram2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_capacity1" readonly="readonly"/></td>
							<td class="col">저장공간(GB)</td>
							<td><input type="text" name="p_capacity2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="p_battery1" readonly="readonly"/></td>
							<td class="col">배터리(mAh)</td>
							<td><input type="text" name="p_battery2" readonly="readonly" /></td>
						</tr>
				</table>
				<table id="pc-ability">
					<tr>
							<td><input type="text" name="pc_division1" readonly="readonly"/></td>
							<td class="col">종류</td>
							<td><input type="text" name="pc_division2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_os1" readonly="readonly"/></td>
							<td class="col">운영체제</td>
							<td><input type="text" name="pc_os2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_cpu1" readonly="readonly"/></td>
							<td class="col">CPU</td>
							<td><input type="text" name="pc_cpu2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_ram1" readonly="readonly"/></td>
							<td class="col">RAM</td>
							<td><input type="text" name="pc_ram2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_gpu1" readonly="readonly"/></td>
							<td class="col">GPU</td>
							<td><input type="text" name="pc_gpu2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_capacity1" readonly="readonly"/></td>
							<td class="col">저장공간(GB)</td>
							<td><input type="text" name="pc_capacity2" readonly="readonly"/></td>

						</tr>
				</table>
				<table id="monitor-ability">
					<tr>
							<td><input type="text" name="mo_pannel1" readonly="readonly"/></td>
							<td class="col">패널</td>
							<td><input type="text" name="mo_pannel2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_Hz1" readonly="readonly"/></td>
							<td class="col">화면 주사율(Hz)</td>
							<td><input type="text" name="mo_Hz2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_resolution1" readonly="readonly"/></td>
							<td class="col">해상도(픽셀)</td>
							<td><input type="text" name="mo_resolution2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_speed1" readonly="readonly"/></td>
							<td class="col">응답속도(ms)</td>
							<td><input type="text" name="mo_speed2" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_shape1" readonly="readonly"/></td>
							<td class="col">형태</td>
							<td><input type="text" name="mo_shape2" readonly="readonly"/></td>
						</tr>
				</table>
				<table>
					<tr class="btn-area">
							<td colspan="3">
								<button onclick="changeEquipment();">장비 교체</button>
							</td>
						</tr>
				</table>
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
// 			for (var i = 0; i < 2; i++) {
				<c:forEach items="${emp }" var="emp" varStatus="s">
					var option = document.createElement('option');
					option.innerText = "${emp.M_NAME}(${emp.M_DEPART})";
					option.value = "${emp.CODE}";
					
					if('${emp.CODE}' === code1) {
						option.selected = 'true';
					}
					
					target[0].append(option);
				</c:forEach>
				
				<c:forEach items="${emp }" var="emp" varStatus="s">
					var option = document.createElement('option');
					option.innerText = "${emp.M_NAME}(${emp.M_DEPART})";
					option.value = "${emp.CODE}";
					
					if('${emp.CODE}' === code2) {
						option.selected = 'true';
					}
					
					target[1].append(option);
				</c:forEach>

// 			}
			console.log(table);
			console.log('${equip1}');
			console.log('${equip2}');
			if(table === '핸드폰') document.getElementById('phone-ability').style.display = 'block';
			else if(table === '모니터') document.getElementById('monitor-ability').style.display = 'block';
			else if(table === 'pc') document.getElementById('pc-ability').style.display = 'block';
			
			
			var input = document.getElementsByTagName('input');
			// 데이터 로드
			if(table === 'pc') {
				input[name='pc_division1'].value='${equip1.DIVISION}';
				input[name='pc_os1'].value='${equip1.OS}';
				input[name='pc_cpu1'].value='${equip1.CPU}';
				input[name='pc_ram1'].value='${equip1.RAM}';
				input[name='pc_gpu1'].value='${equip1.GPU}';
				input[name='pc_capacity1'].value='${equip1.CAPACITY}';
				
				input[name='pc_division2'].value='${equip2.DIVISION}';
				input[name='pc_os2'].value='${equip2.OS}';
				input[name='pc_cpu2'].value='${equip2.CPU}';
				input[name='pc_ram2'].value='${equip2.RAM}';
				input[name='pc_gpu2'].value='${equip2.GPU}';
				input[name='pc_capacity2'].value='${equip2.CAPACITY}';
				
			} else if(table === '핸드폰') {
				input[name='p_ap1'].value='${equip1.AP}';
				input[name='p_os1'].value='${equip1.OS}';
				input[name='p_cpu1'].value='${equip1.CPU}';
				input[name='p_ram1'].value='${equip1.RAM}';
				input[name='p_battery1'].value='${equip1.BATTERY}';
				input[name='p_capacity1'].value='${equip1.CAPACITY}';
				
				input[name='p_ap2'].value='${equip2.AP}';
				input[name='p_os2'].value='${equip2.OS}';
				input[name='p_cpu2'].value='${equip2.CPU}';
				input[name='p_ram2'].value='${equip2.RAM}';
				input[name='p_battery2'].value='${equip2.BATTERY}';
				input[name='p_capacity2'].value='${equip2.CAPACITY}';
				
			} else if(table === '모니터') {
				input[name='mo_pannel1'].value='${equip1.PANNEL}';
				input[name='mo_Hz1'].value='${equip1.HZ}';
				input[name='mo_resolution1'].value='${equip1.RESOLUTION}';
				input[name='mo_speed1'].value='${equip1.SPEED}';
				input[name='mo_shape1'].value='${equip1.SHAPE}';
				
				input[name='mo_pannel2'].value='${equip2.PANNEL}';
				input[name='mo_Hz2'].value='${equip2.HZ}';
				input[name='mo_resolution2'].value='${equip2.RESOLUTION}';
				input[name='mo_speed2'].value='${equip2.SPEED}';
				input[name='mo_shape2'].value='${equip2.SHAPE}';
				
			}
		}

		// 테이블 숨김
		function hideTable() {
			document.getElementById('phone-ability').style.display = 'none';
			document.getElementById('pc-ability').style.display = 'none';
			document.getElementById('monitor-ability').style.display = 'none';
		}

		// 항목 선택하면 테이블 표시
		function showEquipment() {
			var target = document.getElementById('gubun');
			var selected = target.options[target.selectedIndex].value;

			hideTable();

			if (selected === 'pc') {
				document.getElementById('pc-ability').style.display = 'block';
			} else if (selected === '핸드폰') {
				document.getElementById('phone-ability').style.display = 'block';
			} else if (selected === '모니터') {
				document.getElementById('monitor-ability').style.display = 'block';
			}
		}

		// 성능 정보 가져오기
		function getEquipment() {
			// 테이블
			var gubun = document.getElementById('gubun');
			var selected = gubun.options[gubun.selectedIndex].value;

			// 사원번호
			var target = document.getElementsByClassName('emp');
			var code1 = target[0].options[target[0].selectedIndex].value;
			var code2 = target[1].options[target[1].selectedIndex].value;

			// 			console.log(code1, code2, selected);

			if (selected === '') {
				alert('항목을 선택하세요.');
			} else if (code1 === '' || code2 === '') {
				alert('사원을 선택하세요.');
			} else {
				frm.action = '/equipment/compare';
				frm.submit();
			}

		}
		
		// 장비 교체 버튼 클릭
		function changeEquipment() {
			frm.action = '/equipment/changeEquipment';
			frm.submit();
		}
	</script>
	</body>
</html>