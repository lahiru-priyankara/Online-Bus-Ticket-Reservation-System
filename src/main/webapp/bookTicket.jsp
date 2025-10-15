<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String seats = request.getParameter("selectedSeats");
    String busId = request.getParameter("busId");

    String[] seatNumbers = seats != null ? seats.split(",") : new String[0];

    double seatPrice = 0.0;
    double total = 0.0;

    if (seatNumbers.length > 0) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_db", "root", "Server@33");

            String priceQuery = "SELECT price FROM seat WHERE seat_number = ? AND bus_id = ?";
            PreparedStatement ps = conn.prepareStatement(priceQuery);
            ps.setString(1, seatNumbers[0]); // price based on first selected seat
            ps.setInt(2, Integer.parseInt(busId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                seatPrice = rs.getDouble("price");
                total = seatPrice * seatNumbers.length;
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Your Tickets</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/bookTicket.css">
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
        <a href="About.jsp">About Us</a>
    </nav>
    <div class="auth-buttons">
        <a href="UserLogin.jsp">Login</a>
        <a href="UserRegister.jsp" class="buy-btn">Register</a>
    </div>
</header>

<!-- Booking Form -->
<div class="form-box">
    <h2>Ticket Booking Form</h2>
    <form action="BookTicketServlet" method="post">
        <input type="hidden" name="busId" value="<%= busId %>">
        <input type="hidden" name="seats" value="<%= seats %>">
        <input type="hidden" name="totalPrice" value="<%= total %>">

        <label>Selected Seats:</label>
        <p><%= seats %></p>

        <label>Seat Price (LKR):</label>
        <p>LKR <%= seatPrice %></p>

        <label>Total Price (LKR):</label>
        <p class="total">LKR <%= total %></p>

        <label for="fullname">Full Name:</label>
        <input type="text" name="fullname" id="fullname" required>

        <label for="email">Email Address:</label>
        <input type="email" name="email" id="email" required>

        <label for="payment">Payment Amount (LKR):</label>
        <input type="number" name="payment" id="payment" value="<%= total %>" readonly>

        <button type="submit">Confirm Booking</button>
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
