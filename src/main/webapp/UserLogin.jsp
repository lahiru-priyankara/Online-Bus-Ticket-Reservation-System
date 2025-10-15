<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Bus2Frnd</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
     <link rel="stylesheet" href="css/UserLogin.css">
    
</head>
<body>
<div class="login-container">
    <h2>User Login</h2>
    <form action="UserServlet" method="post">
        <input type="hidden" name="action" value="login">

        <input type="email" name="email" placeholder="Email address" required>
        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Login</button>
    </form>

    <% if (request.getParameter("error") != null) { %>
        <p class="error-msg">Invalid login. Try again.</p>
    <% } else if (request.getParameter("success") != null) { %>
        <p class="success-msg">Login successful!</p>
    <% } %>

    <p>New user? <a href="UserRegister.jsp">Register here</a></p>
</div>
</body>
</html>
