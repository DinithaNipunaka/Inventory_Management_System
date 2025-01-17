<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(to bottom right, #f0f4ff, #ffffff);
            font-family: 'Arial', sans-serif;
        }
        .container {
            background: #ffffff;
            border-radius: 15px;
            padding: 30px;
            max-width: 700px;
            margin: auto;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }
        h1 {
            color: #007bff;
            font-weight: bold;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            color: #333;
            font-weight: bold;
        }
        .form-control, .form-select {
            border: 1px solid #ccc;
            transition: all 0.3s ease-in-out;
        }
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 8px #007bff;
            border-color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: all 0.3s ease-in-out;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
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
<%
    // Ensure user is logged in and has "Admin" role
    if (session.getAttribute("username") == null || session.getAttribute("role") == null || !session.getAttribute("role").equals("Admin")) {
        response.sendRedirect("../login.jsp"); // Redirect if not logged in or not an admin
    }
    int userId = (int) session.getAttribute("id");
    String fullName = (String) session.getAttribute("full_name");
%>
<jsp:include page="/components/navbar.jsp"/>

<div class="container mt-5">
    <h1 class="mb-4 text-center">
        <i class="fas fa-box-open"></i> Add New Inventory Item
    </h1>
    <form action="InventoryController" method="POST">
        <input type="hidden" name="action" value="add">
        
        <!-- Item Name -->
        <div class="mb-3">
            <label for="item_name" class="form-label"><i class="fas fa-tag"></i> Item Name</label>
            <input type="text" class="form-control" id="item_name" name="item_name" placeholder="Enter item name" required>
        </div>

        <!-- Description -->
        <div class="mb-3">
            <label for="description" class="form-label"><i class="fas fa-info-circle"></i> Description</label>
            <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter item description" required></textarea>
        </div>

        <!-- Quantity -->
        <div class="mb-3">
            <label for="quantity" class="form-label"><i class="fas fa-cubes"></i> Quantity</label>
            <input type="number" class="form-control" id="quantity" name="quantity" min="0" placeholder="Enter quantity" required>
        </div>

        <!-- Status -->
        <div class="mb-3">
            <label for="status" class="form-label"><i class="fas fa-clipboard-check"></i> Status</label>
            <select class="form-select" id="status" name="status" required>
                <option value="IN STOCK">Available</option>
                <option value="OUT OF STOCK">Out of Stock</option>
            </select>
        </div>

        <!-- Submit Button -->
        <div class="text-center">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-plus-circle"></i> Add Inventory
            </button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
