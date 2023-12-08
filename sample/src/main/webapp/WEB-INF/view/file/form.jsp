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
				<h3><strong>파일 업로드</strong></h3>
				<hr>
				<form action="/sample/file/formUpload" method="post" enctype="multipart/form-data">
					<table class="table table-borderless">
						<tr>
							<td><label class="col-form-label">제목</label></td>
							<td><input class="form-control" type="text" name="title"></td>
						</tr>
						<tr>
							<td><label class="col-form-label">파일</label></td>
							<td><input class="form-control" type="file" name="file"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button class="btn btn-primary" type="submit">제출</button>
								<button class="btn btn-secondary" type="reset">취소</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<!-- ================ Main =================== -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>
</html>