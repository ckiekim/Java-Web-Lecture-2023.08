<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계산기</title>
</head>
<body style="margin: 50px;">
	<h3>단순 계산기</h3>
	<hr>
	<!-- <form action="/demo/calc" method="post"> -->
	<form method="get" action="/demo/getParam">
		<input type="text" name="a" placeholder="정수를 입력하세요">
		<select name="op">
			<option value="add" selected>+</option>
			<option value="sub">-</option>
			<option value="mul">*</option>
			<option value="div">/</option>
		</select>
		<input type="text" name="b" placeholder="정수를 입력하세요">
		<input type="submit" value="=">
	</form>
</body>
</html>