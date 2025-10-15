<%@ page import="java.sql.*, util.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Management</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 20px;
            background: #f8f9fa;
            color: #333;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a.button {
            padding: 6px 12px;
            background: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 0 5px;
        }

        a.button:hover {
            background: #218838;
        }

        .delete {
            background: #dc3545;
        }

        .delete:hover {
            background: #c82333;
        }
    </style>
</head>
<body>

<h2>Booking Management- Admin Panel</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Seats</th>
        <th>Total Price</th>
        <th>Bus ID</th>
        <th>Actions</th>
    </tr>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM ticket");

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("ticket_id") %></td>
        <td><%= rs.getString("fullname") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("seat_numbers") %></td>
        <td><%= rs.getDouble("total_price") %></td>
        <td><%= rs.getInt("bus_id") %></td>
        <td>
            <a href="edit_ticket.jsp?id=<%= rs.getInt("ticket_id") %>" class="button">Edit</a>
            <a href="DeleteTicketServlet?id=<%= rs.getInt("ticket_id") %>" class="button delete" onclick="return confirm('Are you sure you want to delete this ticket?')">Delete</a>
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='7' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }
    %>
</table>

</body>
</html>
