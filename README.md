<h1 align="center">🚌 Online Bus Ticket Reservation System</h1>
<h3 align="center">Efficient, Reliable, and User-Friendly Bus Booking Platform</h3>

---

## 📖 Introduction
The Online Bus Ticket Reservation System is designed to provide users with a seamless and efficient platform for searching, booking, and managing bus tickets. It enables passengers to **compare routes, book seats, and manage their bookings**, while admins and bus operators manage system data, bookings, and payments.

The system supports multiple stakeholders:
- **Passengers** – Register, book tickets, manage profiles, and submit feedback  
- **Bus Operators** – Add and manage buses, routes, and schedules  
- **User Management Admins** – Manage user accounts and access  
- **Ticket Booking Admins** – Oversee and modify bookings  
- **Payment Management** – Handle payments and refunds  

The platform ensures **reliability, ease of use, and secure transactions**, making it a dependable solution for modern travel needs.

---

## 🛠️ Features

### For Passengers:
- **User Registration & Login:** Secure account creation and authentication  
- **Search Buses:** Filter by route, date, and time  
- **Book Tickets:** Select seats and enter passenger details  
- **Manage Bookings:** View history, modify or cancel bookings (within policy)  
- **Payment Integration:** Secure payment processing  
- **Feedback Submission:** Submit and track feedback

### For Admins & Operators:
- **Bus & Route Management:** Add, update, or remove buses and routes  
- **User Management:** View, block, or delete user accounts  
- **Booking Management:** View, update, or cancel any booking  
- **Payment Oversight:** Process refunds and monitor transactions  
- **Feedback Review:** Access and respond to passenger feedback

---

## ⚙️ System Requirements

### Functional:
- User authentication and role-based access control  
- Bus and route search with real-time availability  
- Ticket booking, modification, and cancellation  
- Payment processing and refund handling  
- Admin and operator dashboards for system management

### Non-Functional:
- **Security:** Password encryption, secure payment gateway  
- **Performance:** Fast search and booking experience  
- **Scalability:** Support for multiple operators and high user traffic  
- **Availability:** Reliable uptime for 24/7 access

---

## 💻 Technologies Used

<p align="center">
  <img src="https://skillicons.dev/icons?i=html,css,js,java,mysql,tomcat" />
</p>

- **Frontend:** HTML, CSS, JavaScript, JSP/Thymeleaf  
- **Backend:** Java Servlets, JDBC  
- **Database:** MySQL/PostgreSQL  
- **Server:** Apache Tomcat  
- **Payment Gateway:** Razorpay/PayPal (for demo)

---

## 🏗️ System Architecture

### MVC Pattern:
- **Model:** User, Bus, Route, Booking, Payment, Feedback  
- **View:** JSP/HTML pages (e.g., register.jsp, booking.jsp, admin_dashboard.jsp)  
- **Controller:** Servlets (UserServlet, BookingServlet, AdminServlet, PaymentServlet)

---

## 🗃️ Database Design

Key Tables:
- **Users:** user_id, name, email, phone, password, role  
- **Buses:** bus_id, bus_name, bus_number, type, total_seats  
- **Routes:** route_id, source, destination, stops  
- **Schedules:** schedule_id, bus_id, departure_time, arrival_time, date  
- **Bookings:** booking_id, user_id, bus_id, seat_numbers, status  
- **Payments:** payment_id, booking_id, amount, status, transaction_id  
- **Feedback:** feedback_id, user_id, subject, message, date

---

## 🚀 Getting Started

### Prerequisites:
- Java JDK 8 or higher
- Apache Tomcat 9+
- MySQL/PostgreSQL
- Maven (optional)

## 📫 Contact
- **Email:** officiallahiru.p@gmail.com  
- **GitHub:** [lahiru-priyankara](https://github.com/lahiru-priyankara)  
