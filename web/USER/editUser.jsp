<%@page import="models.User"%>
<%
    // Ensure user is logged in and has "Admin" role
    if (session.getAttribute("username") == null || session.getAttribute("role") == null || !session.getAttribute("role").equals("Admin")) {
        response.sendRedirect("../login.jsp"); // Redirect if not logged in or not an admin
    }
    
    User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(to bottom right, #6a11cb, #2575fc);
            color: #fff;
            font-family: 'Arial', sans-serif;
            animation: fadeInBody 1.5s ease-in-out;
        }

        h1 {
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            font-weight: bold;
            font-size: 2.5rem;
            animation: slideDown 1s ease-out;
        }

        form {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            animation: fadeInForm 1.5s ease-in-out;
        }

        .form-label {
            font-weight: bold;
            color: #fff;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }

        .form-control, .form-select {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            border: none;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .form-control:focus, .form-select:focus {
            background-color: rgba(255, 255, 255, 0.3);
            outline: none;
            transform: scale(1.02);
        }

        .btn {
            border-radius: 50px;
            font-weight: bold;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #4caf50;
            color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .btn-primary:hover {
            background-color: #45a049;
            transform: scale(1.1);
        }

        .invalid-feedback {
            color: #ff5252;
        }

        @keyframes fadeInBody {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeInForm {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
<jsp:include page="/components/navbar.jsp"/>

    <div class="container mt-5">
        <h1 class="text-center mb-4">Edit User</h1>
        <form action="UserController" method="POST" class="needs-validation" novalidate>
            <!-- Hidden Fields -->
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            
            <!-- Username -->
            <div class="mb-3">
                <label for="username" class="form-label">Username <i class="fas fa-user-circle"></i></label>
                <input type="text" class="form-control" id="username" name="username" value="<%= user.getUsername() %>" required>
                <div class="invalid-feedback">Username is required.</div>
            </div>
            
            <!-- Password -->
            <div class="mb-3">
                <label for="password" class="form-label">Password <i class="fas fa-key"></i></label>
                <input type="password" class="form-control" id="password" name="password" value="<%= user.getPassword() %>" required>
                <div class="invalid-feedback">Password is required.</div>
            </div>
            
            <!-- Email -->
            <div class="mb-3">
                <label for="email" class="form-label">Email <i class="fas fa-envelope"></i></label>
                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
                <div class="invalid-feedback">Please enter a valid email.</div>
            </div>
            
            <!-- Full Name -->
            <div class="mb-3">
                <label for="full_name" class="form-label">Full Name <i class="fas fa-user"></i></label>
                <input type="text" class="form-control" id="full_name" name="full_name" value="<%= user.getFullName() %>" required>
                <div class="invalid-feedback">Full name is required.</div>
            </div>
            
            <!-- Role -->
            <div class="mb-3">
                <label for="role" class="form-label">Role <i class="fas fa-users-cog"></i></label>
                <select class="form-select" id="role" name="role" required>
                    <option value="Admin" <%= user.getRole().equals("Admin") ? "selected" : "" %>>Admin</option>
                    <option value="User" <%= user.getRole().equals("User") ? "selected" : "" %>>User</option>
                </select>
                <div class="invalid-feedback">Please select a role.</div>
            </div>
            
            <!-- Department -->
            <div class="mb-3">
                <label for="department" class="form-label">Department <i class="fas fa-briefcase"></i></label>
                <select class="form-select" id="department" name="department_id" required>
                    <option value="1" <%= user.getDepartmentId() == 1 ? "selected" : "" %>>HR</option>
                    <option value="2" <%= user.getDepartmentId() == 2 ? "selected" : "" %>>Finance</option>
                    <option value="3" <%= user.getDepartmentId() == 3 ? "selected" : "" %>>Sales</option>
                    <option value="4" <%= user.getDepartmentId() == 4 ? "selected" : "" %>>Marketing</option>
                    <option value="5" <%= user.getDepartmentId() == 5 ? "selected" : "" %>>IT Support</option>
                </select>
                <div class="invalid-feedback">Please select a department.</div>
            </div>
            
            <!-- Status -->
            <div class="mb-3">
                <label for="status" class="form-label">Status <i class="fas fa-info-circle"></i></label>
                <select class="form-select" id="status" name="status" required>
                    <option value="ACTIVE" <%= user.getStatus().equals("ACTIVE") ? "selected" : "" %>>Active</option>
                    <option value="INACTIVE" <%= user.getStatus().equals("INACTIVE") ? "selected" : "" %>>Inactive</option>
                </select>
                <div class="invalid-feedback">Please select a status.</div>
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Update User</button>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
