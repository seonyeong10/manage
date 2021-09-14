<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 등록</title>
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
			<form action="#" method="post" name="frm" id="frm" onsubmit="return false;">
			<div class="section-title">${title }</div>
			<input type="hidden" name="d_id"/>
				<table>
					<tr>
						<td>부서명</td>
						<td><input type="text" name="d_name" required="required" placeholder="부서 이름을 입력하세요."/></td>
					</tr>
					<c:if test="${title eq '부서 등록' }">
						<tr>
							<td>팀 이름</td>
							<td id="tim_name">
								<div>
									<input type="text" name="d_tim"  required="required" placeholder="팀 이름을 입력하세요." style="width: 80%"/> 
									<button onclick="createInput();" class="small-btn">추가</button>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="btn-area">
								<button value="등록" class="btn submit" onclick="insertDept();">등록</button>
								<button onclick="location.href='/'" class="btn">취소</button>
							</td>
						</tr>
					</c:if>
					<c:if test="${title eq '부서 정보 수정' }">
						<tr>
							<td>팀 이름</td>
							<td id="tim_name">
								<div>
									<input type="text" name="d_tim"  required="required" placeholder="팀 이름을 입력하세요."/> 
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="btn-area">
								<button value="등록" class="btn submit" onclick="updateDept();">수정</button>
								<button onclick="deleteDept();" class="btn">삭제</button>
							</td>
						</tr>
					</c:if>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	var param = document.getElementsByTagName('input');
	var select = document.getElementsByTagName('select');
	var frm = document.getElementById('frm');
	
	window.load = isUpdate();
	
	// 삭제 버튼 클릭
	function deleteDept() {
		frm.action = '/department/delete';
		frm.method = 'POST';
		frm.submit();
	}
	
	// 수정 버튼 클릭
	function updateDept() {
		frm.action = '/department/update';
		frm.method = 'POST';
		frm.submit();
	}
	
	// 화면 구분
	function isUpdate() {
		var title = "${title}";
		
		if(title === '부서 정보 수정') {
			param[name='d_id'].value = '${item.D_ID}';
			param[name='d_name'].value = '${item.D_NAME}';
			param[name='d_tim'].value = '${item.D_TIM}';
		}
	}
	
	// 등록 버튼 클릭
	function insertDept() {
		var params = $('#frm').serialize();
		
		$.ajax({
			type : "POST"
			,url : "/department/insert"
			,data : params
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				
				if(msg === 'success') {
					alert('등록이 완료되었습니다.');
					location.reload();
				}
			}
		});
	}
	
	// 추가 버튼 클릭
	function createInput() {
		var element = document.createElement('div');
		var target = document.getElementById('tim_name');
		
		element.innerHTML = '<input type="text" name="d_tim"  required="required" placeholder="팀 이름을 입력하세요." style="width: 80%;"/>	<button onclick="removeInput(this);" class="small-btn">삭제</button>';
		target.appendChild(element);
		
	}
	
	// 삭제 버튼 클릭
	function removeInput(tag) {
		tag.parentElement.remove();
	}
	
	</script>
</body>
</html>