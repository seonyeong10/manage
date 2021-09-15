<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userLogin.jsp</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/form.css"/>" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function loginCheck(){
	$(function(){
		$("#loginChk").hide();
	});
	
	var id = $("#id").val().trim();
	var pw = $("#pw").val().trim();
	console.log(id+"/"+pw);
	
	var loginVal = {
			"id":id,
			"pw":pw
	};
	
	if(id==null ||  id=="" || pw==null || pw==""){
		alert("ID 및 PW를 확인해 주세요");
	}else{
		$.ajax({
			type : "post",
			url : "/login/ajaxlogin",
			data : JSON.stringify(loginVal),
			contentType : "application/json",
			dataType : "json",
			success : function(msg){
				
				if(msg.check==true){
					console.log("1번");
					location.href="/main";
				}else{
					console.log("2번");
					$("#loginChk").show();
					$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
				}
				
				
			},
			error:function(){
				alert("통신 실패");
			}
			
		});
		
	}
	
}
</script>


</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div id="content">
		<%@ include file="../include/left.jsp"%>
		<div id="right">
			<div class="section-title">로그인</div>

				<table border=1>
					<tr>
						<th>아이디</th>
						<td><input type="text" id="id" name="id" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="text" id="pw" name="pw" /></td>
					</tr>

					<tr >
						<th colspan="2" class="btn-area">
						<input type="button" value="등록" onclick="loginCheck()"/> 
						<input type="button" value="홈으로" onclick="javascript: location.href='/';" class="btn"/>
						<span id="loginChk"></span>
						</th>
					</tr>
				</table>

		</div>
	</div>
	<script type="text/javascript">
	
	</script>
</body>
</html>