<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
	<style>
		th, td { text-align: center; }
	</style>
</head>
<body>
	<%@ include file="../common/top.jspf" %>
	<div class="container" style="margin-top:80px">
		<div class="row">
			<%@ include file="../common/aside.jspf" %> 
			<!-- ================ Main =================== -->
			<div class="col-9">
				<h3><strong>사용자 목록</strong></h3>
				<hr>
				<table class="table table-hover">
					<tr>
						<th style="width: 10%">번호</th>
						<th style="width: 14%">UID</th>
						<th style="width: 16%">이름</th>
						<th style="width: 20%">이메일</th>
						<th style="width: 20%">가입일</th>
						<th style="width: 20%">액션</th>
					</tr>
				<c:forEach var="user" items="${userList}" varStatus="loop">
					<tr>
						<td>${loop.count}</td>
						<td>${user.uid}</td>
						<td>${user.uname}</td>
						<td>${user.email}</td>
						<td>${user.regDate}</td>
						<td>
							<a href="#"><i class="fa-solid fa-user-pen"></i></a>
							<a href="#"><i class="fa-solid fa-user-minus"></i></a>
						</td>
					</tr>
				</c:forEach>	
				</table>
				<ul class="pagination mt-3 justify-content-center">
				<c:forEach var="page" items="${pageList}">
					<li class="page-item ${(currentUserPage eq page) ? 'active' : ''}">
						<a class="page-link" href="/sample/user/list/${page}">${page}</a>
					</li>
				</c:forEach>
				</ul>				
			</div>
			<!-- ================ Main =================== -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>
</body>
</html>