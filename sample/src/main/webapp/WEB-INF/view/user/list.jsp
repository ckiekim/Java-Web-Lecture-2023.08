<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
	<style>
		th, td	{ text-align: center; }
		.disabled-link	{ pointer-events: none; }
	</style>
	<script>
		function deleteFunc(uid) {
			$('#delUid').val(uid);
			$('#deleteModal').modal('show');
		}
	</script>
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
							<!-- 본인만이 수정 권한이 있음 -->
							<c:if test="${sessUid eq user.uid}">
								<a href="/sample/user/update/${user.uid}"><i class="fa-solid fa-user-pen me-2"></i></a>
							</c:if>
							<c:if test="${sessUid ne user.uid}">
								<a href="#" class="disabled-link"><i class="fa-solid fa-user-pen me-2"></i></a>
							</c:if>
							<!-- 관리자만이 삭제 권한이 있음 -->
							<c:if test="${sessUid eq 'admin'}">
								<a href="javascript:deleteFunc('${user.uid}')"><i class="fa-solid fa-user-minus"></i></a>
							</c:if>
							<c:if test="${sessUid ne 'admin'}">
								<a href="#" class="disabled-link"><i class="fa-solid fa-user-minus"></i></a>
							</c:if>
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
			<input type="hidden" id="delUid">
			<!-- ================ Main =================== -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>
	
    <div class="modal" id="deleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">사용자 삭제</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <strong>삭제하시겠습니까?</strong>
                    <div class="text-center mt-5">
                        <button class="btn btn-danger" onclick="location.href='/sample/user/delete/'+$('#delUid').val()">삭제</button>
                        <button class="btn btn-secondary ms-1" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>	
</body>
</html>