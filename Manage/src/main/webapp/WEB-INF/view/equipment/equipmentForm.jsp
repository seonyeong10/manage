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
			<form action="insertEquipment" method="post" name="frm"
				modelAttribute="equipmentCommand" onsubmit="return checkParam();">
			<div class="section-title">장비 등록</div>
				<table>
					<tr>
						<td>구분</td>
						<td>
							<select name="gubun" onchange="getColumn();" id="gubun">
								<option value="">항목을 선택하세요.</option>
								<option value="100">PC</option>
								<option value="300">모니터</option>
								<option value="400">핸드폰</option>
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
						<td>제품명</td>
						<td><input type="text" name="name" required="required"/></td>
					</tr>
					<tr>
						<td>제조사</td>
						<td>
							<select name="m_code" id="man">
								<option value="">제조사를 선택하세요.</option>
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

					<tbody id="phone-ability">
						<tr>
							<td colspan="2" class="equip-title">핸드폰</td>
						</tr>
						<tr>
							<td>AP칩셋</td>
							<td><input type="text" name="p_ap" /></td>
						</tr>
						<tr>
							<td>운영체제</td>
							<td><input type="text" name="p_os" /></td>
						</tr>
						<tr>
							<td>CPU</td>
							<td><input type="text" name="p_cpu"/></td>
						</tr>
						<tr>
							<td>RAM</td>
							<td><input type="text" name="p_ram" pattern="[0-9]+" ></td>
						</tr>
						<tr>
							<td>저장공간</td>
							<td><input type="text" name="p_capacity" pattern="[0-9]+" /></td>
						</tr>
						<tr>
							<td>배터리</td>
							<td><input type="text" name="p_battery" pattern="[0-9]+" /></td>
						</tr>
					</tbody>
					<tbody id="pc-ability">
						<tr>
							<td colspan="2" class="equip-title">PC</td>
						</tr>
						<tr>
							<td>pc_division</td>
							<td>
								<select name="pc_division">
									<option value="">PC 구분을 선택하세요.</option>
									<option value="100">데스크탑</option>
									<option value="200">노트북</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>운영체제</td>
							<td><input type="text" name="pc_os" /></td>
						</tr>
						<tr>
							<td>CPU</td>
							<td><input type="text" name="pc_cpu" /></td>
						</tr>
						<tr>
							<td>RAM</td>
							<td><input type="text" name="pc_ram" pattern="[0-9]+" /></td>
						</tr>
						<tr>
							<td>GPU</td>
							<td><input type="text" name="pc_gpu" /></td>
						</tr>
						<tr>
							<td>저장공간</td>
							<td><input type="text" name="pc_capacity" pattern="[0-9]+" /></td>

						</tr>
					</tbody>
					<tbody id="monitor-ability">
						<tr>
							<td colspan="2" class="equip-title">모니터</td>
						</tr>
						<tr>
							<td>패널</td>
							<td><input type="text" name="mo_pannel"/></td>
						</tr>
						<tr>
							<td>화면 주사율(Hz)</td>
							<td><input type="text" name="mo_Hz" pattern="[0-9]+" /></td>
						</tr>
						<tr>
							<td>해상도(픽셀)</td>
							<td>
								<select name="mo_resolution">
									<option value="">해상도를 선택하세요.</option>
									<option value="HD(1280 x 720)">HD(1280 x 720)</option>
									<option value="1680 x 1050">1680 x 1050</option>
									<option value="FHD(1920 x 1080)">FHD(1920 x 1080)</option>
									<option value="QHD/WQHD(2560 x 1440)">QHD/WQHD(2560 x 1440)</option>
									<option value="4K UHD(3840 x 2160)">4K UHD(3840 x 2160)</option>
									<option value="8K UHD(7680 x 4320)">8K UHD(7680 x 4320)</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>응답속도(ms)</td>
							<td><input type="text" name="mo_speed" pattern="[0-9]+" /></td>
						</tr>
						<tr>
							<td>형태</td>
							<td>
								<select name="mo_shape">
									<option value="">형태를 선택하세요.</option>
									<option value="100">커브드</option>
									<option value="200">와이드</option>
									<option value="300">평면</option>
								</select>
							</td>
						</tr>
					</tbody>

				</table>

			</form>
		</div>
	</div>

	<script type="text/javascript">
	var param = document.getElementsByTagName('input');
	var select = document.getElementsByTagName('select');
	
		// 폼 전송
		function checkParam() {
			var gubun = select[name='gubun'].value;
			if(gubun == '' || gubun == null){
				alert('항목을 선택하세요.');
				select[name='gubun'].focus();
				return false;
			}
			
			// 테이블 별 파라미터 형식 확인
			if(gubun === '100') {
				// pc
				checkPcParam();
				
			} else if(gubun === '300') {
				// 모니터
				checkMonitorParam();
				
			} else if(gubun === '400') {
				// 핸드폰
				checkPhoneParam();
			}
			
		}
		
		function checkPhoneParam() {
			console.log(param[name='p_ap'].value);
			if(param[name='p_ap'].value == '' || param[name='p_ap'].value == null){
				alert('AP를 입력하세요.');
				param[name='p_ap'].focus();
				return false;
			} else if(param[name='p_os'].value == '' || param[name='p_os'].value == null){
				alert('OS를 입력하세요.');
				param[name='p_os'].focus();
				return false;
			} else if(param[name='p_cpu'].value == '' || param[name='p_cpu'].value == null){
				alert('CPU를 입력하세요.');
				param[name='p_cpu'].focus();
				return false;
			} else if(param[name='p_ram'].value == '' || param[name='p_ram'].value == null){
				alert('RAM을 입력하세요.');
				param[name='p_ram'].focus();
				return false;
			} else if(param[name='p_capacity'].value == '' || param[name='p_capacity'].value == null){
				alert('저장공간을 입력하세요.');
				param[name='p_capacity'].focus();
				return false;
			} else if(param[name='p_battery'].value == '' || param[name='p_battery'].value == null){
				alert('배터리 용량을 입력하세요.');
				param[name='p_battery'].focus();
				return false;
			} 
		}
		
		function checkMonitorParam() {
			if(param[name='mo_pannel'].value == '' || param[name='mo_pannel'].value == null){
				alert('PANNEL을 입력하세요.');
				param[name='mo_pannel'].focus();
				return false;
			} else if(param[name='mo_Hz'].value == '' || param[name='mo_Hz'].value == null){
				alert('주사율을 입력하세요.');
				param[name='mo_Hz'].focus();
				return false;
			} else if(select[name='mo_resolution'].value == '' || select[name='mo_resolution'].value == null){
				alert('해상도를 입력하세요.');
				select[name='mo_resolution'].focus();
				return false;
			} else if(param[name='mo_speed'].value == '' || param[name='mo_speed'].value == null){
				alert('응답속도를 입력하세요.');
				param[name='mo_speed'].focus();
				return false;
			} else if(select[name='mo_shape'].value == '' || select[name='mo_shape'].value == null){
				alert('형태 입력하세요.');
				select[name='mo_shape'].focus();
				return false;
			} 
		}
		
		function checkPcParam() {
			if(select[name='pc_division'].value == '' || select[name='pc_division'].value == null){
				alert('PC구분을 선택하세요.');
				select[name='pc_division'].focus();
				return false;
			} else if(param[name='pc_os'].value == '' || param[name='pc_os'].value == null){
				alert('OS를 입력하세요.');
				param[name='pc_os'].focus();
				return false;
			} else if(param[name='pc_cpu'].value == '' || param[name='pc_cpu'].value == null){
				alert('CPU를 입력하세요.');
				param[name='pc_cpu'].focus();
				return false;
			} else if(param[name='pc_ram'].value == '' || param[name='pc_ram'].value == null){
				alert('RAM을 입력하세요.');
				param[name='pc_ram'].focus();
				return false;
			} else if(param[name='pc_gpu'].value == '' || param[name='pc_gpu'].value == null){
				alert('GPU를 입력하세요.');
				param[name='pc_gpu'].focus();
				return false;
			} else if(param[name='pc_capacity'].value == '' || param[name='pc_capacity'].value == null){
				alert('저장공간을 입력하세요.');
				param[name='pc_capacity'].focus();
				return false;
			}
		}
		
		
		// 장비 정보 입력 폼 선택
		function getColumn() {
			
			var gubun = document.getElementById('gubun').options[document
					.getElementById('gubun').selectedIndex].value;
			var category = null;

			// gubun에 따라 tBody 변경
			if (gubun === '100') {
				category = document.getElementById('pc-ability');
				
			} else if (gubun === '300') {
				category = document.getElementById('monitor-ability');
				
			} else if (gubun === '400') {
				category = document.getElementById('phone-ability');
				
			}

			load(); // 화면 초기화
			category.style.display = 'block';
			
			getManufactures(gubun);
		
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
			document.getElementById('phone-ability').style.display = 'none';
			document.getElementById('pc-ability').style.display = 'none';
			document.getElementById('monitor-ability').style.display = 'none';
			
			// 사원 리스트
			// option 초기화
			$('#emp').children('option:not(:first)').remove();
			var target = document.getElementById('emp');
			
			<c:forEach items="${emp }" var="emp" varStatus="s">
				var option = document.createElement('option');
				option.innerText = "${emp.M_NAME}(${emp.M_DEPART})";
				option.value = "${emp.CODE}";
				target.append(option);
			</c:forEach>
			
		}
	</script>
</body>
</html>