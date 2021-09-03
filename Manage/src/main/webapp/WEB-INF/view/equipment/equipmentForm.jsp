<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Equipment</title>
</head>
<body>

<form action="insertEquipment" method="post" name="frm" modelAttribute="equipmentCommand">
	구분 
	<select name="gubun" onchange="getColumn();" id="gubun" >
		<option value="000">====</option>
		<option value="100">PC</option>
		<option value="300">모니터</option>
		<option value="400">핸드폰</option>
	</select>
	<table>
		<tr>
			<td>사번</td>
			<td><input type="text" name="code"/></td>
		</tr>
		<tr>
			<td>제품명</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>제조사</td>
			<td><input type="text" name="m_code"/></td>
		</tr>
	</table>
	<table>
		<thead>
		</thead>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록"/>
					<button onclick="goMain();">취소</button>
				</td>
			</tr>
		</tfoot>
		
		<tbody id="phone-ability">
			<tr>
				<td>AP칩셋</td>
				<td><input type="text" name="p_ap"/></td>
			</tr>
			<tr>
				<td>운영체제</td>
				<td><input type="text" name="p_os"/></td>
			</tr>
			<tr>
				<td>CPU</td>
				<td><input type="text" name="p_cpu"/></td>
			</tr>
			<tr>
				<td>RAM</td>
				<td><input type="text" name="p_ram"/></td>
			</tr>
			<tr>
				<td>저장공간</td>
				<td><input type="text" name="p_capacity"/></td>
			</tr>
			<tr>
				<td>배터리</td>
				<td><input type="text" name="p_battery"/></td>
			</tr>
		</tbody>
		<tbody id="pc-ability">
			<tr>
				<td>pc_division</td>
				<td><input type="text" name="pc_division"/></td>
			</tr>
			<tr>
				<td>운영체제</td>
				<td><input type="text" name="pc_os"/></td>
			</tr>
			<tr>
				<td>CPU</td>
				<td><input type="text" name="pc_cpu"/></td>
			</tr>
			<tr>
				<td>RAM</td>
				<td><input type="text" name="pc_ram"/></td>
			</tr>
			<tr>
				<td>GPU</td>
				<td><input type="text" name="pc_gpu"/></td>
			</tr>
			<tr>
				<td>저장공간</td>
				<td><input type="text" name="pc_capacity"/></td>
	
			</tr>
		</tbody>
		<tbody id="monitor-ability">
			<tr>
				<td>패널</td>
				<td><input type="text" name="mo_pannel"/></td>
			</tr>
			<tr>
				<td>화면 주사율(Hz)</td>
				<td><input type="text" name="mo_Hz"/></td>
			</tr>
			<tr>
				<td>해상도(픽셀)</td>
				<td><input type="text" name="mo_resolution"/></td>
			</tr>
			<tr>
				<td>응답속도(ms)</td>
				<td><input type="text" name="mo_speed"/></td>
			</tr>
			<tr>
				<td>형태</td>
				<td><input type="text" name="mo_shape"/></td>
			</tr>
		</tbody>
	
	</table>
		
</form>

<script type="text/javascript">
	function getColumn() {
		var gubun = document.getElementById('gubun').options[document.getElementById('gubun').selectedIndex].value;
		var category = null;
		
		// gubun에 따라 tBody 변경
		if(gubun === '100') {
			category = document.getElementById('pc-ability');
		} else if(gubun === '300') {
			category = document.getElementById('monitor-ability');
		} else if(gubun === '400') {
			category = document.getElementById('phone-ability');
		}
		
		load();	// 화면 초기화
		category.style.display = 'block';
	}
	
	function goMain() {
		location.href="/equipment";
	}
	
	window.onload = load();
		
	function load() {
		document.getElementById('phone-ability').style.display = 'none';
		document.getElementById('pc-ability').style.display = 'none';
		document.getElementById('monitor-ability').style.display = 'none';
	}
	
</script>

</body>
</html>