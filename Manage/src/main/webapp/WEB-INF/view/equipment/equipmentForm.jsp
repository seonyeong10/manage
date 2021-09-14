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
	<%@ include file="../include/top.jsp" %>
	<div id="content">
	<%@ include file="../include/left.jsp" %>
		<div id="right">
			<form action="insert" method="post" name="frm"
				modelAttribute="equipmentCommand" onsubmit="return checkParam();">
			<div class="section-title">장비 등록</div>
				<table>
					<tr>
						<td>구분</td>
						<td>
							<select name="gubun" onchange="getColumn();" id="gubun">
								<option value="">항목을 선택하세요.</option>
								<option value="PC">PC</option>
								<option value="MONITOR">모니터</option>
								<option value="PHONE">핸드폰</option>
							</select>
						
						</td>
					</tr>
					<tr>
						<td>소유자</td>
						<td>
							<select name="code" id="emp">
								<option value="">사원을 선택하세요.</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제품</td>
						<td>
							<select name="id" id="device" onchange="getDeviceInfo();">
								<option value="">제품을 선택하세요.</option>
							</select>
						</td>
					</tr>
				</table>
				<table>
					<thead>
					</thead>
					<tfoot>
						<tr>
							<td colspan="2" class="btn-area">
								<input type="submit" value="등록" class="btn submit" />
								<button onclick="goMain();" class="btn">취소</button>
							</td>
						</tr>
					</tfoot>

					<tbody id="phone-ability" class="ability-box">
						<tr>
							<td colspan="2" class="equip-title">핸드폰</td>
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
							<td>RAM</td>
							<td><span class="ability" id="p_ram"></span></td>
						</tr>
						<tr>
							<td>저장공간</td>
							<td><span class="ability" id="p_capacity"></span></td>
						</tr>
						<tr>
							<td>배터리</td>
							<td><span class="ability" id="p_battery"></span></td>
						</tr>
					</tbody>
					<tbody id="pc-ability" class="ability-box">
						<tr>
							<td colspan="2" class="equip-title">PC</td>
						</tr>
						<tr>
							<td>pc_division</td>
							<td><span class="ability" id="pc_division"></span></td>
						</tr>
						<tr>
							<td>운영체제</td>
							<td><span class="ability" id="pc_os"></span></td>
						</tr>
						<tr>
							<td>CPU</td>
							<td><span class="ability" id="pc_cpu"></span></td>
						</tr>
						<tr>
							<td>RAM</td>
							<td><span class="ability" id="pc_ram"></span></td>
						</tr>
						<tr>
							<td>GPU</td>
							<td><span class="ability" id="pc_gpu"></span></td>
						</tr>
						<tr>
							<td>저장공간</td>
							<td><span class="ability" id="pc_capacity"></span></td>

						</tr>
					</tbody>
					<tbody id="monitor-ability" class="ability-box">
						<tr>
							<td colspan="2" class="equip-title">모니터</td>
						</tr>
						<tr>
							<td>패널</td>
							<td><span class="ability" id="mo_pannel"></span></td>
						</tr>
						<tr>
							<td>화면 주사율(Hz)</td>
							<td><span class="ability" id="mo_hz"></span></td>
						</tr>
						<tr>
							<td>해상도(픽셀)</td>
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
					</tbody>

				</table>

			</form>
		</div>
	</div>

	<script type="text/javascript">
	var param = document.getElementsByTagName('input');
	var select = document.getElementsByTagName('select');
	
		// 제품 상세정보
		function getDeviceInfo() {
			var target = document.getElementsByTagName('select')[name='id'];
			var id = target.options[target.selectedIndex].value;
			var gubun = select[name='gubun'].value;
			
			$.ajax({
				type : "POST"
				,url : "/equipment/getDeviceInfo"
				,data : {"id" : id}
				,dataType : "json"
				,error : function(request, stataus, error) {
					console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
				}
				,success : function(responseText, statusText, xhr) {
					var msg = responseText.message;
					var item = responseText.item;
					
					console.log(item[0].DIVISION);
					if(gubun === 'PC') {
						document.getElementById('pc_division').innerText = item[0].DIVISION;
						document.getElementById('pc_os').innerText = item[0].OS;
						document.getElementById('pc_cpu').innerText = item[0].CPU;
						document.getElementById('pc_ram').innerText = item[0].RAM + ' GB';
						document.getElementById('pc_gpu').innerText = item[0].GPU;
						document.getElementById('pc_capacity').innerText = item[0].CAPACITY + ' GB';
					
					} else if(gubun === 'MONITOR') {
						document.getElementById('mo_pannel').innerText = item[0].PANNEL;
						document.getElementById('mo_hz').innerText = item[0].HZ + ' hz';
						document.getElementById('mo_resolution').innerText = item[0].RESOLUTION;
						document.getElementById('mo_speed').innerText = item[0].SPEED + ' ms';
						document.getElementById('mo_shape').innerText = item[0].SHAPE;
						
					} else if(gubun === 'PHONE') {
						document.getElementById('p_ap').innerText = item[0].AP;
						document.getElementById('p_os').innerText = item[0].OS;
						document.getElementById('p_cpu').innerText = item[0].CPU;
						document.getElementById('p_ram').innerText = item[0].RAM + ' GB';
						document.getElementById('p_capacity').innerText = item[0].CAPACITY + ' GB';
						document.getElementById('p_battery').innerText = item[0].BATTERY + ' mAh';
						
					}
				}
			});
		}
		
		// 제품 선택
		function getDevice() {
			var gubun = select[name='gubun'].value;
			
			if(gubun != '' && gubun != null){
				// option 초기화
				$('#device').children('option:not(:first)').remove();
				
				$.ajax({
					type : "POST"
					,url : "/equipment/getDevice"
					,data : {"gubun" : gubun}
					,dataType : "json"
					,error : function(request, stataus, error) {
						console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
					}
					,success : function(responseText, statusText, xhr) {
						var msg = responseText.message;
						var list = responseText.list;
						
						var target = document.getElementsByTagName('select')[name='id'];
						
						for(var i=0 ; i < list.length ; i++) {
							var option = document.createElement('option');
							option.innerText = list[i].NAME;
							option.value =  list[i].ID;
							target.append(option);
						}
					}
				});
				
			} else {
				alert('항목을 선택하세요.');
			}
		}
		
		// 폼 전송
		function checkParam() {
			var gubun = select[name='gubun'].value;
			var emp = select[name='code'].value;
			var device = select[name='id'].value;
			
			if(gubun == '' || gubun == null){
				alert('항목을 선택하세요.');
				select[name='gubun'].focus();
				return false;
			} else if(emp == '' || emp == null){
				alert('항목을 선택하세요.');
				select[name='gubun'].focus();
				return false;
			} else if(device == '' || device == null){
				alert('항목을 선택하세요.');
				select[name='gubun'].focus();
				return false;
			}
			
		}
		
		// 장비 정보 입력 폼 선택
		function getColumn() {
			
			var gubun = document.getElementById('gubun').options[document.getElementById('gubun').selectedIndex].value;
			var category = null;
			var phone = document.getElementById('phone-ability');
			var pc = document.getElementById('pc-ability');
			var monitor = document.getElementById('monitor-ability');

			hideTable(); // 화면 초기화
			
			// gubun에 따라 tBody 변경
			if (gubun === 'PC') {
				pc.classList.remove('ability-box');
				
			} else if (gubun === 'MONITOR') {
				monitor.classList.remove('ability-box');
				
			} else if (gubun === 'PHONE') {
				phone.classList.remove('ability-box');
				
			}

			
			getDevice(gubun);
		
		}
		
		function hideTable() {
			var phone = document.getElementById('phone-ability');
			var pc = document.getElementById('pc-ability');
			var monitor = document.getElementById('monitor-ability');
			
			phone.classList.add('ability-box');
			pc.classList.add('ability-box');
			monitor.classList.add('ability-box');
		}
		
		// 제조사 리스트
		function getManufactures(gubun) {
			target = document.getElementById('man');
			
			// option 초기화
			$('#man').children('option:not(:first)').remove();
			
			// 선택한 구분 항목을 제조하는 제조사 출력
			$.ajax({
				type : "post"
				,url : "/equipment/getManufactures"
				,data : {"ma_kinds" : gubun}
				,dataType : "json"
				,error : function(request, stataus, error) {
					console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
				}
				,success : function(responseText, statusText, xhr) {
					var msg = responseText.message;
					var man = responseText.man;
					for(var i=0 ; i < man.length ; i++) {
						var option = document.createElement('option');
						option.innerText = man[i].MA_NAME;
						option.value =  man[i].MA_CODE;
						target.append(option);
					}
				}
			});
			
		}

		function goMain() {
			location.href = "/equipment";
		}

		window.onload = load();

		function load() {
// 			document.getElementById('phone-ability').style.display = 'none';
// 			document.getElementById('pc-ability').style.display = 'none';
// 			document.getElementById('monitor-ability').style.display = 'none';
			
			// 사원 리스트
			// option 초기화
			$('#emp').children('option:not(:first)').remove();
			var target = document.getElementById('emp');
			
			<c:forEach items="${emp }" var="emp" varStatus="s">
				var option = document.createElement('option');
				option.innerText = "${emp.M_NAME}(${emp.D_NAME})";
				option.value = "${emp.CODE}";
				target.append(option);
			</c:forEach>
			
		}
	</script>
</body>
</html>