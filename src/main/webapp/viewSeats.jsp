<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Seat" %>
<%
    List<Seat> seats = (List<Seat>) request.getAttribute("seats");
    String busId = request.getParameter("busId");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Seats | Bus2Frnd</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/ViewSeats.css">
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

<!-- Seat Layout -->
<div class="container">
    <h2>Choose Your Seat</h2>
    <form action="bookTicket.jsp" method="post">
        <input type="hidden" name="busId" value="<%= busId %>">
        <input type="hidden" name="selectedSeats" id="selectedSeats">

        <div class="seat-grid">
            <% for (Seat seat : seats) {
                String cssClass = seat.getStatus().equalsIgnoreCase("available") ? "seat available" : "seat booked";
            %>
                <div 
                    id="<%= seat.getSeatNumber() %>" 
                    class="<%= cssClass %>" 
                    onclick="<% if ("available".equalsIgnoreCase(seat.getStatus())) { %>toggleSeat('<%= seat.getSeatNumber() %>')<% } %>">
                    <%= seat.getSeatNumber() %>
                </div>
            <% } %>
        </div>

        <div class="actions">
            <button type="submit">Book Now</button>
        </div>
    </form>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="footer-logo">
        <img src="images/logo.png" alt="Bus2Frnd" height="30">
    </div>
    <p>© 2025 BUS2FRND. All rights reserved. Designed for comfortable travel.</p>
</footer>

<script>
    let selectedSeats = [];

    function toggleSeat(seatNumber) {
        const seatDiv = document.getElementById(seatNumber);
        const index = selectedSeats.indexOf(seatNumber);

        if (index === -1) {
            selectedSeats.push(seatNumber);
            seatDiv.classList.add("selected");
        } else {
            selectedSeats.splice(index, 1);
            seatDiv.classList.remove("selected");
        }

        document.getElementById("selectedSeats").value = selectedSeats.join(",");
    }
</script>

</body>
</html>
