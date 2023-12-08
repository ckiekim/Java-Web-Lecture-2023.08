<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file="../common/head.jspf" %>
</head>
<body>
	<%@ include file="../common/top.jspf" %>
	<div class="container" style="margin-top:80px">
		<div class="row">
			<%@ include file="../common/aside.jspf" %> 
			<!-- ================ Main =================== -->
			<div class="col-9">
				<h3><strong>파일 업로드 결과</strong></h3>
				<hr>
				<table class="table">
					<tr>
						<td>제목</td>
						<td>${title}</td>
					</tr>
					<tr>
						<td>파일명</label></td>
						<td>${filename}</td>
					</tr>
					<tr>
						<td>사진</td>
						<td><img src="/sample/file/download/${filename}" width="80%"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button class="btn btn-primary" onclick="location.href='/sample/file/formUpload'">재실행</button>
						</td>
					</tr>
				</table>
			</div>
			<!-- ================ Main =================== -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>
</html>