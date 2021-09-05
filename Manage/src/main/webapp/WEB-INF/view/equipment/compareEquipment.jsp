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
<%-- <link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet" --%>
<!-- 	type="text/css" /> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<div class="section-title">장비 성능 비교</div>
			<div>
				<table>
					<thead>
						<tr>
							<td>
								<select name="code1" class="emp" onchange="getEquipment(this.value);">
									<option>사원을 선택하세요.</option>
								</select>
							<br />공공사업팀</td>
							<td>
								<select name="gubun" onchange="showEquipment();" id="gubun">
									<option value="">항목을 선택하세요.</option>
									<option value="100">PC</option>
									<option value="400">핸드폰</option>
									<option value="200">모니터</option>
								</select>
							</td>
							<td>
								<select name="code2" class="emp">
									<option>사원을 선택하세요.</option>
								</select>
								<br />공공사업팀
							</td>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="3">
								<button onclick="">장비 교체</button>
							</td>
						</tr>
					</tfoot>
					<tbody id="phone-ability">
<!-- 						<tr> -->
<!-- 							<td colspan="2" class="equip-title">핸드폰</td> -->
<!-- 						</tr> -->
						<tr>
							<td><input type="text" name="p_ap1" /></td>
							<td>AP칩셋</td>
							<td><input type="text" name="p_ap2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="p_os1" /></td>
							<td>운영체제</td>
							<td><input type="text" name="p_os2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="p_cpu1" /></td>
							<td>CPU</td>
							<td><input type="text" name="p_cpu2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="p_ram1" /></td>
							<td>RAM</td>
							<td><input type="text" name="p_ram2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="p_capacity1" /></td>
							<td>저장공간</td>
							<td><input type="text" name="p_capacity2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="p_battery1" /></td>
							<td>배터리</td>
							<td><input type="text" name="p_battery2" /></td>
						</tr>
					</tbody>
					<tbody id="pc-ability">
<!-- 						<tr> -->
<!-- 							<td colspan="2" class="equip-title">PC</td> -->
<!-- 						</tr> -->
						<tr>
							<td><input type="text" name="pc_division1" /></td>
							<td>pc_division</td>
							<td><input type="text" name="pc_division2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_os1" /></td>
							<td>운영체제</td>
							<td><input type="text" name="pc_os2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_cpu1" /></td>
							<td>CPU</td>
							<td><input type="text" name="pc_cpu2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_ram1" /></td>
							<td>RAM</td>
							<td><input type="text" name="pc_ram2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_gpu1" /></td>
							<td>GPU</td>
							<td><input type="text" name="pc_gpu2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="pc_capacity1" /></td>
							<td>저장공간</td>
							<td><input type="text" name="pc_capacity2" /></td>

						</tr>
					</tbody>
					<tbody id="monitor-ability">
<!-- 						<tr> -->
<!-- 							<td colspan="2" class="equip-title">모니터</td> -->
<!-- 						</tr> -->
						<tr>
							<td><input type="text" name="mo_pannel1" /></td>
							<td>패널</td>
							<td><input type="text" name="mo_pannel2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_Hz1" /></td>
							<td>화면 주사율(Hz)</td>
							<td><input type="text" name="mo_Hz2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_resolution1" /></td>
							<td>해상도(픽셀)</td>
							<td><input type="text" name="mo_resolution2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_speed1" /></td>
							<td>응답속도(ms)</td>
							<td><input type="text" name="mo_speed2" /></td>
						</tr>
						<tr>
							<td><input type="text" name="mo_shape1" /></td>
							<td>형태</td>
							<td><input type="text" name="mo_shape2" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>

	</div>
	<script type="text/javascript">
	
		window.onload = tableLoad();
		
		function tableLoad() {
			hideTable();
			
			// select option 추가
			var target = document.getElementsByClassName('emp');
			for(var i=0 ; i < 2 ; i++) {
				<c:forEach items="${emp }" var="emp" varStatus="s">
					var option = document.createElement('option');
					option.innerText = "${emp.M_NAME}(${emp.M_DEPART})";
					option.value = "${emp.CODE}";
					target[i].append(option);
				</c:forEach>
				
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
			
			if(selected === '100') {
				document.getElementById('pc-ability').style.display = 'block';
			} else if(selected === '400') {
				document.getElementById('phone-ability').style.display = 'block';
			} else if(selected === '300') {
				document.getElementById('monitor-ability').style.display = 'block';
			}
		}
		
		// 성능 정보 가져오기
		function getEquipment(target) {
			var gubun = document.getElementById('gubun');
			var selected = gubun.options[gubun.selectedIndex].value;
		
			if(selected === '') {
				alert('항목을 선택해주세요.');
				return;
			}
// 			status = {
// 					type : "post"
// 					,url : "getEquipmentAbility"
// 					,dataType : "json"
// 					,data : {"code" : target, }
// 			}
		}
	
	</script>
</body>
</html>