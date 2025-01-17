<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(to bottom right, #d7e8f7, #ffffff);
            font-family: 'Arial', sans-serif;
            color: #333;
        }
        .container {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 600px;
            animation: fadeIn 1s ease-in-out;
        }
        h1 {
            color: #3b5998;
            font-weight: bold;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: 600;
            color: #555;
        }
        .btn {
            transition: all 0.3s ease-in-out;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .form-control, .form-select {
            border: 1px solid #ccc;
            transition: all 0.3s ease-in-out;
        }
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 5px #3b5998;
            border-color: #3b5998;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <%
        int userId = (int) session.getAttribute("id");
        String fullName = (String) session.getAttribute("full_name");
    %>
    <jsp:include page="/components/navbar.jsp"/>

    <div class="container mt-5">
        <h1 class="mb-4 text-center">
            <i class="fas fa-user-plus"></i> New User
        </h1>
        <form action="UserController" method="POST">
            <input type="hidden" name="action" value="add">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            </div>
            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <select class="form-select" id="role" name="role" required>
                    <option value="Admin">Admin</option>
                    <option value="User">User</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
            </div>
            <div class="mb-3">
                <label for="full_name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="full_name" name="full_name" placeholder="Enter full name" required>
            </div>
            <div class="mb-3">
                <label for="department" class="form-label">Department</label>
                <select class="form-select" id="department" name="department" required>
                    <option value="1">HR</option>
                    <option value="2">Finance</option>
                    <option value="3">Sales</option>
                    <option value="4">Marketing</option>
                    <option value="5">IT Support</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-select" id="status" name="status" required>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary w-100">
                <i class="fas fa-plus-circle"></i> Add User
            </button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
