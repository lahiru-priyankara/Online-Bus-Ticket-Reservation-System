<%@ page import="java.sql.*, util.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Your Ticket</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/ticket.css">
    <link rel="stylesheet" href="css/footer.css">
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

<%
    int ticketId = 0;
    try {
        ticketId = Integer.parseInt(request.getParameter("ticketId"));
    } catch (Exception e) {
        out.println("<p>Invalid ticket ID.</p>");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        conn = DBUtil.getConnection();
        ps = conn.prepareStatement("SELECT * FROM ticket WHERE ticket_id = ?");
        ps.setInt(1, ticketId);
        rs = ps.executeQuery();

        if (rs.next()) {
%>
<div class="ticket-container" id="ticketBox">
    <div class="ticket-header">
        <img src="images/logo.png" alt="Company Logo">
        <h1>Bus Ticket</h1>
    </div>

    <div class="ticket-section">
        <h3>Passenger Info</h3>
        <div class="ticket-details">
            <p><strong>Name:</strong> <%= rs.getString("fullname") %></p>
            <p><strong>Email:</strong> <%= rs.getString("email") %></p>
            <p><strong>Ticket No:</strong> <%= rs.getInt("ticket_id") %></p>
        </div>
    </div>

    <div class="ticket-section">
        <h3>Trip Info</h3>
        <div class="ticket-details">
            <p><strong>Bus ID:</strong> <%= rs.getInt("bus_id") %></p>
            <p><strong>Seat Numbers:</strong> <%= rs.getString("seat_numbers") %></p>
        </div>
    </div>

    <div class="ticket-section">
        <h3>Payment Info</h3>
        <div class="ticket-details">
            <p><strong>Total Paid:</strong> LKR <%= rs.getDouble("total_price") %></p>
        </div>
    </div>

    <div class="ticket-footer">
        Thank you for booking with Bus2Frnd. Please arrive 15 minutes early.
    </div>
</div>

<button class="download-btn" onclick="downloadTicket()">Download Ticket</button>

<script>
function downloadTicket() {
    var content = document.getElementById('ticketBox').innerHTML;
    var printWin = window.open('', '', 'height=600,width=800');
    printWin.document.write('<html><head><title>Your Ticket</title></head><body>');
    printWin.document.write(content);
    printWin.document.write('</body></html>');
    printWin.document.close();
    printWin.print();
}
</script>
<%
        } else {
            out.println("<p>Ticket not found.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error fetching ticket: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception ignored) {}
        if(ps != null) try { ps.close(); } catch(Exception ignored) {}
        if(conn != null) try { conn.close(); } catch(Exception ignored) {}
    }
%>

<!-- Footer -->
<footer class="footer">
    <div class="footer-logo">
        <img src="images/logo.png" alt="Bus2Frnd" height="30">
    </div>
    <p>© 2025 BUS2FRND. All rights reserved. Designed for comfortable travel.</p>
</footer>
</body>
</html>
