<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; }
        .card { background: white; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); padding: 20px; }
        .error-message { color: #d32f2f; margin-bottom: 20px; padding: 15px; background-color: #ffebee; border-radius: 4px; }
        .btn { padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; text-decoration: none; display: inline-block; }
        .btn-primary { background-color: #2196F3; color: white; }
    </style>
</head>
<body>
<div class="container">
    <h1>Error Occurred</h1>
    
    <div class="card">
        <div class="error-message">
            <%= request.getAttribute("errorMessage") != null ? 
                request.getAttribute("errorMessage") : "An unexpected error occurred" %>
        </div>
        
        <a href="BusOperatorServlet?action=view" class="btn btn-primary">Back to Dashboard</a>
    </div>
</div>
</body>
</html>