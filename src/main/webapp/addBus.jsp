<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Bus</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 12px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            padding: 10px;
            font-size: 15px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            font-size: 15px;
            margin-bottom: 15px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #007bff;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add New Bus</h2>

    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");
        if ("1".equals(success)) {
    %>
        <p class="message success">Bus added successfully!</p>
    <%
        } else if ("1".equals(error)) {
    %>
        <p class="message error">Failed to add bus. Try again.</p>
    <%
        }
    %>

    <form method="post" action="BusServlet">
        <label for="name">Bus Name</label>
        <input type="text" id="name" name="name" required>

        <label for="type">Type</label>
        <input type="text" id="type" name="type" required>

        <label for="routeId">Route ID</label>
        <input type="number" id="routeId" name="routeId" required>

        <label for="departureTime">Departure Time</label>
        <input type="text" id="departureTime" name="departureTime" placeholder="e.g. 08:30 AM" required>

        <input type="submit" value="Add Bus">
    </form>

    <a class="back-link" href="busRouteAdmin.jsp">← Back to Bus Admin</a>
</div>

</body>
</html>
