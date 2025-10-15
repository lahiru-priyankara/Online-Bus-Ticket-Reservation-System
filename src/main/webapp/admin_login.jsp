<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    
    <link rel="stylesheet" href="css/admin_login.css">
</head>
<body>

<div class="login-container">
    <div class="login-box">
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            <label for="email">Email</label>
            <input type="text" id="email" name="email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>

        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
        <div class="error-message">Invalid login details!</div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
