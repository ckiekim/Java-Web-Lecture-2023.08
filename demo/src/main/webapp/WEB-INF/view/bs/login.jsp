<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        td  { text-align: center; }
    </style>
</head>
<body>
    <div class="container-fluid p-3 bg-primary text-white text-center">
        <h1>My Bootstrap Page</h1>
        <p>Forms</p>
    </div>
    <div class="container mt-4">
        <div class="row">
            <div class="col-5">
                <h2>Stacked Form</h2>
                <form action="/demo/bs/login1" method="post">
                    <div class="mb-3 mt-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label">Password:</label>
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
                    </div>
                    <div class="form-check mb-3">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" name="remember" checked> Remember me
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>                
            </div>
            <div class="col-2"></div>
            <div class="col-5">
                <h2 class="mb-5">테이블과 결합한 Form</h2>
                <form action="/demo/bs/login2" method="post">
                    <table class="table table-borderless">
                        <tr>
                            <td style="width: 30%;"><label class="col-form-label">이메일</label></td>
                            <td style="width: 70%;"><input type="text" name="email" class="form-control" placeholder="Enter email"></td>
                        </tr>
                        <tr>
                            <td><label class="col-form-label">패스워드</label></td>
                            <td><input type="password" name="pswd" class="form-control" placeholder="Enter password"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="remember"> Remember me
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><button type="submit" class="btn btn-primary">로그인</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>