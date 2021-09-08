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
			<form id="frm" method="post">
			<div class="section-title">장비 상세정보</div>
				<input type="hidden" name="code" value="${item.CODE }" /> <input
					type="hidden" name="m_code" value="${item.M_CODE }" />
				<table>
					<tr>
						<td>구분</td>
						<td><input type="text" name="gubun" value=""
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>소유자</td>
						<td><input type="text" name="owner" value=""
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><input type="text" name="manufacture" value=""
							readonly="readonly" /></td>
					</tr>
				</table>
				<table id="monitor">
					<tr>
						<td>제품명</td>
						<td><input type="text" name="mo_name" value="" /></td>
					</tr>
					<tr>
						<td>패널</td>
						<td><input type="text" name="mo_pannel" value="" /></td>
					</tr>
					<tr>
						<td>주사율(hz)</td>
						<td><input type="text" name="mo_hz" value="" /></td>
					</tr>
					<tr>
						<td>해상도</td>
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
						<td><input type="text" name="mo_speed" value="" /></td>
					</tr>
					<tr>
						<td>형태</td>
						<td>
							<select name="mo_shape">
									<option value="">형태를 선택하세요.</option>
									<option value="100">커브</option>
									<option value="200">와이드</option>
									<option value="300">평면</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="btn-area">
							<button onclick="updateMonitor();" class="btn submit">수정</button>
							<button onclick="delEquipment();" class="btn">삭제</button>
						</td>
					</tr>
				</table>
				<table id="pc">
					<tr>
						<td>종류</td>
						<td>
							<select name="pc_division">
								<option value="">PC 구분을 선택하세요.</option>
								<option value="100">데스크탑</option>
								<option value="200">노트북</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제품명</td>
						<td><input type="text" name="pc_name" value="" /></td>
					</tr>
					<tr>
						<td>OS</td>
						<td><input type="text" name="pc_os" value="" /></td>
					</tr>
					<tr>
						<td>CPU</td>
						<td><input type="text" name="pc_cpu" value="" /></td>
					</tr>
					<tr>
						<td>RAM(GB)</td>
						<td><input type="text" name="pc_ram" value="" /></td>
					</tr>
					<tr>
						<td>GPU</td>
						<td><input type="text" name="pc_gpu" value="" /></td>
					</tr>
					<tr>
						<td>저장공간(GB)</td>
						<td><input type="text" name="pc_capacity" value="" /></td>
					</tr>
					<tr>
						<td colspan="2" class="btn-area">
							<button onclick="updatePC();" class="btn submit">수정</button>
							<button onclick="delEquipment();" class="btn">삭제</button>
						</td>
					</tr>
				</table>
				<table id="phone">
					<tr>
						<td>제품명</td>
						<td><input type="text" name="p_name" value="" /></td>
					</tr>
					<tr>
						<td>AP</td>
						<td><input type="text" name="p_ap" value="" /></td>
					</tr>
					<tr>
						<td>OS</td>
						<td><input type="text" name="p_os" value="" /></td>
					</tr>
					<tr>
						<td>CPU</td>
						<td><input type="text" name="p_cpu" value="" /></td>
					</tr>
					<tr>
						<td>RAM(GB)</td>
						<td><input type="text" name="p_ram" value="" /></td>
					</tr>
					<tr>
						<td>저장공간(GB)</td>
						<td><input type="text" name="p_capacity" value="" /></td>
					</tr>
					<tr>
						<td>배터리(mAh)</td>
						<td><input type="text" name="p_battery" value="" /></td>
					</tr>
					<tr>
						<td colspan="2" class="btn-area">
							<button onclick="updatePhone();" class="btn submit">수정</button>
							<button onclick="delEquipment();" class="btn">삭제</button>
						</td>
					</tr>
				</table>
				<table id="equipment"></table>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	window.onload = getInfo();

	function getInfo() {
		
		document.getElementById('monitor').style.display = 'none';
		document.getElementById('pc').style.display = 'none';
		document.getElementById('phone').style.display = 'none';

		var tag = document.getElementsByTagName('input');
		var select = document.getElementsByTagName('select');
		if ("${item.GUBUN}" === '모니터') {
			document.getElementById('monitor').style.display = 'block';
			tag.gubun.value = '${item.GUBUN}';
			tag.owner.value = '${item.M_NAME}';
			tag.mo_name.value = '${item.NAME}';
			tag.manufacture.value = '${item.MA_NAME}';
			tag.mo_pannel.value = '${item.PANNEL}';
			tag.mo_hz.value = '${item.HZ}';
			select.mo_resolution.value = '${item.RESOLUTION}';
			tag.mo_speed.value = '${item.SPEED}';
			select.mo_shape.value = '${item.SHAPE}';

		} else if ("${item.GUBUN}" === 'PC') {
			document.getElementById('pc').style.display = 'block';
			tag.gubun.value = '${item.GUBUN}';
			tag.pc_name.value = '${item.NAME}';
			tag.manufacture.value = '${item.MA_NAME}';
			tag.pc_os.value = '${item.OS}';
			tag.pc_cpu.value = '${item.CPU}';
			tag.pc_ram.value = '${item.RAM}';
			tag.pc_gpu.value = '${item.GPU}';
			tag.pc_capacity.value = '${item.CAPACITY}';
			tag.owner.value = '${item.M_NAME}';
			select.pc_division.value = '${item.DIVISION}';

		} else if ("${item.GUBUN}" === '핸드폰') {
			document.getElementById('phone').style.display = 'block';
			tag.gubun.value = '${item.GUBUN}';
			tag.p_name.value = '${item.NAME}';
			tag.manufacture.value = '${item.MA_NAME}';
			tag.p_os.value = '${item.OS}';
			tag.p_cpu.value = '${item.CPU}';
			tag.p_ram.value = '${item.RAM}';
			tag.p_ap.value = '${item.AP}';
			tag.p_capacity.value = '${item.CAPACITY}';
			tag.p_battery.value = '${item.BATTERY}';
			tag.owner.value = '${item.M_NAME}';
		}
		
	}

	// 장비 정보 수정
	var frm = document.getElementById('frm');
	function updateMonitor() {
		frm.action = 'updateMonitor';
		frm.method = 'post';
		frm.submit();
	}

	function updatePC() {
		frm.action = 'updatePC';
		frm.method = 'post';
		frm.submit();
	}

	function updatePhone() {
		frm.action = 'updatePhone';
		frm.method = 'post';
		frm.submit();
	}

	// 장비 정보 삭제
	function delEquipment() {
		frm.action = 'delEquipment';
		frm.method = 'post';
		frm.submit();
	}
</script>
</html>