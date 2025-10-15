<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Bus" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bus2Frnd - Book Your Journey</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/Home.css">
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

<!-- Hero Section -->
<section class="hero-section">
    <div class="overlay">
        <div class="hero-content">
            <div class="hero-text">
                <h1>Book Bus Tickets Easily with <b>LuminRide</b></h1>
                <p>Fast, reliable and convenient bus ticket booking platform</p>
            </div>
            <div class="ticket-box">
                <h3>Search Your Bus</h3>
                <form action="HomeSearchBusServlet" method="post">
                    <label for="source">From</label>
                    <input type="text" name="source" id="source" placeholder="Source" required>

                    <label for="destination">To</label>
                    <input type="text" name="destination" id="destination" placeholder="Destination" required>

                    <label for="travelDate">Date</label>
                    <input type="date" name="travelDate" id="travelDate" required>

                    <input type="submit" value="Search" class="search-btn">
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Bus Search Results -->
<% List<Bus> buses = (List<Bus>) request.getAttribute("buses"); %>
<% if (buses != null && !buses.isEmpty()) { %>
    <section class="bus-results">
        <h2>Available Buses</h2>
        <div class="bus-card-container">
            <% for (Bus bus : buses) { %>
                <div class="bus-card">
                    <h3><%= bus.getName() %> <span class="bus-type">(<%= bus.getType() %>)</span></h3>
                    <p><strong>Departure:</strong> <%= bus.getDepartureTime() %></p>
                    <p><strong>Arrival:</strong> <%= bus.getArivelTime() %></p>
                    <a href="ViewSeatsServlet?busId=<%= bus.getBusId() %>" class="view-btn">View Seats</a>
                </div>
            <% } %>
        </div>
    </section>
<% } %>

<!-- Why Choose Us -->
<section class="why-choose">
    <h2>Why Choose Bus2Frnd?</h2>
    <div class="features">
        <div class="feature-box">
            <img src="images/easy.gif" alt="Easy Booking">
            <h3>Easy Booking</h3>
            <p>Book your bus tickets in just a few clicks with a smooth and user-friendly interface.</p>
        </div>
        <div class="feature-box">
            <img src="images/trusted.gif" alt="Trusted Services">
            <h3>Trusted Services</h3>
            <p>Secure and trusted service with real-time seat availability and booking confirmation.</p>
        </div>
        <div class="feature-box">
            <img src="images/support.gif" alt="24/7 Support">
            <h3>24/7 Support</h3>
            <p>Our customer service team is available round the clock to assist you with your bookings.</p>
        </div>
    </div>
</section>

<!-- How It Works -->
<section class="how-it-works">
    <h2>How It Works</h2>
    <div class="steps">
        <div class="step">
            <span>1</span>
            <p>Search for buses based on your route and date.</p>
        </div>
        <div class="step">
            <span>2</span>
            <p>Select your preferred bus and seat.</p>
        </div>
        <div class="step">
            <span>3</span>
            <p>Enter your details and confirm your booking.</p>
        </div>
        <div class="step">
            <span>4</span>
            <p>Download your ticket with QR code.</p>
        </div>
    </div>
</section>



<!-- Footer -->
<footer class="footer">
    <div class="footer-logo">
        <img src="images/logo.png" alt="Bus2Frnd" height="30">
    </div>
    <p>© 2025 BUS2FRND. All rights reserved. Designed for comfortable travel.</p>
</footer>

</body>
</html>
