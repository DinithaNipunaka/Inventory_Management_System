<%@ page import="models.DBConnection" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*, java.util.Map" %>

<%
    // Check if the user is logged in
    if (session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp");
    }

    // Get the logged-in user's ID from the session
    int userId = (Integer) session.getAttribute("id");

    // List to store issued items
    List<Map<String, Object>> issuedItems = new ArrayList<>();
    Connection connection = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Establish the database connection
        connection = DBConnection.dbConn();

        // Updated SQL query to fetch only 'Brought' items and include created_at as Brought date
        String sql = "SELECT ii.id, ii.item_id, ii.quantity, ii.created_at, i.item_name, i.img_path " +
                     "FROM issued_items ii " +
                     "JOIN inventory i ON ii.item_id = i.id " +
                     "WHERE ii.user_id = ? AND ii.status = 'Brought'";

        stmt = connection.prepareStatement(sql);
        stmt.setInt(1, userId);  // Set the user_id in the query

        // Execute the query
        rs = stmt.executeQuery();

        // Populate the issuedItems list
        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("id", rs.getInt("id"));
            item.put("quantity", rs.getInt("quantity"));
            item.put("brought_date", rs.getTimestamp("created_at")); // Store the Brought date
            item.put("item_name", rs.getString("item_name"));
            item.put("img_path", rs.getString("img_path"));
            item.put("item_id", rs.getInt("item_id"));

            issuedItems.add(item);
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Issued Items</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- SweetAlert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- FontAwesome for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <style>
            /* Smooth transition on hover for table rows */
            table tbody tr {
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            table tbody tr:hover {
                background-color: #f1f1f1;
                transform: scale(1.02);
            }

            /* Button hover effect */
            .btn-hover {
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .btn-hover:hover {
                background-color: #ff5e5e;
                transform: scale(1.05);
            }

            /* Modal and animation styles */
            .animated {
                animation: fadeIn 1s ease;
            }

            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }

            /* Styled alert messages */
            .alert-custom {
                background-color: #28a745;
                color: white;
                border-radius: 5px;
            }

            /* Styling for the table */
            .table-hover tbody tr:hover {
                background-color: #f0f0f0;
            }

            .table-dark th {
                background-color: #343a40;
                color: white;
            }
        </style>
    </head>
    <body>
        <!-- Include Navbar -->
        <jsp:include page="/components/navbar.jsp"/>

        <!-- Main Content -->
        <div class="container mt-5 animated">
            <h2 class="mb-4 text-center text-primary"><b>Your Issued Items</b></h2>

            <% if (issuedItems.isEmpty()) { %>
                <p class="alert alert-warning text-center">You have not issued any items yet.</p>
            <% } else { %>
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Item Name</th>
                            <th>Image</th>
                            <th>Quantity</th>
                            <th>Brought Date</th> <!-- Updated column header -->
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, Object> item : issuedItems) { %>
                            <tr>
                                <td><%= item.get("item_name") %></td>
                                <td>
                                    <img src="<%= item.get("img_path") != null ? item.get("img_path") : "https://via.placeholder.com/150" %>" 
                                         alt="<%= item.get("item_name") %>" 
                                         style="width: 100px; height: auto;">
                                </td>
                                <td><%= item.get("quantity") %></td>
                                <td><%= item.get("brought_date") %></td> <!-- Display Brought date -->
                                <td>
                                    <a href="javascript:void(0);" class="btn btn-warning btn-sm btn-hover" 
                                       onclick="confirmReturn(<%= item.get("item_id") %>, <%= item.get("id") %>, <%= item.get("quantity") %>, <%= session.getAttribute("id") %>)">
                                        <i class="fas fa-undo-alt"></i> Return
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            function confirmReturn(itemId, invItemId, itemQuantity, userId) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: 'You want to return ' + itemQuantity + ' item(s)?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, return it!',
                    cancelButtonText: 'No, cancel!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Send request to ReturnController to handle item return
                        window.location.href = "../ReturnController?itemId=" + itemId + "&invItemId=" + invItemId + "&quantity=" + itemQuantity + "&userid=" + userId;
                    }
                });
            }
        </script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
