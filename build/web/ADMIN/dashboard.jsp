<%-- 
    Document   : home
    Created on : 11-Dec-2024, 13:54:00
    Author     : Janitha
--%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp"); // Redirect to login if not logged in
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <!-- SweetAlert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <%
            int userId = (int) session.getAttribute("id");
            String fullName = (String) session.getAttribute("full_name");
        %>
        <jsp:include page="../components/navbar.jsp"/>

        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>


</html>
