<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 쓰기</title>
	<style>
		td	{ padding: 3px; text-align: center; }
	</style>
</head>
<body style="margin: 50px">
	<h3>글 쓰기</h3>
	<hr>
	<form action="/demo/write" method="post">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>번역가능 언어</td>
				<td>
					<input type="checkbox" name="language" value="kr"> 한국어
					<input type="checkbox" name="language" value="en"> 영어
					<input type="checkbox" name="language" value="fr"> 프랑스어
					<input type="checkbox" name="language" value="jp"> 일본어
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="10" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="제출">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>