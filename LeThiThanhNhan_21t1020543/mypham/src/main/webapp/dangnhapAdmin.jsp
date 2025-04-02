<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <!-- Include Bootstrap CSS for modern design -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            text-align: center;
            color: #007bff;
        }
        .btn-login {
            width: 100%;
            background-color: #007bff;
            color: #ffffff;
        }
        .form-control {
            border-radius: 20px;
            margin-bottom: 20px;
        }
        .form-check-label {
            font-size: 14px;
        }
        .captcha-img {
            margin: 10px 0;
        }
        .captcha-img img {
            max-width: 100%;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="dangnhapAdminController" method="post">
            <div class="mb-3">
                <label for="txtun" class="form-label">Username</label>
                <input type="text" class="form-control" id="txtun" name="txtun" required>
            </div>
            <div class="mb-3">
                <label for="txtpass" class="form-label">Password</label>
                <input type="password" class="form-control" id="txtpass" name="txtpass" required>
            </div>
            <% 
            int d = 0;
            if(session.getAttribute("dem") != null) 
                d = (int) session.getAttribute("dem");
            if(d > 3) {
            %>
            <div class="captcha-img">
                <img src="simpleCaptcha.jpg" alt="Captcha" />
                <input type="text" class="form-control" name="answer" placeholder="Enter captcha" required><br>
            </div>
            <% } %>
            <button type="submit" class="btn btn-login btn-lg">Login</button>
        </form>
        <br>
        <% 
        String tb = (String) request.getAttribute("tb");
        if(tb != null) out.print("<div class='alert alert-danger' role='alert'>" + tb + "</div>");
        %>
    </div>
</div>

<!-- Include Bootstrap JS and its dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
