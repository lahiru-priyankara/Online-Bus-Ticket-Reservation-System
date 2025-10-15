<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration - Bus2Frnd</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/UserRegister.css">
   
</head>
<body>
<div class="register-container">
    <h2>User Registration</h2>
    <form action="UserServlet" method="post">
        <input type="hidden" name="action" value="register">

        <input type="text" name="fullname" placeholder="Full Name" required>
        <input type="text" name="username" placeholder="Username" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="phone" placeholder="Phone Number" required>
        <input type="text" name="country" placeholder="Country" required>
        <input type="password" name="password" placeholder="Password" required>

        <button type="submit">Register</button>
    </form>

    <% if (request.getParameter("error") != null) { %>
        <p class="error-msg">Registration failed. Try again.</p>
    <% } else if (request.getParameter("success") != null) { %>
        <p class="success-msg">Registered successfully!</p>
    <% } %>

    <p>Already registered? <a href="UserLogin.jsp">Login here</a></p>
</div>
</body>
</html>
