<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>equipment</title>
</head>
<body>
<button onclick="goEquipmentAdd();">장비등록</button>
<table border=1>
	<tr>
		<td><input type="checkbox"/></td>
		<td>구분</td>
		<td>제조사</td>
		<td>제품명</td>
		<td>운영체제</td>
	</tr>
</table>
<script type="text/javascript">
	function goEquipmentAdd() {
		location.href="/equipment/add";
	}
</script>
</body>
</html>