<%@ page import="java.sql.*, model.BusRouteView, service.BusRouteService, util.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int busId = Integer.parseInt(request.getParameter("busId"));
    int routeId = Integer.parseInt(request.getParameter("routeId"));

    BusRouteService service = new BusRouteService(DBUtil.getConnection());
    BusRouteView busRoute = null;

    for (BusRouteView b : service.getAllBusRouteData()) {
        if (b.getBusId() == busId && b.getRouteId() == routeId) {
            busRoute = b;
            break;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Bus and Route</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 600px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            margin-top: 25px;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            font-size: 15px;
            margin-top: 10px;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>

<%
    if (busRoute == null) {
%>
    <div class="container">
        <p class="message error">Data not found!</p>
    </div>
<%
    } else {
%>
<div class="container">
    <h2>Update Bus and Route Info</h2>
    <form action="BusRouteController?action=update" method="post">

        <input type="hidden" name="busId" value="<%= busRoute.getBusId() %>">
        <input type="hidden" name="routeId" value="<%= busRoute.getRouteId() %>">

        <label>Bus Name:</label>
        <input type="text" name="busName" value="<%= busRoute.getBusName() %>" required>

        <label>Type:</label>
        <input type="text" name="type" value="<%= busRoute.getType() %>" required>

        <label>Departure Time:</label>
        <input type="text" name="departureTime" value="<%= busRoute.getDepartureTime() %>" required>

        <label>Source:</label>
        <input type="text" name="source" value="<%= busRoute.getSource() %>" required>

        <label>Destination:</label>
        <input type="text" name="destination" value="<%= busRoute.getDestination() %>" required>

        <label>Travel Date:</label>
        <input type="date" name="travelDate" value="<%= busRoute.getTravelDate() %>" required>

        <input type="submit" value="Update">
    </form>
</div>
<%
    }
%>

</body>
</html>
