<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="include.jsp"%>
<div id="left-bar">
	<ul>
		<li>
			<div class="left-menu">
				<div class="title">
					사원 관리 <span class="drop">▼</span>
				</div>
				<ul>
					<c:if test="${authInfo.auth eq 'ADMIN' }">
						<li><a href="/department/add">부서 등록</a></li>
					</c:if>
						<li><a href="/department/list">부서 조회</a></li>
					<c:if test="${authInfo.auth eq 'ADMIN' }">
						<li><a href="/employee/add">사원 등록</a></li>
					</c:if>
						<li><a href="/employee/list">사원 조회</a></li>
				</ul>
			</div>
		</li>
		<li>
			<div class="left-menu">
				<div class="title">
					제조사 관리 <span class="drop">▼</span>
				</div>
				<ul>
					<c:if test="${authInfo.auth eq 'ADMIN' }">
					<li><a href="/manufacture/add">제조사 등록</a></li>
					</c:if>
					<li><a href="/manufacture">제조사 조회</a></li>
				</ul>
			</div>
		</li>
		<li>
			<div class="left-menu">
				<div class="title">
					장비 관리 <span class="drop">▼</span>
				</div>
				<ul>
					<c:if test="${authInfo.auth eq 'ADMIN' }">
					<li><a href="/device/add">장비 추가</a></li>
					</c:if>
					<li><a href="/device/list">장비 조회</a></li>
				</ul>
			</div>
			<div class="left-menu">
				<div class="title">
					장비 사용 관리 <span class="drop">▼</span>
				</div>
				<ul>
					<c:if test="${authInfo.auth eq 'ADMIN' }">
					<li><a href="/equipment/add">사원 장비 등록</a></li>
					</c:if>
					<li><a href="/equipment">사용 장비 조회</a></li>
					<li><a href="/equipment/compare">성능비교</a></li>
				</ul>
			</div>
		</li>
		<c:if test="${authInfo.auth eq 'ADMIN' }">
		<li>
			<div class="left-menu">
				<div class="title">
					회원 관리 <span class="drop">▼</span>
				</div>
				<ul>
					<li><a href="/userinfo/form">회원 등록</a></li>
					<li><a href="/userinfo/list">회원 조회</a></li>
				</ul>
			</div>
		</li>
		</c:if>
	</ul>
</div>