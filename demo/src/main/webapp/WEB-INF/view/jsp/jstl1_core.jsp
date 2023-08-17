<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL</title>
	<style>td, th { padding: 3px; }</style>
</head>
<body style="margin: 40px;">
	<h1>JSTL(JSP Standard Tag Library) Core</h1>
	<hr>
	<table border="1">
		<tr><th>표현식</th><th>결과</th></tr>
		<tr><td>\${memberArray[0].id}</td><td>${memberArray[0].id}</td></tr>
		<tr><td>\${memberArray[0].name}</td><td>${memberArray[0].name}</td></tr>
		<tr><td>\${memberArray[0].addr}</td><td>${memberArray[0].addr}</td></tr>
		<c:set var="mem0" value="${memberArray[0]}"></c:set>
		<tr><td></td><td></td></tr>
		<tr><td>\${mem0.id}</td><td>${mem0.id}</td></tr>
		<tr><td>\${mem0.name}</td><td>${mem0.name}</td></tr>
		<tr><td>\${mem0.addr.city}</td><td>${mem0.addr.city}</td></tr>
	</table>
	<br>
	<table border="1">
		<tr><th>아이디</th><th>이름</th><th>도시</th><th>국가</th></tr>
		<tr>
			<td>${memberList[0].id}</td>
			<td>${memberList[0].name}</td>
			<td>${memberList[0].addr.city}</td>
			<td>${memberList[0].addr.country}</td>
		</tr>
		<tr>
			<td>${memberList[1].id}</td>
			<td>${memberList[1].name}</td>
			<td>${memberList[1].addr.city}</td>
			<td>${memberList[1].addr.country}</td>
		</tr>
	</table>
	<br>
	<table border="1">
		<tr><th>아이디</th><th>이름</th><th>도시</th><th>국가</th></tr>
	<c:forEach var="member" items="${memberArray}">
		<tr>
			<td>${member.id}</td>
			<td>${member.name}</td>
			<td>${member.addr.city}</td>
			<td>${member.addr.country}</td>
		</tr>
	</c:forEach>
	</table>
	<br>
	<table border="1">
		<tr><th>Index</th><th>Count</th><th>아이디</th><th>이름</th><th>주소</th></tr>
	<c:forEach var="member" items="${memberList}" varStatus="loop">
		<tr>
			<td>${loop.index}</td>
			<td>	<%-- 홀수면 blue, 짝수면 red, 아래 id 문제의 개선책 --%>
				<span style="color: ${loop.count mod 2 eq 1 ? 'blue' : 'red'};">${loop.count}</span>
			</td>
			<td>	<%-- id가 홀수면 blue, 짝수면 red --%>
			<c:if test="${member.id mod 2 eq 1}">	<%-- ${member.id % 2 == 1} --%>
				<span style="color: blue;">${member.id}</span>
			</c:if>
			<c:if test="${member.id mod 2 eq 0}">
				<span style="color: red;">${member.id}</span>
			</c:if>
			</td>
			<td>	<%-- 첫번째줄 배경색은 yellow, 마지막줄은 cyan --%>
			<c:if test="${loop.first}">
				<span style="background-color: yellow;">${member.name}</span>
			</c:if>
			<c:if test="${loop.last}">
				<span style="background-color: cyan;">${member.name}</span>
			</c:if>
			<c:if test="${not loop.first and not loop.last}">
				${member.name}
			</c:if>
			</td>
			<td>	<%-- 한국이면 배경색을 orange, 미국이면 skyblue --%>
			<c:if test="${member.addr.country eq '한국'}">
				<span style="background-color: orange;">${member.addr}</span>
			</c:if>
			<c:if test="${member.addr.country eq '미국'}">
				<span style="background-color: skyblue;">${member.addr}</span>
			</c:if>
			<c:if test="${member.addr.country ne '한국' and member.addr.country ne '미국'}">
				${member.addr}
			</c:if>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>