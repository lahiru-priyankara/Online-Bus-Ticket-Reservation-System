<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management Admin</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        form { margin-bottom: 20px; display: inline-block; }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 300px;
            padding: 8px;
            margin: 5px 0;
        }
        button {
            padding: 8px 12px;
            margin: 5px;
            cursor: pointer;
            border: none;
            border-radius: 4px;
        }
        .section {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .highlight {
            background-color: #ffffcc;
        }
        .status-message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .success {
            background-color: #dff0d8;
            color: #3c763d;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
        .view-btn { background-color: #4CAF50; color: white; }
        .edit-btn { background-color: #2196F3; color: white; }
        .delete-btn { background-color: #f44336; color: white; }
        .back-btn { background-color: #607d8b; color: white; }
        .profile-table {
            width: auto;
            border-collapse: collapse;
            margin: 15px 0;
        }
        .profile-table th {
            background-color: #f2f2f2;
            width: 150px;
        }
        .profile-table th, .profile-table td {
            padding: 10px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>

<h2>User Management - Admin Panel</h2>

<!-- Status Message -->
<% String status = request.getParameter("status"); 
   if (status != null) { 
       String message = "";
       String cssClass = "";
       if (status.equals("updated")) {
           message = "User updated successfully!";
           cssClass = "success";
       } else if (status.equals("deleted")) {
           message = "User deleted successfully!";
           cssClass = "success";
       } else if (status.equals("failed")) {
           message = "Operation failed. Please try again.";
           cssClass = "error";
       }
%>
    <div class="status-message <%= cssClass %>">
        <%= message %>
    </div>
<% } %>

<!-- Search Form -->
<div class="section">
    <form action="UserManageAdminServlet" method="get">
        <input type="hidden" name="action" value="search">
        <label>Search by Email:</label><br>
        <input type="email" name="email" required>
        <button type="submit">Search</button>
    </form>
    
    <form action="UserManageAdminServlet" method="get">
        <input type="hidden" name="action" value="view">
        <button type="submit" class="back-btn">View All Users</button>
    </form>
</div>

<!-- User Profile View Section -->
<%
    User viewedUser = (User) request.getAttribute("viewedUser");
    if (viewedUser != null) {
%>
    <div class="section">
        <h3>User Profile Details</h3>
        <table class="profile-table">
            <tr><th>ID:</th><td><%= viewedUser.getId() %></td></tr>
            <tr><th>Full Name:</th><td><%= viewedUser.getName() %></td></tr>
            <tr><th>Username:</th><td><%= viewedUser.getUsername() %></td></tr>
            <tr><th>Email:</th><td><%= viewedUser.getEmail() %></td></tr>
            <tr><th>Phone:</th><td><%= viewedUser.getPhone() %></td></tr>
            <tr><th>Country:</th><td><%= viewedUser.getCountry() %></td></tr>
        </table>
        <form action="UserManageAdminServlet" method="get">
            <input type="hidden" name="action" value="view">
            <button type="submit" class="back-btn">Back to List</button>
        </form>
    </div>
<%
    }
%>

<!-- User Edit Section -->
<%
    User searchedUser = (User) request.getAttribute("searchedUser");
    if (searchedUser != null && viewedUser == null) {
%>
    <div class="section">
        <h3>Edit User Details</h3>
        <form action="UserManageAdminServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= searchedUser.getId() %>">

            Full Name:<br>
            <input type="text" name="fullname" value="<%= searchedUser.getName() %>" required><br>

            Username:<br>
            <input type="text" name="username" value="<%= searchedUser.getUsername() %>" required><br>

            Email:<br>
            <input type="email" name="email" value="<%= searchedUser.getEmail() %>" readonly><br>

            Phone:<br>
            <input type="text" name="phone" value="<%= searchedUser.getPhone() %>" required><br>

            Country:<br>
            <input type="text" name="country" value="<%= searchedUser.getCountry() %>" required><br>

            Password:<br>
            <input type="password" name="password" value="<%= searchedUser.getPassword() %>" required><br>

            <button type="submit">Update User</button>
            <button type="button" onclick="window.location.href='UserManageAdminServlet?action=view'" class="back-btn">Cancel</button>
        </form>

        <form action="UserManageAdminServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="email" value="<%= searchedUser.getEmail() %>">
            <button type="submit" class="delete-btn">Delete User</button>
        </form>
    </div>
<%
    }
%>

<!-- All Users Table (only shown when not viewing profile or editing) -->
<%
    if (viewedUser == null && searchedUser == null) {
        List<User> users = (List<User>) request.getAttribute("users");
%>
    <div class="section">
        <h3>All Registered Users</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Country</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (users != null && !users.isEmpty()) { 
                    for (User user : users) { %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getUsername() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getPhone() %></td>
                        <td><%= user.getCountry() %></td>
                        <td>
                            <div class="action-buttons">
                                <form action="UserManageAdminServlet" method="get">
                                    <input type="hidden" name="action" value="viewProfile">
                                    <input type="hidden" name="email" value="<%= user.getEmail() %>">
                                    <button type="submit" class="view-btn">View</button>
                                </form>
                                <form action="UserManageAdminServlet" method="get">
                                    <input type="hidden" name="action" value="search">
                                    <input type="hidden" name="email" value="<%= user.getEmail() %>">
                                    <button type="submit" class="edit-btn">Edit</button>
                                </form>
                                <form action="UserManageAdminServlet" method="post" 
                                      onsubmit="return confirm('Are you sure you want to delete this user?');">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="email" value="<%= user.getEmail() %>">
                                    <button type="submit" class="delete-btn">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                <% } 
                } else { %>
                    <tr>
                        <td colspan="7">No users found</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
<% } %>

</body>
</html>