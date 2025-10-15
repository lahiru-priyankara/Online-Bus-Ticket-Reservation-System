<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Bus and Route</title>
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

        h2, h3 {
            text-align: center;
            color: #333;
        }

        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        input[type="number"] {
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

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add Bus and Route</h2>

    <%
        if ("1".equals(request.getParameter("success"))) {
    %>
        <p class="message success">Bus and Route added successfully!</p>
    <%
        } else if ("1".equals(request.getParameter("error"))) {
    %>
        <p class="message error">Failed to add bus and route. Try again.</p>
    <%
        }
    %>

    <form action="AddBusRoute" method="post">
        <h3>Route Details</h3>
        <label for="source">Source</label>
        <input type="text" id="source" name="source" required>

        <label for="destination">Destination</label>
        <input type="text" id="destination" name="destination" required>

        <label for="travelDate">Travel Date</label>
        <input type="date" id="travelDate" name="travelDate" required>

        <h3>Bus Details</h3>
        <label for="name">Bus Name</label>
        <input type="text" id="name" name="name" required>

        <label for="type">Bus Type</label>
        <input type="text" id="type" name="type" required>

        <label for="departureTime">Departure Time</label>
        <input type="time" id="departureTime" name="departureTime" required>

        <label for="arivelTime">Arrival Time</label>
        <input type="time" id="arivelTime" name="arivelTime" required>

        <h3>Seat Details</h3>
        <label for="seatCount">Seat Count</label>
        <input type="number" id="seatCount" name="seatCount" required>

        <label for="seatPrice">Seat Price</label>
        <input type="text" id="seatPrice" name="seatPrice" required>

        <input type="submit" value="Add Bus + Route">
    </form>
</div>

</body>
</html>
