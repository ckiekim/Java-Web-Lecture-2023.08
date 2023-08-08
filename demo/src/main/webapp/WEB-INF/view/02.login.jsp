<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<style>
        td { text-align: center; padding: 5px; }
    </style>
</head>
<body>
	<h3>로그인</h3>
	<hr>
    <form action="/demo/login" method="post">
        <table>
            <tr>
                <td style="text-align: left;">아이디:</td>
                <td><input type="text" name="uid"></td>
            </tr>
            <tr>
                <td style="text-align: left;">패스워드:</td>
                <td><input type="password" name="pwd"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="확인">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>