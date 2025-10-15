<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Bus" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Buses</title>
</head>
<body>
<h2>All Buses</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Type</th>
        <th>Route ID</th>
        <th>Departure Time</th>
    </tr>
    <%
        List<Bus> busList = (List<Bus>) request.getAttribute("busList");
        if (busList != null && !busList.isEmpty()) {
            for (Bus bus : busList) {
    %>
    <tr>
        <td><%= bus.getBusId() %></td>
        <td><%= bus.getName() %></td>
        <td><%= bus.getType() %></td>
        <td><%= bus.getRouteId() %></td>
        <td><%= bus.getDepartureTime() %></td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="5">No buses found.</td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
