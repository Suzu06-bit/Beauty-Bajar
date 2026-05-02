<%-- 
    Admin Dashboard Page
    Author: Asmi Nepali
    Date: May 2026
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String fullName = "Admin";
    Integer totalProducts = (Integer) request.getAttribute("totalProducts");
    Integer totalUsers    = (Integer) request.getAttribute("totalUsers");
    Integer totalOrders   = (Integer) request.getAttribute("totalOrders");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Beauty Bajar</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; display: flex; flex-direction: column; min-height: 100vh; }
        .navbar { background: #E8846A; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; margin-left: 20px; font-size: 14px; }
        .navbar a:hover { text-decoration: underline; }
        .wrapper { display: flex; flex: 1; }
        .sidebar { width: 220px; background: #2C1810; color: white; padding: 24px 0; min-height: calc(100vh - 54px); flex-shrink: 0; }
        .sidebar h3 { font-size: 13px; color: #aaa; padding: 0 20px; margin-bottom: 12px; text-transform: uppercase; letter-spacing: 1px; }
        .sidebar a { display: block; padding: 12px 20px; color: #ccc; text-decoration: none; font-size: 14px; border-left: 3px solid transparent; }
        .sidebar a:hover, .sidebar a.active { background: #3d2416; color: white; border-left-color: #E8846A; }
        .sidebar .icon { margin-right: 10px; }
        .main { flex: 1; padding: 30px; }
        .page-title { font-size: 24px; color: #333; margin-bottom: 6px; }
        .page-sub { color: #888; font-size: 14px; margin-bottom: 28px; }
        .cards { display: flex; gap: 20px; flex-wrap: wrap; margin-bottom: 36px; }
        .card { background: white; border-radius: 10px; padding: 24px 28px; flex: 1; min-width: 160px; box-shadow: 0 2px 8px rgba(0,0,0,0.07); border-top: 4px solid #E8846A; display: flex; flex-direction: column; gap: 8px; }
        .card-label { font-size: 13px; color: #888; text-transform: uppercase; letter-spacing: 0.5px; }
        .card-value { font-size: 36px; font-weight: 700; color: #E8846A; }
        .card-icon { font-size: 22px; }
        .section-title { font-size: 18px; color: #333; margin-bottom: 16px; font-weight: 600; }
        table { width: 100%; border-collapse: collapse; background: white; border-radius: 10px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.07); }
        th { background: #E8846A; color: white; padding: 12px 16px; text-align: left; font-size: 13px; }
        td { padding: 11px 16px; border-bottom: 1px solid #f0f0f0; font-size: 14px; color: #444; }
        tr:last-child td { border-bottom: none; }
        tr:hover td { background: #fef0f5; }
        .badge { padding: 3px 10px; border-radius: 12px; font-size: 12px; font-weight: 500; }
        .badge-pending   { background: #fff3cd; color: #856404; }
        .badge-completed { background: #d1e7dd; color: #0f5132; }
        .badge-confirmed { background: #cfe2ff; color: #084298; }
        .badge-delivered { background: #d1e7dd; color: #0f5132; }
        .quick-links { display: flex; gap: 12px; flex-wrap: wrap; margin-bottom: 32px; }
        .btn { padding: 10px 20px; background: #E8846A; color: white; border: none; border-radius: 6px; text-decoration: none; font-size: 14px; cursor: pointer; }
        .btn:hover { background: #b02a6e; }
        .btn-outline { padding: 10px 20px; background: white; color: #E8846A; border: 1.5px solid #E8846A; border-radius: 6px; text-decoration: none; font-size: 14px; }
        .btn-outline:hover { background: #FDFOEB; }
    </style>
</head>
<body>

<div class="navbar">
    <strong>Beauty Bajar Admin</strong>
    <div>
        Welcome, <strong><%= fullName %></strong>
        <a href="<%= request.getContextPath() %>/home">View Store</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</div>

<div class="wrapper">
    <div class="sidebar">
        <h3>Main Menu</h3>
        <a href="<%= request.getContextPath() %>/admin/dashboard" class="active">Dashboard
        </a>
        <a href="<%= request.getContextPath() %>/admin/products">Products
        </a>
        <a href="<%= request.getContextPath() %>/admin/users">Users
        </a>
        <a href="<%= request.getContextPath() %>/admin/orders">Orders
        </a>
    </div>

    <div class="main">
        <div class="page-title">Dashboard</div>
        <div class="page-sub">Welcome back, <%= fullName %>. Here's what's happening in your store.</div>

        <div class="cards">
            <div class="card">
                <div class="card-label">Total Products</div>
                <div class="card-value"><%= totalProducts != null ? totalProducts : 0 %></div>
            </div>
            <div class="card">
                <div class="card-label">Total Users</div>
                <div class="card-value"><%= totalUsers != null ? totalUsers : 0 %></div>
            </div>
            <div class="card">
                <div class="card-label">Total Orders</div>
                <div class="card-value"><%= totalOrders != null ? totalOrders : 0 %></div>
            </div>
            <div class="card">
                <div class="card-label">Revenue (Rs.)</div>
                <div class="card-value">0</div>
            </div>
        </div>

        <div class="section-title">Quick Actions</div>
        <div class="quick-links">
            <a class="btn" href="<%= request.getContextPath() %>/admin/products?action=new">+ Add Product</a>
            <a class="btn-outline" href="<%= request.getContextPath() %>/admin/products">Manage Products</a>
            <a class="btn-outline" href="<%= request.getContextPath() %>/admin/users">Manage Users</a>
            <a class="btn-outline" href="<%= request.getContextPath() %>/admin/orders">Manage Orders</a>
        </div>

        <div class="section-title">Recent Orders</div>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Customer</th>
                <th>Total (Rs.)</th>
                <th>Status</th>
                <th>Date</th>
            </tr>
            <tr>
                <td>#1001</td><td>Priya Sharma</td><td>1,250</td>
                <td><span class="badge badge-completed">Completed</span></td>
                <td>2026-05-01</td>
            </tr>
            <tr>
                <td>#1002</td><td>Anita Thapa</td><td>750</td>
                <td><span class="badge badge-pending">Pending</span></td>
                <td>2026-05-01</td>
            </tr>
            <tr>
                <td>#1003</td><td>Sunita Gurung</td><td>2,100</td>
                <td><span class="badge badge-confirmed">Confirmed</span></td>
                <td>2026-05-02</td>
            </tr>
            <tr>
                <td>#1004</td><td>Kabita Rai</td><td>500</td>
                <td><span class="badge badge-delivered">Delivered</span></td>
                <td>2026-05-02</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>