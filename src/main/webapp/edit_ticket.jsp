<%@ page import="java.sql.*, util.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Ticket</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            padding: 30px;
        }

        h2 {
            color: #007bff;
        }

        form {
            background: white;
            padding: 25px;
            border-radius: 8px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #28a745;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<%
    try {
        conn = DBUtil.getConnection();
        ps = conn.prepareStatement("SELECT * FROM ticket WHERE ticket_id = ?");
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
%>

<h2>Edit Ticket</h2>
<form action="UpdateTicketServlet" method="post">
    <input type="hidden" name="ticket_id" value="<%= rs.getInt("ticket_id") %>">

    <label>Full Name:</label>
    <input type="text" name="fullname" value="<%= rs.getString("fullname") %>" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%= rs.getString("email") %>" required>

    <label>Seats:</label>
    <input type="text" name="seat_numbers" value="<%= rs.getString("seat_numbers") %>" required>

    <label>Total Price:</label>
    <input type="number" step="0.01" name="total_price" value="<%= rs.getDouble("total_price") %>" required>

    <label>Bus ID:</label>
    <input type="number" name="bus_id" value="<%= rs.getInt("bus_id") %>" required>

    <button type="submit">Update Ticket</button>
</form>

<%
        } else {
            out.println("<p style='color:red;text-align:center;'>Ticket not found!</p>");
        }
    } catch (Exception e) {
        out.println("<p style='color:red;text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
        if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }
%>

</body>
</html>
