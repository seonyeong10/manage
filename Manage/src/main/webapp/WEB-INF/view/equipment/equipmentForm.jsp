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
			<div class="section-title">장비 등록</div>
			<form action="insertEquipment" method="post" name="frm"
				modelAttribute="equipmentCommand" onsubmit="return checkParam();">
				<table>
					<tr>
						<td>구분</td>
						<td>
							<select name="gubun" onchange="getColumn();" id="gubun">
								<option value="">항목을 선택해주세요.</option>
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
						<td><input type="text" name="name" /></td>
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
								<input type="submit" value="등록" class="btn submit"/>
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
							<td><input type="text" name="p_cpu" /></td>
						</tr>
						<tr>
							<td>RAM</td>
							<td><input type="text" name="p_ram" /></td>
						</tr>
						<tr>
							<td>저장공간</td>
							<td><input type="text" name="p_capacity" /></td>
						</tr>
						<tr>
							<td>배터리</td>
							<td><input type="text" name="p_battery" /></td>
						</tr>
					</tbody>
					<tbody id="pc-ability">
						<tr>
							<td colspan="2" class="equip-title">PC</td>
						</tr>
						<tr>
							<td>pc_division</td>
							<td><input type="text" name="pc_division" /></td>
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
							<td><input type="text" name="pc_ram" /></td>
						</tr>
						<tr>
							<td>GPU</td>
							<td><input type="text" name="pc_gpu" /></td>
						</tr>
						<tr>
							<td>저장공간</td>
							<td><input type="text" name="pc_capacity" /></td>

						</tr>
					</tbody>
					<tbody id="monitor-ability">
						<tr>
							<td colspan="2" class="equip-title">모니터</td>
						</tr>
						<tr>
							<td>패널</td>
							<td><input type="text" name="mo_pannel" /></td>
						</tr>
						<tr>
							<td>화면 주사율(Hz)</td>
							<td><input type="text" name="mo_Hz" /></td>
						</tr>
						<tr>
							<td>해상도(픽셀)</td>
							<td><input type="text" name="mo_resolution" /></td>
						</tr>
						<tr>
							<td>응답속도(ms)</td>
							<td><input type="text" name="mo_speed" /></td>
						</tr>
						<tr>
							<td>형태</td>
							<td><input type="text" name="mo_shape" /></td>
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
			if(param[name='gubun'].value == '' || param[name='gubun'].value == null){
				alert('항목을 선택하세요.');
				param[name='gubun'].focus();
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