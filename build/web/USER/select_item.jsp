<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    // Retrieve the data from the request parameters
    String itemId = request.getParameter("itemId");
    String itemName = request.getParameter("itemName");
    String itemQuantity = request.getParameter("itemQuantity");
    String userId = request.getParameter("userId");

    // Check if all necessary data is available
    if (itemId == null || itemName == null || itemQuantity == null || userId == null) {
        response.sendRedirect("home.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Select Item</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom right, #e3f2fd, #ffffff);
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .container {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            padding: 30px;
            max-width: 600px;
            animation: fadeIn 1s ease-in-out;
        }
        h2 {
            color: #007bff;
            font-weight: bold;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: bold;
            color: #555;
        }
        .btn {
            transition: all 0.3s ease-in-out;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
        }
        .form-control {
            border: 1px solid #ccc;
            transition: all 0.3s ease-in-out;
        }
        .form-control:focus {
            box-shadow: 0 0 8px #007bff;
            border-color: #007bff;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/components/navbar.jsp"/>
    <div class="container mt-5">
        <h2 class="mb-4 text-center">
            <i class="fas fa-box"></i> Select Quantity for <%= itemName %>
        </h2>
        <form action="../GetItemServlet" method="POST">
            <input type="hidden" name="itemId" value="<%= itemId %>">
            <input type="hidden" name="userId" value="<%= userId %>">
            <div class="mb-3">
                <label for="itemName" class="form-label"><i class="fas fa-tag"></i> Item Name</label>
                <input type="text" class="form-control" id="itemName" name="itemName" value="<%= itemName %>" readonly>
            </div>
            <div class="mb-3">
                <label for="availableQuantity" class="form-label"><i class="fas fa-cubes"></i> Available Quantity</label>
                <input type="number" class="form-control" id="availableQuantity" name="availableQuantity" value="<%= itemQuantity %>" readonly>
            </div>
            <div class="mb-3">
                <label for="desiredQuantity" class="form-label"><i class="fas fa-cart-plus"></i> Desired Quantity</label>
                <input type="number" class="form-control" id="desiredQuantity" name="desiredQuantity" min="1" max="<%= itemQuantity %>" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">
                <i class="fas fa-check-circle"></i> Submit
            </button>
        </form>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
