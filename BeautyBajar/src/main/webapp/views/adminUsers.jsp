<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mycompany.beautybajar.model.User" %>
<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Beauty Bajar</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: Arial, sans-serif; background:#f5f5f5; }
        .navbar { background:#F5C4B0; padding:15px 30px; display:flex; justify-content:space-between; flex-wrap:wrap; }
        .navbar a { color:white; text-decoration:none; margin-left:20px; }
        .wrapper { display:flex; flex-wrap:wrap; }
        .sidebar { width:250px; background:#2C1810; color:white; }
        .sidebar a { display:block; padding:12px 20px; color:#ccc; text-decoration:none; }
        .sidebar a:hover, .sidebar a.active { background:#3d2416; color:white; border-left:3px solid #F5C4B0; }
        .main { flex:1; padding:30px; overflow-x:auto; }
        table { width:100%; border-collapse:collapse; background:white; display:block; overflow-x:auto; }
        th { background:#F5C4B0; color:white; padding:12px; text-align:left; }
        td { padding:10px 12px; border-bottom:1px solid #eee; }
        .btn-del { background:#dc3545; color:white; padding:5px 10px; border-radius:4px; text-decoration:none; font-size:12px; }
        .badge { padding:3px 10px; border-radius:12px; font-size:12px; }
        .badge-admin { background:#fde8f0; color:#F5C4B0; }
        .badge-user { background:#e8f4fd; color:#1a7abf; }
        @media (max-width:768px) {
            .sidebar { width:100%; text-align:center; }
            .sidebar a { display:inline-block; margin:5px; }
            .main { padding:15px; }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <strong>Beauty Bajar Admin</strong>
        <div><a href="${pageContext.request.contextPath}/home">View Store</a> <a href="${pageContext.request.contextPath}/logout">Logout</a></div>
    </div>
    <div class="wrapper">
        <div class="sidebar">
            <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/products">Products</a>
            <a href="${pageContext.request.contextPath}/admin/users" class="active">Users</a>
            <a href="${pageContext.request.contextPath}/admin/orders">Orders</a>
        </div>
        <div class="main">
            <h2>Users</h2>
            <% if (request.getAttribute("message") != null) { %>
                <p style="color:green"><%= request.getAttribute("message") %></p>
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
                <p style="color:red"><%= request.getAttribute("error") %></p>
            <% } %>
            <table>
                <tr><th>ID</th><th>Full Name</th><th>Email</th><th>Role</th><th>Actions</th></tr>
                <% if (users != null && !users.isEmpty()) {
                    for (User u : users) { %>
                    <tr>
                        <td><%= u.getUserId() %></td>
                        <td><%= u.getFullName() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><span class="badge <%= u.getRole().equals("admin") ? "badge-admin" : "badge-user" %>"><%= u.getRole() %></span></td>
                        <td>
                            <% if (!"admin".equals(u.getRole())) { %>
                                <a class="btn-del" href="${pageContext.request.contextPath}/admin/users?action=delete&id=<%= u.getUserId() %>" onclick="return confirm('Delete this user?')">Delete</a>
                            <% } else { %>
                                <span style="color:#999;">protected</span>
                            <% } %>
                        </td>
                    </tr>
                <% } } else { %>
                    <tr><td colspan="5">No users found.</td></tr>
                <% } %>
            </table>
        </div>
    </div>
</body>
</html>