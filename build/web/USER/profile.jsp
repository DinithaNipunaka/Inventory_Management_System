<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.DBConnection" %>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp");
    }
    String message = (String) session.getAttribute("message");
    session.removeAttribute("message"); // Clear the message after it has been displayed
    int userId = (Integer) session.getAttribute("id");
    Connection connection = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    PreparedStatement deptStmt = null;
    ResultSet deptRs = null;

    String username = "", email = "", fullName = "", imgPath = "", departmentName = "";
    int departmentId = 0;

    try {
        connection = DBConnection.dbConn();
        String query = "SELECT username, email, full_name, img_path, department_id FROM users WHERE id = ?";
        stmt = connection.prepareStatement(query);
        stmt.setInt(1, userId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            username = rs.getString("username");
            email = rs.getString("email");
            fullName = rs.getString("full_name");
            imgPath = rs.getString("img_path");
            departmentId = rs.getInt("department_id");

            // Query to get department name based on departmentId
            String deptQuery = "SELECT name FROM departments WHERE id = ?";
            deptStmt = connection.prepareStatement(deptQuery);
            deptStmt.setInt(1, departmentId);
            deptRs = deptStmt.executeQuery();

            if (deptRs.next()) {
                departmentName = deptRs.getString("name");
            }
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (deptRs != null) {
                deptRs.close();
            }
            if (deptStmt != null) {
                deptStmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Profile</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <!-- SweetAlert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Custom Styles -->
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f7fc;
            }

            .container {
                margin-top: 30px;
                background-color: #fff;
                border-radius: 10px;
                padding: 30px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                font-size: 2rem;
                color: #333;
                text-align: center;
                margin-bottom: 20px;
                text-transform: uppercase;
                letter-spacing: 1px;
                animation: fadeIn 1s ease;
            }

            .avatar {
                border-radius: 50%;
                transition: transform 0.3s ease;
            }

            .avatar:hover {
                transform: scale(1.1);
            }

            .form-control {
                border-radius: 8px;
                border: 1px solid #ddd;
                box-shadow: none;
                padding: 12px 15px;
                transition: border-color 0.3s;
            }

            .form-control:focus {
                border-color: #007bff;
                box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                border-radius: 8px;
                padding: 12px 20px;
                font-size: 1rem;
                transition: background-color 0.3s ease;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
                border-radius: 8px;
                padding: 12px 20px;
                font-size: 1rem;
                transition: background-color 0.3s ease;
            }

            .btn-secondary:hover {
                background-color: #495057;
                border-color: #495057;
            }

            .row {
                margin-top: 20px;
                animation: fadeIn 1.5s ease;
            }

            .text-center h6 {
                color: #007bff;
                font-size: 1rem;
                font-weight: bold;
            }

            .form-group small {
                font-size: 0.9rem;
                color: #777;
            }

            .alert {
                animation: slideIn 1s ease;
            }

            @keyframes fadeIn {
                0% { opacity: 0; }
                100% { opacity: 1; }
            }

            @keyframes slideIn {
                0% { transform: translateX(100%); }
                100% { transform: translateX(0); }
            }
        </style>
    </head>
    <body>
        <jsp:include page="/components/navbar.jsp"/>

        <div class="container">
            <h1><b><b>Edit Profile</b></h1>
            <hr>
            <div class="row">
                <!-- Profile Image Section -->
                <div class="col-md-3 text-center">
                    <div>
                        <img src="<%= imgPath != null ? "../" + imgPath : "//placehold.it/150"%>" class="avatar" alt="avatar" style="width:150px;height:150px;">
                        <h6>Upload a different photo...</h6>
                        <form action="../ProfileController" method="post" enctype="multipart/form-data">
                            <div>
                                <input type="file" class="form-control" name="profilePicture">
                            </div>
                       
                    </div>
                </div>

                <!-- Personal Info Section -->
                <div class="col-md-9 personal-info">
                    <form action="../ProfileController" method="post" enctype="multipart/form-data">
                        <div class="form-group mb-3">
                            <label class="control-label">Full Name:</label>
                            <input class="form-control" type="text" name="fullName" value="<%= fullName%>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label class="control-label">Username:</label>
                            <input class="form-control" type="text" name="username" value="<%= username%>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label class="control-label">Email:</label>
                            <input class="form-control" type="email" name="email" value="<%= email%>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label class="control-label">Password:</label>
                            <input class="form-control" type="password" name="password">
                            <small class="form-text text-muted">Leave blank to keep your current password.</small>
                        </div>
                        <div class="form-group mb-3">
                            <label class="control-label">Department:</label>
                            <input class="form-control" type="text" value="<%= departmentName%>" readonly>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            <a href="items.jsp" class="btn btn-secondary">Cancel</a>
                        </div>
                          <label><%= imgPath%></label>
                    </form>
                           
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
            <%
                if (message != null) {
            %>
            Swal.fire({
                title: "<%= message%>",
                icon: "<%= message.contains("Successfully") ? "success" : "error"%>",
                text: "<%= message%>",
                confirmButtonText: "OK"
            });
            <%
                }
            %>
        </script>
    </body>
</html>
