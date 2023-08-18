<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            	<h3><strong>Member List</strong></h3>
                <hr>
                <div class="row">
                	<div class="col-1"></div>
                	<div class="col-10">
		                <table class="table table-striped">
		                	<tr>
		                		<th style="width: 8%;">번호</th>
		                		<th style="width: 12%;">아이디</th>
		                		<th style="width: 20%;">이름</th>
		                		<th style="width: 20%;">Zip code</th>
		                		<th style="width: 20%;">도시</th>
		                		<th style="width: 20%;">국가</th>
		                	</tr>
		                <c:forEach var="member" items="${memberList}" varStatus="loop">
		                	<tr>
		                		<td>${loop.count}</td>
		                		<td>${member.id}</td>
		                		<td>${member.name}</td>
		                		<td>${member.addr.zipCode}</td>
		                		<td>${member.addr.city}</td>
		                		<td>${member.addr.country}</td>
		                	</tr>
		                </c:forEach>
		                </table>
                	</div>
                	<div class="col-1"></div>
                </div>
            </div>
			<!-- ================= Main ================= -->
        </div>
    </div>

	<%@ include file="./common/bottom.jspf" %>
</body>
</html>