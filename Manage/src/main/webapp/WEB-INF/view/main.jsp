<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/base.css"/>" rel="stylesheet" type="text/css" />
</head>
<c:if test="${empty authInfo}">
벨렐ㄹㄹ
</c:if>
<c:if test="${!empty authInfo}">
	<body>
		<%@ include file="include/top.jsp"%>
		<div id="content">
			<%@ include file="include/left.jsp"%>

			<div id="right">
				<p>자원 관리 프로그램</p>
				<ol>
					<li>사원을 등록한다</li>
					<li>제조사를 등록한다</li>
					<li>장비 관리에서 이용중인 장비를 등록한다.</li>
					<li>장비 조회에서 등록된 장비 조회와 상세 정보를 확인할 수 있다.</li>
					<li>성능비교에서 선택한 두 사람의 장비를 비교하고 서로 교환할 수 있다.</li>
				</ol>
			</div>
		</div>
	</body>
</c:if>
</html>