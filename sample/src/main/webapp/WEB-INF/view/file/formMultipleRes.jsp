<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				<h3><strong>파일 여러개 업로드 결과</strong></h3>
				<hr>
				<table class="table">
					<tr>
						<td>제목</td>
						<td colspan="2">${title}</td>
					</tr>
					<c:forEach var="file" items="${fileList}">
					<tr>
						<td style="width: 12%">파일명</label></td>
						<td style="width: 24%">${file}</td>
						<td style="width: 64%"><img src="/sample/file/download/${file}" width="60%"></td>
					</tr>
					</c:forEach>
					<!-- <tr>
						<td>사진</td>
						<td><img src="/sample/file/download/${filename}" width="80%"></td>
					</tr> -->
					<tr>
						<td colspan="3" style="text-align: center;">
							<button class="btn btn-primary" onclick="location.href='/sample/file/formUploadMultiple'">재실행</button>
						</td>
					</tr>
				</table>
			</div>
			<!-- ================ Main =================== -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>
</html>