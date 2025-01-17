<%@page import="models.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Retrieve session data
    Integer userId = (Integer) session.getAttribute("id");
    String userImagePath = null;
    String userRole = (String) session.getAttribute("role"); // Fetch role from session

    if (userId != null) {
        // Database connection and query
        try (Connection connection = DBConnection.dbConn()) {
            String query = "SELECT img_path FROM users WHERE id = ?";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        userImagePath = rs.getString("img_path");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Default image if no user image path is found
    String profileImage = userImagePath != null ? "../" + userImagePath : "https://mdbcdn.b-cdn.net/img/new/avatars/2.webp";

    String homeLink = "User".equals(userRole) ? 
        request.getContextPath() + "/USER/items.jsp" : 
        request.getContextPath() + "/USER/dashboard.jsp";
%>

<nav class="navbar navbar-expand-lg navbar-light bg-primary shadow-sm rounded-3 py-3">
    <div class="container-fluid">
        <!-- Toggle button -->
        <button
            class="navbar-toggler text-white"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Navbar brand -->
            <a class="navbar-brand text-white fw-bold mt-2 mt-lg-0 animate__animated animate__fadeIn" href="<%= homeLink%>">
                IMS
                <img
                    src="${pageContext.request.contextPath}/img/image.png"
                    height="40"
                    alt="MDB Logo"
                    loading="lazy"
                    class="d-inline-block ms-2"
                    />
            </a>
            <!-- Left links -->
           <ul class="navbar-nav me-auto mb-2 mb-lg-0">
    <li class="nav-item">
        <a class="nav-link text-white" href="${pageContext.request.contextPath}/USER/items.jsp">
            <i class="fas fa-boxes me-2"></i><b>Available Items</b>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link text-white" href="${pageContext.request.contextPath}/USER/issued_items.jsp">
            <i class="fas fa-clipboard-list me-2"></i><b>Issued Items</b>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link text-white" href="${pageContext.request.contextPath}/USER/stock.jsp">
            <i class="fas fa-cogs me-2"></i><b>Stock</b>
        </a>
    </li>
</ul>


                <!-- Show Add User and Manage User dropdown if role is Admin -->
        <!-- Show Add User and Manage User dropdown if role is Admin -->
<% if ("Admin".equals(userRole)) { %>
    <li class="nav-item">
        <a class="nav-link text-white fw-bold" href="${pageContext.request.contextPath}/InventoryController">
            <i class="fas fa-warehouse me-2"></i><b>Inventory Management</b>
        </a>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white fw-bold" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fas fa-users-cog me-2"></i><b>User Management</b>
        </a>
        <ul class="dropdown-menu dropdown-menu-dark shadow-lg" aria-labelledby="navbarDropdown">
            <li>
                <a class="dropdown-item text-white" href="${pageContext.request.contextPath}/signIn.jsp">
                    <i class="fas fa-user-plus me-2"></i><b>Add User</b>
                </a>
            </li>
            <li>
                <a class="dropdown-item text-white" href="${pageContext.request.contextPath}/UserController">
                    <i class="fas fa-users me-2"></i><b>Manage Users</b>
                </a>
            </li>
        </ul>
    </li>
<% } %>

            </ul>
        </div>

        <!-- Right elements -->
        <div class="d-flex align-items-center">
            <label class="text-white me-3"><%= session.getAttribute("full_name")%></label>
            <!-- Avatar -->
            <div class="dropdown">
                <a
                    class="dropdown-toggle d-flex align-items-center hidden-arrow"
                    href="#"
                    id="navbarDropdownMenuAvatar"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                    >
                    <img
                        src="<%= profileImage%>"
                        class="rounded-circle shadow-sm"
                        height="35"
                        alt="User Avatar"
                        loading="lazy"
                        style="transition: transform 0.3s ease;"
                        onmouseover="this.style.transform='scale(1.1)'"
                        onmouseout="this.style.transform='scale(1)'"
                        />
                </a>
                <ul class="dropdown-menu dropdown-menu-end shadow-lg" aria-labelledby="navbarDropdownMenuAvatar">
                    <li>
                        <a class="dropdown-item text-primary" href="${pageContext.request.contextPath}/USER/profile.jsp">
                            <i class="fas fa-user-circle me-2"></i><b>My Profile</b>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item text-danger" onclick="confirmLogout()">
                            <i class="fas fa-sign-out-alt me-2"></i><b>Logout</b>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<script>
    function confirmLogout() {
        Swal.fire({
            title: 'Are you sure?',
            text: "You will be logged out.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, logout!'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '${pageContext.request.contextPath}/Logout'; // Redirect to logout
            }
        });
    }
</script>

<!-- Add Bootstrap and FontAwesome JS at the end of the body for faster page load -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    .nav-link:hover {
        color: #f8f9fa !important;
        background-color: #007bff;
    }

    .nav-item .dropdown-menu .dropdown-item:hover {

    }

    .navbar-brand:hover {
        color: #f8f9fa !important;
    }

    .navbar-nav .nav-item:hover {
        background-color: #0056b3;
    }

.navbar-nav .nav-item:hover {
    background-color: #0056b3; /* Enhance hover background for nav items */
}

.navbar-nav .dropdown-menu .dropdown-item:hover {
    background-color: #007bff; /* Change dropdown item hover background */
    color: #fff; /* White text on hover */
}

.navbar-nav .nav-item .dropdown-toggle:hover {
    color: #f8f9fa !important; /* Hover color for dropdown toggle */
}

.navbar-nav .nav-item .dropdown-menu {
    border-radius: 8px; /* Smooth edges for dropdown menu */
}

</style>
