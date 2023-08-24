<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="./common/head.jspf" %>
	<style>td, th { text-align: center; }</style>
</head>
<body>
	<%@ include file="./common/top.jspf" %>

    <div class="container" style="margin-top:80px">
        <div class="row">
            <%@ include file="./common/aside.jspf" %>
            <!-- ================= Main ================= -->
            <div class="col-9">
            	<h3>
            		<strong>블로그 목록</strong>
            		<span style="font-size: 0.6em;">
            			<a href="/demo/blog/write">
            				<i class="ms-5 fa-regular fa-file-lines"></i> 글쓰기
            			</a>
            		</span>
            	</h3>
                <hr>
                <table class="table">
                	<tr class="table-secondary">
                		<th style="width: 8%;">ID</th>
                		<th style="width: 14%;">필명</th>
                		<th style="width: 48%;">제목</th>
                		<th style="width: 20%;">작성시간</th>
                		<th style="width: 10%;">조회수</th>
                	</tr>
                <c:forEach var="blog" items="${blogList}">
                	<tr>
                		<td>${blog.bid}</td>
                		<td>${blog.penName}</td>
                		<td><a href="/demo/blog/detail/${blog.bid}">${blog.title}</a></td>
                		<td>${fn:replace(fn:substring(blog.modTime, 2, 16), 'T', ' ')}</td>
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