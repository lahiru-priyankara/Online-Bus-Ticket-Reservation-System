<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Bus" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Buses</title>
    <link rel="stylesheet" href="css/SearchBuses.css">
    <link rel="stylesheet" href="css/header.css">
     <link rel="stylesheet" href="css/footer.css">
</head>

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

<body>
    <div class="container">
        <div class="search-container">
            <h2>Search Bus Routes</h2>
            <form action="SearchBusServlet" method="post">
                <label>Source</label>
                <input type="text" name="source" placeholder="Enter starting city" required>

                <label>Destination</label>
                <input type="text" name="destination" placeholder="Enter destination city" required>

                <label>Travel Date</label>
                <input type="date" name="travelDate" required>

                <button type="submit">Search Buses</button>
            </form>
        </div>

        <h2 class="section-title">Available Buses</h2>
        <div class="ticket-container">
            <%
                List<Bus> buses = (List<Bus>) request.getAttribute("buses");
                if (buses != null && !buses.isEmpty()) {
                    for (Bus bus : buses) {
            %>
            <div class="ticket">
                <div class="ticket-left">
                    <h2><%= bus.getName() %></h2>
                    <p class="type"><%= bus.getType() %> Bus</p>
                    <div class="route">
                        <div>
                            <p class="label">Departure</p>
                            <p class="time"><%= bus.getDepartureTime() %></p>
                        </div>
                        <div class="arrow">→</div>
                        <div>
                            <p class="label">Arrival</p>
                            <p class="time"><%= bus.getArivelTime() %></p>
                        </div>
                    </div>
                </div>
                <div class="ticket-right">
                    <a href="ViewSeatsServlet?busId=<%= bus.getBusId() %>" class="view-seats-btn">View Seats</a>
                </div>
            </div>
            <%
                    }
                } else {
            %>
                <p class="no-results">No buses available for the selected route and date.</p>
            <% } %>
        </div>
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
