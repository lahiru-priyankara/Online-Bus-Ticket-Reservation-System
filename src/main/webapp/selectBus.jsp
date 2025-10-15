<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Bus" %>
<html>
<head><title>Bus List</title></head>
<body>
<h2>Available Buses</h2>
<% List<Bus> buses = (List<Bus>) request.getAttribute("buses"); %>
<% if (buses != null && !buses.isEmpty()) { %>
    <table border="1">
        <tr><th>Name</th><th>Type</th><th>Departure</th><th>Arivel</th><th>Action</th></tr>
        <% for (Bus bus : buses) { %>
            <tr>
                <td><%= bus.getName() %></td>
                <td><%= bus.getType() %></td>
                <td><%= bus.getDepartureTime() %></td>
                <td><%= bus.getArivelTime() %></td>
                <td><a href="ViewSeatsServlet?busId=<%= bus.getBusId() %>">View Seats</a></td>
            </tr>
        <% } %>
    </table>
<% } else { %>
    <p>No buses available for selected route and date.</p>
<% } %>
</body>
</html>