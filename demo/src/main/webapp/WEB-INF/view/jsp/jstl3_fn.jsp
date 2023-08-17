<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL</title>
	<style>td, th { padding: 3px; }</style>
</head>
<body style="margin: 40px;">
	<h1>JSTL fn(function) tag</h1>
	<hr>
	<table border="1">
		<tr><th>표현 방법</th><th>결과</th></tr>
		<tr><td>문자열 연결</td><td>${str1} ${str3}</td></tr>
		<tr><td>\${fn:length(str2)}</td><td>${fn:length(str2)}</td></tr>
		<tr><td>\${fn:toUpperCase(str1)}</td><td>${fn:toUpperCase(str1)}</td></tr>
		<tr><td>\${fn:toLowerCase(str1)}</td><td>${fn:toLowerCase(str1)}</td></tr>
		<tr><td>\${fn:substring(str2, 0, 7)}</td><td>${fn:substring(str2, 0, 7)}</td></tr>
		<tr><td>\${fn:replace(str2, " ", "-")}</td><td>${fn:replace(str2, " ", "-")}</td></tr>
		<tr><td>\${fn:indexOf(str2, str3)}</td><td>${fn:indexOf(str2, str3)}</td></tr>
		<tr><td>\${fn:contains(str2, str3)}</td><td>${fn:contains(str2, str3)}</td></tr>
	</table>
</body>
</html>