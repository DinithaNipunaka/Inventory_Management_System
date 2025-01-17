<%@ page import="models.DBConnection" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp");
    }

    // Fetching items from the database
    List<Map<String, Object>> items = new ArrayList<>();
    Connection connection = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Establish the database connection
        connection = DBConnection.dbConn();

        String sql = "SELECT * FROM inventory WHERE status = 'IN STOCK'";
        stmt = connection.prepareStatement(sql);
        rs = stmt.executeQuery();

        // Loop through the result set and create a map for each item
        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("id", rs.getInt("id"));
            item.put("quantity", rs.getInt("quantity"));
            item.put("item_name", rs.getString("item_name"));
            item.put("description", rs.getString("description"));
            item.put("img_path", rs.getString("img_path"));

            // Add the map (item) to the list
            items.add(item);
        }

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <!-- SweetAlert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>
            /* Custom Styles for UI Enhancement */
            body {
                background-color: #f8f9fa;
                font-family: 'Arial', sans-serif;
            }

            .navbar {
                background-color: #007bff !important;
                transition: background-color 0.3s ease;
            }

            .navbar:hover {
                background-color: #0056b3 !important;
            }

          

            .container {
                margin-top: 40px;
            }

            .table {
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .table th, .table td {
                padding: 1.2rem;
                text-align: center;
                font-size: 1rem;
                vertical-align: middle;
            }

            .table-hover tbody tr:hover {
                background-color: #f1f1f1;
                transform: scale(1.02);
                transition: all 0.3s ease-in-out;
            }

            .btn-primary {
                background-color: #28a745;
                border-color: #28a745;
                transition: background-color 0.3s ease;
            }

            .btn-primary:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }

            .btn-sm {
                padding: 0.4rem 0.6rem;
                font-size: 0.875rem;
            }

            .img-thumbnail {
                max-width: 120px;
                max-height: 100px;
                object-fit: cover;
                border-radius: 10px;
                transition: transform 0.3s ease;
            }

            .img-thumbnail:hover {
                transform: scale(1.1);
            }

            .alert-warning {
                background-color: #ffcc00;
                color: #000;
                font-weight: bold;
            }

            h2 {
                font-size: 2rem;
                font-weight: 600;
                color: #343a40;
                text-align: center;
                margin-bottom: 30px;
            }

            .modal-content {
                border-radius: 15px;
                box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <!-- Include Navbar -->
        <jsp:include page="/components/navbar.jsp"/>

        <!-- Check for success or error messages passed via URL parameters -->
        <%
            String successMessage = request.getParameter("success");
            String errorMessage = request.getParameter("error");

            if (successMessage != null) {
        %>
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Success!',
                    text: '<%= successMessage %>',
                    showConfirmButton: false,
                    timer: 1500,
                });
            </script>
        <%
            } else if (errorMessage != null) {
        %>
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: '<%= errorMessage %>',
                    showConfirmButton: false,
                    timer: 1500,
                });
            </script>
        <%
            }
        %>

        <!-- Main Content -->
        <%
            if (items != null && !items.isEmpty()) {
        %>
        <div class="container mt-5">
            <h2 class="mb-4"><b>Available Items</b></h2>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Image</th>
                        <th>Item Name</th>
                        <th>Description</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Loop through each item and display its details
                        for (Map<String, Object> item : items) {
                    %>
                    <tr>
                        <td><img src="<%= item.get("img_path") != null ? item.get("img_path") : "https://via.placeholder.com/150"%>" alt="<%= item.get("item_name")%>" class="img-thumbnail"></td>
                        <td><%= item.get("item_name") %></td>
                        <td><%= item.get("description") %></td>
                        <td><%= item.get("quantity") %></td>
                        <td>
                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal" 
                                    data-bs-target="#getItemModal" 
                                    data-item-id="<%= item.get("id") %>" 
                                    data-item-user_id="<%= session.getAttribute("id") %>" 
                                    data-item-name="<%= item.get("item_name") %>" 
                                    data-item-quantity="<%= item.get("quantity") %>" 
                                    data-user-id="<%= session.getAttribute("user_id") %>">
                                <i class="fas fa-cart-plus"></i> Order Item
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <%
            } else {
        %>
        <div class="container mt-5">
            <p class="alert alert-warning">No items available at the moment.</p>
        </div>
        <%
            }
        %>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Modal Script to pass data to select_item.jsp -->
        <script>
            const getItemButtons = document.querySelectorAll('.btn-primary');
            getItemButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Get data attributes
                    const itemId = button.getAttribute('data-item-id');
                    const userId = button.getAttribute('data-item-user_id');
                    const itemName = button.getAttribute('data-item-name');
                    const itemQuantity = button.getAttribute('data-item-quantity');
                    
                    // Pass data to select_item.jsp through a redirect
                    window.location.href = 'select_item.jsp?itemId=' + itemId + '&itemName=' + encodeURIComponent(itemName) + '&itemQuantity=' + itemQuantity + '&userId=' + userId;
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
