<%@ page import="models.inventoryTbl"%>
<%@ page import="models.User" %>
<%
    // Ensure user is logged in and has "Admin" role
    if (session.getAttribute("username") == null || session.getAttribute("role") == null || !session.getAttribute("role").equals("Admin")) {
        response.sendRedirect("../login.jsp"); // Redirect if not logged in or not an admin
    }
    
    inventoryTbl inventory = (inventoryTbl) request.getAttribute("inventory");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Inventory Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(to bottom right, #e3f2fd, #ffffff);
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
        .form-control {
            border: 1px solid #ccc;
            transition: all 0.3s ease-in-out;
        }
        .form-control:focus {
            box-shadow: 0 0 8px #007bff;
            border-color: #007bff;
        }
        .btn-primary {
            transition: all 0.3s ease-in-out;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 15px;
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
        <h1 class="mb-4 text-center">
            <i class="fas fa-edit"></i> Edit Inventory Item
        </h1>
        <form action="InventoryController" method="POST" class="needs-validation" novalidate>
            <!-- Hidden Fields -->
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= inventory.getId() %>">
            
            <!-- Item Name -->
            <div class="mb-3">
                <label for="item_name" class="form-label"><i class="fas fa-tag"></i> Item Name</label>
                <input type="text" class="form-control" id="item_name" name="item_name" value="<%= inventory.getItemName() %>" required>
                <div class="invalid-feedback">Item name is required.</div>
            </div>
            
            <!-- Description -->
            <div class="mb-3">
                <label for="description" class="form-label"><i class="fas fa-info-circle"></i> Description</label>
                <input type="text" class="form-control" id="description" name="description" value="<%= inventory.getDescription() %>" required>
                <div class="invalid-feedback">Description is required.</div>
            </div>
            
            <!-- Quantity -->
            <div class="mb-3">
                <label for="quantity" class="form-label"><i class="fas fa-box"></i> Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" value="<%= inventory.getQuantity() %>" required>
                <div class="invalid-feedback">Quantity is required.</div>
            </div>
            
            <!-- Status -->
            <div class="form-group mb-4">
                <label for="status" class="form-label"><i class="fas fa-clipboard-check"></i> Status</label>
                <select name="status" id="status" class="form-control" required>
                    <option value="IN STOCK" <%= inventory.getStatus().equals("IN STOCK") ? "selected" : ""%>>IN STOCK</option>
                    <option value="OUT OF STOCK" <%= inventory.getStatus().equals("OUT OF STOCK") ? "selected" : ""%>>OUT OF STOCK</option>
                </select>
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary w-100">
                <i class="fas fa-save"></i> Update
            </button>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Bootstrap form validation
        (function () {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.from(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
</body>
</html>
