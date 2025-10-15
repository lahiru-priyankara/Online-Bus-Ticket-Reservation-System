<%@ page import="java.util.List" %>
<%@ page import="model.BusRouteView" %>
<%@ page import="service.BusRouteService" %>
<%@ page import="util.DBUtil" %>

<%
    BusRouteService service = new BusRouteService(DBUtil.getConnection());
    List<BusRouteView> list = service.getAllBusRouteData();
%>

<html>
<head>
    <title>Bus and Route Details</title>
</head>
<body>
    <h2>Bus and Route Data</h2>
    <table border="1">
        <tr>
            <th>Bus Name</th>
            <th>Type</th>
            <th>Departure</th>
            <th>Arivel</th>
            <th>Source</th>
            <th>Destination</th>
            <th>Date</th>
            <th>Actions</th>
        </tr>
        <%
            if (list != null && !list.isEmpty()) {
                for (BusRouteView b : list) {
        %>
        <tr>
            <td><%= b.getBusName() %></td>
            <td><%= b.getType() %></td>
            <td><%= b.getDepartureTime() %></td>
            <td><%= b.getArivelTime() %></td>
            <td><%= b.getSource() %></td>
            <td><%= b.getDestination() %></td>
            <td><%= b.getTravelDate() %></td>
            <td>
                <a href="BusRouteController?action=delete&busId=<%= b.getBusId() %>&routeId=<%= b.getRouteId() %>">Delete</a> |
                <a href="editBusRoute.jsp?busId=<%= b.getBusId() %>&routeId=<%= b.getRouteId() %>">Edit</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="7">No data found</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>
