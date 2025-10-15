<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile - Bus2Frnd</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/UserProfile.css">
</head>
<body>

<!-- Top Bar -->
<div class="top-bar">
    <span>Need Help? Call 011-1234567</span>
    <span>Support | FAQ</span>
</div>

<!-- Header -->
<header class="header">
    <div class="logo">
        <img src="images/logo.png" alt="Bus2Frnd Logo" height="40">
    </div>
    <nav class="nav-links">
        <a href="Home.jsp">Home</a>
        <a href="UserProfile.jsp">Profile</a>
        <a href="searchBuses.jsp">Buses</a>
        <a href="About.jsp">About us</a>
    </nav>
    <div class="auth-buttons">
        <a href="UserLogin.jsp">Login</a>
        <a href="UserRegister.jsp" class="buy-btn">Register</a>
    </div>
</header>
    
    <div class="container">
        <h2>Welcome, <%= user.getUsername() %></h2>

        <% if (request.getParameter("success") != null) { %>
            <p class="message" style="color:green;">Update successful!</p>
        <% } else if (request.getParameter("error") != null) { %>
            <p class="message" style="color:red;">Update failed. Try again.</p>
        <% } %>

        <form action="UserServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="email" value="<%= user.getEmail() %>">

            <label>Full Name</label>
            <input type="text" name="fullname" value="<%= user.getName() %>">

            <label>Username</label>
            <input type="text" name="username" value="<%= user.getUsername() %>">

            <label>Phone</label>
            <input type="text" name="phone" value="<%= user.getPhone() %>">

            <label>Country</label>
            <input type="text" name="country" value="<%= user.getCountry() %>">

            <label>Password</label>
            <input type="password" name="password" required>

            <input type="submit" value="Update Profile">
        </form>

        <form action="UserServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your account?');">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="email" value="<%= user.getEmail() %>">
            <input type="submit" value="Delete Account" class="danger-btn">
        </form>

        <form action="logout.jsp" method="post">
            <input type="submit" value="Logout">
        </form>
    </div>
    
    
<!-- Footer -->
<footer class="footer">
    <div class="footer-logo">
        <img src="images/logo.png" alt="Bus2Frnd" height="30">
    </div>
    <p>© 2025 BUS2FRND. All rights reserved. Designed for comfortable travel.</p>
</footer>

</body>
</html>
</body>
</html>
