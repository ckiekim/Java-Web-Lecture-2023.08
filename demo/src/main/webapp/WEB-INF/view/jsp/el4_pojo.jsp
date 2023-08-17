<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 표현언어</title>
	<style>td, th { padding: 3px; }</style>
</head>
<body style="margin: 40px;">
	<h1>POJO(Plain Old Java Object)</h1>
	<hr>
	<table border="1">
		<tr><th>표현식</th><th>결과</th></tr>
		<tr><td>\${m1.id}</td><td>${m1.id}</td></tr>
		<tr><td>\${m1.name}</td><td>${m1.name}</td></tr>
		<tr><td>\${m1.addr}</td><td>${m1.addr}</td></tr>
		<tr><td>\${m2.id}</td><td>${m2.id}</td></tr>
		<tr><td>\${m2.name}</td><td>${m2.name}</td></tr>
		<tr><td>\${m2.addr.city}</td><td>${m2.addr.city}</td></tr>
		<tr><td></td><td></td></tr>
		<tr><td>\${memberArray[0].id}</td><td>${memberArray[0].id}</td></tr>
		<tr><td>\${memberArray[0].name}</td><td>${memberArray[0].name}</td></tr>
		<tr><td>\${memberArray[0].addr}</td><td>${memberArray[0].addr}</td></tr>
		<tr><td></td><td></td></tr>
		<tr><td>\${memberList[1].id}</td><td>${memberList[1].id}</td></tr>
		<tr><td>\${memberList[1].name}</td><td>${memberList[1].name}</td></tr>
		<tr><td>\${memberList[1].addr.city}</td><td>${memberList[1].addr.city}</td></tr>
	</table>
</body>
</html>