<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="./common/head.jspf" %>
</head>
<body>
	<%@ include file="./common/top.jspf" %>

    <div class="container" style="margin-top:80px">
        <div class="row">
            <%@ include file="./common/aside.jspf" %>
            <!-- ================= Main ================= -->
            <div class="col-9">
            	<h3><strong>블로그 목록</strong></h3>
                <hr>
                <table class="table">
                	<tr>
                		<th>ID</th>
                		<th>필명</th>
                		<th>제목</th>
                		<th>작성시간</th>
                		<th>조회수</th>
                	</tr>
                <c:forEach var="blog" items="${blogList}">
                	<tr>
                		<td>${blog.bid}</td>
                		<td>${blog.penName}</td>
                		<td>${blog.title}</td>
                		<td>${blog.modTime}</td>
                		<td>${blog.viewCount}</td>
                	</tr>
                </c:forEach>
                </table>
            </div>
			<!-- ================= Main ================= -->
        </div>
    </div>

	<%@ include file="./common/bottom.jspf" %>
</body>
</html>