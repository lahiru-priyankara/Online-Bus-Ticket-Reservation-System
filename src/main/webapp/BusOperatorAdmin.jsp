<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.BusRouteView" %>
<%@ page import="service.BusRouteService" %>
<%@ page import="util.DBUtil" %>

<%
    BusRouteService service = new BusRouteService(DBUtil.getConnection());
    List<BusRouteView> list = service.getAllBusRouteData();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus & Route Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            margin: 0;
            padding: 0;
        }
        .container {
            padding: 30px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .add-btn {
            background-color: #28a745;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 15px;
        }
        .add-btn:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px #ccc;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #343a40;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f7f7f7;
        }
        .action-link {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 14px;
            color: white;
            margin: 0 4px;
        }
        .edit-btn {
            background-color: #007bff;
        }
        .delete-btn {
            background-color: #dc3545;
        }
        .no-data {
            text-align: center;
            color: #666;
            padding: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="top-bar">
        <h2>Manage Bus & Route Information</h2>
        <a href="addBusRoute.jsp" class="add-btn">+ Add Bus</a>
    </div>

    <table>
        <tr>
            <th>Bus Name</th>
            <th>Type</th>
            <th>Departure</th>
            <th>Arrival</th>
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
                <a href="editBusRoute.jsp?busId=<%= b.getBusId() %>&routeId=<%= b.getRouteId() %>" class="action-link edit-btn">Edit</a>
                <a href="BusRouteController?action=delete&busId=<%= b.getBusId() %>&routeId=<%= b.getRouteId() %>" class="action-link delete-btn"
                   onclick="return confirm('Are you sure you want to delete this route?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="8" class="no-data">No bus or route data available.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>

</body>
</html>
