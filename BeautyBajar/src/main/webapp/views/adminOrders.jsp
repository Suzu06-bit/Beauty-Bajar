<%-- 
    Admin Dashboard Page
    Author: Asmi Nepali
    Date: May 2026
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.beautybajar.model.order" %>
<%
    List<order> orders = (List<order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Orders - Beauty Bajar</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; display: flex; flex-direction: column; min-height: 100vh; }
        .navbar { background: #E8846A; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; margin-left: 20px; font-size: 14px; }
        .wrapper { display: flex; flex: 1; }
        .sidebar { width: 220px; background: #2C1810; color: white; padding: 24px 0; min-height: calc(100vh - 54px); flex-shrink: 0; }
        .sidebar h3 { font-size: 13px; color: #aaa; padding: 0 20px; margin-bottom: 12px; text-transform: uppercase; letter-spacing: 1px; }
        .sidebar a { display: block; padding: 12px 20px; color: #ccc; text-decoration: none; font-size: 14px; border-left: 3px solid transparent; }
        .sidebar a:hover, .sidebar a.active { background: #3d2416; color: white; border-left-color: #E8846A; }
        .sidebar .icon { margin-right: 10px; }
        .main { flex: 1; padding: 30px; }
        .page-title { font-size: 24px; color: #333; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 10px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.07); }
        th { background: #E8846A; color: white; padding: 12px 16px; text-align: left; font-size: 13px; }
        td { padding: 11px 16px; border-bottom: 1px solid #f0f0f0; font-size: 14px; color: #444; }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: #FDF0EB; }
        .badge { padding: 3px 10px; border-radius: 12px; font-size: 12px; font-weight: 500; }
        .badge-pending   { background: #fff3cd; color: #856404; }
        .badge-completed { background: #d1e7dd; color: #0f5132; }
        .badge-confirmed { background: #cfe2ff; color: #084298; }
        .badge-delivered { background: #d1e7dd; color: #0f5132; }
    </style>
</head>
<body>
<div class="navbar">
    <strong>Beauty Bajar Admin</strong>
    <div>
        <a href="<%= request.getContextPath() %>/home">View Store</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</div>
<div class="wrapper">
    <div class="sidebar">
        <h3>Main Menu</h3>
        <a href="<%= request.getContextPath() %>/admin/dashboard"><span class="icon"></span> Dashboard</a>
        <a href="<%= request.getContextPath() %>/admin/products"><span class="icon"></span> Products</a>
        <a href="<%= request.getContextPath() %>/admin/users"><span class="icon"></span> Users</a>
        <a href="<%= request.getContextPath() %>/admin/orders" class="active"><span class="icon"></span> Orders</a>
    </div>
    <div class="main">
        <div class="page-title">Orders</div>
        <table>
            <tr>
                <th>Order ID</th><th>User ID</th><th>Total (Rs.)</th><th>Status</th><th>Date</th>
            </tr>
            <% if (orders != null && !orders.isEmpty()) {
                   for (order o : orders) { %>
            <tr>
                <td>#<%= o.getOrderId() %></td>
                <td><%= o.getUserId() %></td>
                <td><%= o.getTotalPrice() %></td>
                <td><span class="badge badge-<%= o.getStatus().toLowerCase() %>"><%= o.getStatus() %></span></td>
                <td><%= o.getOrderDate() %></td>
            </tr>
            <% }} else { %>
            <tr><td colspan="5" style="text-align:center; color:#999; padding:20px;">No orders found.</td></tr>
            <% } %>
        </table>
    </div>
</div>
</body>
</html>