<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div id="content">
		<div id="right">
			<div class="section-title">회원가입</div>
			<form action="#" method="post" onsubmit="return false;" id="frm">
				<input type="hidden" name="checkId" value=""/>
				<table border=1>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" class="not-duplicate" placeholder="아이디를 입력하세요." style="width:80%;"/>
							<button onclick="isDuplicate();" class="small-btn">중복검사</button>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw" placeholder="비밀번호를 입력하세요." style="width:90%;" required="required"/></td>
					</tr>
					<tr>
						<th>사원번호</th>
						<td><input type="text" name="code" placeholder="사원번호를 입력하세요." style="width:90%;" required="required"/></td>
					</tr>
					<tr>
						<th colspan="2" class="btn-area">
							<button class="btn submit" onclick = "enter();">등록</button> 
							<button class="btn submit" onclick="javascript: location.href='/login2';">취소</button> 
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	// 등록 버튼 클릭
	function enter() {
		var params = $('#frm').serialize();
		
		$.ajax({
			type : "POST"
			,url : "/login2/insert"
			,data : params
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				
				if(msg === 'success') {
					alert('회원가입이 완료되었습니다.\n로그인 해주세요.');
					location.href="/login2";
				} else if(msg === 'shortPw') {
					alert('비밀번호가 짧습니다.');
				} else if(msg === 'noEmp') {
					alert('존재하지 않는 사번입니다.');
				} else if(msg === 'noCheckId') {
					alert('아이디 중복을 확인하세요.');
				}
			}
		});
	}
	
	// 중복검사 버튼 클릭
	function isDuplicate() {
		var id = $('input[name=id]').val();
		
		if(id == null || id == '') {
			alert('아이디를 입력하세요.');
			return false;
		}
		
		$.ajax({
			type : "POST"
			,url : "/login2/checkId"
			,data : {"id" : id}
			,dataType : "json"
			,error : function(request, stataus, error) {
				console.log("에러 : " + error + "\n" + "메시지 : " + request.responseText);
			}
			,success : function(responseText, statusText, xhr) {
				var msg = responseText.message;
				
				if(msg === 'success') {
					alert('사용 가능한 아이디 입니다.');
					$('input[name=checkId]').val('true');
				} else if(msg === 'duplicate') {
					alert('이미 사용중인 아이디 입니다.');
				}
			}
		});
		
		
	}
</script>
</html>