<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL</title>
	<style>td, th { padding: 3px; }</style>
</head>
<body style="margin: 40px;">
	<h1>JSTL fmt tag</h1>
	<hr>
	<table border="1">
		<tr><th>표현 방법</th><th>결과</th></tr>
		<tr><td>일반 숫자</td><td>${price}</td></tr>
		<tr><td>천단위 구분기호가 포함된 숫자</td>
			<td><fmt:formatNumber type="number" value="${price}"></fmt:formatNumber></td></tr>
		<tr><td>통화(KRW)</td>
			<td><fmt:formatNumber type="currency" currencySymbol="KRW " value="${price}" /></td></tr>
		<tr><td>통화(USD)</td>
			<td><fmt:formatNumber type="currency" currencySymbol="$" value="${price}" /></td></tr>
		<tr><td>퍼센트</td>
			<td><fmt:formatNumber type="percent" value="${price / 100000000}" /></td></tr>
		<tr><td></td><td></td></tr>
		<tr><td>일반 날짜</td><td>${now}</td></tr>
		<tr><td>full date</td>
			<td><fmt:formatDate type="date" dateStyle="full" value="${now}" /></td></tr>
		<tr><td>short date</td>
			<td><fmt:formatDate type="date" dateStyle="short" value="${now}" /></td></tr>
		<tr><td>time</td>
			<td><fmt:formatDate type="time" value="${now}" /></td></tr>
		<tr><td>both</td>
			<td><fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${now}" /></td></tr>
		<tr><td>pattern("YYYY-MM-dd HH:mm:ss")</td>
			<td><fmt:formatDate pattern="YYYY-MM-dd HH:mm:ss" value="${now}" /></td></tr>
		<tr><td>pattern("YY-MM-dd HH:mm")</td>
			<td><fmt:formatDate pattern="YY-MM-dd HH:mm" value="${now}" /></td></tr>
		<tr><td></td><td></td></tr>
		<tr><td>LocalDate now</td><td>${ldNow}</td></tr>
		<tr><td>LocalTime now</td><td>${ltNow}</td></tr>
		<tr><td>LocalTime now 개선</td><td>${ltNow2}</td></tr>
		<tr><td>LocalDateTime now</td><td>${ldtNow}</td></tr>
		<tr><td>LocalDateTime now 개선</td><td>${ldtNow2}</td></tr>
	</table>
</body>
</html>