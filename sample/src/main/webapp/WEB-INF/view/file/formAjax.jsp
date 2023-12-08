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
				<h3><strong>파일 업로드 by AJAX</strong></h3>
				<hr>
				<div class="row">
					<div class="col-4">
						<div class="card">
							<img class="card-img-top" id="image">
							<div class="card-body">
								<h4 class="card-title" id="title"></h4>
							</div>
						</div>
					</div>
					<div class="col-8">
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
								</td>
							</tr>
						</table>
					
					</div>
				</div>
			</div>
			<!-- ================ Main =================== -->
		</div>
	</div>
	<%@ include file="../common/bottom.jspf" %>
</html>