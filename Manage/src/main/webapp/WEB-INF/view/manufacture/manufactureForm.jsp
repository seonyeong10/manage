<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제조사 등록</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>

		<div id="right">
			<form action="insertManufacture" method="post" name="frm" id="frm">
			<div class="section-title">${title }</div>
				<table>
					<tr>
						<td>제조물품</td>
						<td>
							<select name="ma_kinds" required="required" onchange="getMaCode(this.value);">
								<option value="">물품을 선택하세요.</option>
								<option value="100">PC·노트북</option>
								<option value="300">모니터</option>
								<option value="400">핸드폰</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제조사 코드</td>
						<td><input type="text" name="ma_code" readonly="readonly" required="required"/></td>
					</tr>
					<tr>
						<td>제조사 이름</td>
						<td><input type="text" name="ma_name" required="required"/></td>
					</tr>
					<tr>
						<c:if test="${title eq '제조사 등록' }">
							<td colspan="2" class="btn-area">
								<input type="submit" value="등록" class="btn submit" />
								<button onclick="location.href='/'" class="btn">취소</button>
							</td>
						</c:if>
						<c:if test="${title eq '제조사 정보수정' }">
							<td colspan="2" class="btn-area">
								<input type="button" value="수정" class="btn submit" onclick="updateManu();"/>
								<button onclick="location.href='/'" class="btn">삭제</button>
							</td>
						</c:if>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	var param = document.getElementsByTagName('input');
	var select = document.getElementsByTagName('select');
	
	function updateManu() {
		document.getElementById('frm').action = "/manufacture/update/modify";
		document.getElementById('frm').method = "post";
		document.getElementById('frm').submit();
	}
	
	window.onload = isUpdate();
	
	function isUpdate() {
		
		if('${title}' === '제조사 정보수정') {
			console.log('${man}');
			param[name='ma_code'].value = '${man.MA_CODE}';
			param[name='ma_name'].value = '${man.MA_NAME}';
			select[name='ma_kinds'].value = '${man.MA_KINDS}';
		}
	}
	
	// 물품 선택 시 제조사 코드 조회
	function getMaCode(ma_kinds) {
		
		$.ajax({
			type : "post"
			,url : "/manufacture/getMaCode"
			,data : {"ma_kinds" : ma_kinds}
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				var ma_code = responseText.ma_code;
				
				if(msg === 'success') {
					param[name='ma_code'].value = ma_code;
				}
			}
		});
		
	}
		
	</script>
</body>
</html>