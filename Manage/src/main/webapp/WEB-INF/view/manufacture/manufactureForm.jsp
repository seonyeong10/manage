<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제조사 등록</title>
</head>
<body>

<form action="insertManufacture" method="post" name="frm">
	<table>
		<tr>
			<td>제조사 코드</td>
			<td><input type="text" name="ma_code"/></td>
		</tr>
		<tr>
			<td>제조사 이름</td>
			<td><input type="text" name="ma_name"/></td>
		</tr>
		<tr>
			<td>제조물품</td>
			<td><input type="text" name="ma_kinds"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록"/>
			</td>
		</tr>
	</table>
</form>

</body>
</html>