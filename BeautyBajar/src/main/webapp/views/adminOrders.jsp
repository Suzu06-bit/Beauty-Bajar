<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mycompany.beautybajar.model.Order" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Orders - Beauty Bajar</title>
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
        .badge { padding:3px 10px; border-radius:12px; font-size:12px; }
        .badge-pending { background:#fff3cd; color:#856404; }
        .badge-completed { background:#d1e7dd; color:#0f5132; }
        .badge-confirmed { background:#cfe2ff; color:#084298; }
        .badge-delivered { background:#d1e7dd; color:#0f5132; }
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
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
            <a href="${pageContext.request.contextPath}/admin/orders" class="active">Orders</a>
        </div>
        <div class="main">
            <h2>Orders</h2>
            <table>
                <tr><th>Order ID</th><th>User ID</th><th>Total (Rs.)</th><th>Status</th><th>Date</th></tr>
                <% if (orders != null && !orders.isEmpty()) {
                    for (Order o : orders) { %>
                    <tr>
                        <td>#<%= o.getOrderId() %></td>
                        <td><%= o.getUserId() %></td>
                        <td><%= o.getTotalPrice() %></td>
                        <td><span class="badge badge-<%= o.getStatus().toLowerCase() %>"><%= o.getStatus() %></span></td>
                        <td><%= o.getOrderDate() %></td>
                    </tr>
                <% } } else { %>
                    <tr><td colspan="5">No orders found.</td></tr>
                <% } %>
            </table>
        </div>
    </div>
</body>
</html>