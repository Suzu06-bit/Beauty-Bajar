<%-- 
    Admin Dashboard Page
    Author: Asmi Nepali
    Date: May 2026
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.beautybajar.model.user" %>
<%
    if (session.getAttribute("role") == null || !session.getAttribute("role").equals("admin")) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    List<user> users = (List<user>) request.getAttribute("users");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Users - Beauty Bajar</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; }
        .navbar { background: #E8846A; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; margin-left: 20px; }
        .container { padding: 30px; }
        h1 { color: #333; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 2px 6px rgba(0,0,0,0.08); }
        th { background: #E8846A; color: white; padding: 12px 14px; text-align: left; }
        td { padding: 10px 14px; border-bottom: 1px solid #eee; font-size: 14px; }
        tr:hover td { background: #FDF0EB; }
        .btn { padding: 7px 14px; border-radius: 5px; text-decoration: none; font-size: 13px; border: none; cursor: pointer; display: inline-block; }
        .btn-del { background: #dc3545; color: white; }
        .badge { padding: 3px 10px; border-radius: 12px; font-size: 12px; }
        .badge-admin { background: #fde8f0; color: #E8846A; }
        .badge-user  { background: #e8f4fd; color: #1a7abf; }
        .msg { color: green; margin-bottom: 12px; }
    </style>
</head>
<body>
<div class="navbar">
    <strong>Beauty Bajar Admin</strong>
    <div>
        <a href="<%= request.getContextPath() %>/admindashboard">Dashboard</a>
        <a href="<%= request.getContextPath() %>/adminproduct">Products</a>
        <a href="<%= request.getContextPath() %>/adminorder">Orders</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</div>
<div class="container">
    <h1>Users</h1>
    <% String msg = (String) request.getAttribute("message");
       if (msg != null) { %><p class="msg"><%= msg %></p><% } %>
    <table>
        <tr><th>ID</th><th>Full Name</th><th>Email</th><th>Role</th><th>Actions</th></tr>
        <% if (users != null && !users.isEmpty()) {
               for (user u : users) { %>
        <tr>
            <td><%= u.getUserId() %></td>
            <td><%= u.getFullName() %></td>
            <td><%= u.getEmail() %></td>
            <td><span class="badge <%= u.getRole().equals("admin") ? "badge-admin" : "badge-user" %>"><%= u.getRole() %></span></td>
            <td>
                <% if (!u.getRole().equals("admin")) { %>
                <a class="btn btn-del" href="<%= request.getContextPath() %>/adminuser?action=delete&id=<%= u.getUserId() %>"
                   onclick="return confirm('Delete this user?')">Delete</a>
                <% } else { %>
                <span style="color:#999; font-size:13px;">protected</span>
                <% } %>
            </td>
        </tr>
        <% }} else { %>
        <tr><td colspan="5" style="text-align:center; color:#999; padding:20px;">No users found.</td></tr>
        <% } %>
    </table>
</div>
</body>
</html>