<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>About Us - Bus Booking System</title>
     <link rel="stylesheet" href="css/header.css">
     <link rel="stylesheet" href="css/footer.css">
     
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: #333;
        }

        /* Hero Section */
        .hero {
            position: relative;
            background: url('images/About.jpg') no-repeat center center/cover;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-overlay {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 60px 20px;
            width: 100%;
        }

        .hero h1 {
            color: #fff;
            font-size: 48px;
            margin-bottom: 10px;
        }

        .hero p {
            color: #ddd;
            font-size: 20px;
        }

        /* Container */
        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .section {
            margin-bottom: 50px;
        }

        .section h2 {
            font-size: 28px;
            margin-bottom: 15px;
            color: #2c3e50;
        }

        .section p {
            line-height: 1.7;
            font-size: 16px;
            color: #555;
        }

        /* Contact Section */
        .contact-box {
            background-color: #eaf2f8;
            padding: 25px;
            border-radius: 10px;
        }

        .contact-box h3 {
            margin-top: 0;
        }

        .contact-box p {
            margin: 5px 0;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 32px;
            }
            .hero p {
                font-size: 16px;
            }
        }
    </style>
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
<div class="hero">
    <div class="hero-overlay">
        <h1>About Us</h1>
        <p>Empowering Seamless Travel, One Ticket at a Time</p>
    </div>
</div>

<!-- Main Content -->
<div class="container">

    <!-- About Section -->
    <div class="section">
        <h2>Who We Are</h2>
        <p>
            Welcome to our Bus Booking System – your ultimate solution for fast, secure, and convenient travel across the country. 
            With a passion for technology and a commitment to hassle-free commuting, we bring passengers and bus services together in a seamless digital experience.
        </p>
    </div>

    <!-- Mission Section -->
    <div class="section">
        <h2>Our Mission</h2>
        <p>
            Our mission is to modernize public transport by enabling passengers to find, book, and manage their bus trips anytime, anywhere. 
            We believe that traveling should be easy and stress-free, and our platform is built to deliver just that – for everyone.
        </p>
    </div>

    <!-- Why Choose Us -->
    <div class="section">
        <h2>Why Choose Us</h2>
        <p>
            ✅ Fast, real-time seat availability<br>
            ✅ Trusted by hundreds of passengers daily<br>
            ✅ Secure payment system<br>
            ✅ Friendly customer support<br>
            ✅ Multiple routes, buses, and operators<br>
            ✅ View, download and manage your ticket with QR code
        </p>
    </div>

    <!-- Contact Section -->
    <div class="section contact-box">
        <h2>Contact Us</h2>
        <p>Need assistance? We’d love to hear from you!</p>
        <p><strong>📍 Address:</strong> 123 Main Street, Colombo, Sri Lanka</p>
        <p><strong>📞 Phone:</strong> +94 71 123 4567</p>
        <p><strong>✉️ Email:</strong> support@luminride.com</p>
        <p><strong>🕐 Working Hours:</strong> Monday – Friday: 8:00 AM – 6:00 PM</p>
        
        <br><br>
         <h2>Admin Section</h2>
         <div class="auth-buttons">
         <a href="admin_login.jsp" style="color: red;">Admin Login</a>
         </div>

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
