<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.mycompany.beautybajar.model.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products - Beauty Bajar</title>
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
        .top-bar { display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; margin-bottom:20px; }
        .btn { padding:8px 16px; border-radius:5px; text-decoration:none; display:inline-block; }
        .btn-add { background:#F5C4B0; color:white; }
        .btn-edit { background:#ffc107; color:#333; }
        .btn-del { background:#dc3545; color:white; }
        table { width:100%; border-collapse:collapse; background:white; display:block; overflow-x:auto; }
        th { background:#F5C4B0; color:white; padding:12px; text-align:left; }
        td { padding:10px 12px; border-bottom:1px solid #eee; }
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
            <a href="${pageContext.request.contextPath}/admin/products" class="active">Products</a>
            <a href="${pageContext.request.contextPath}/admin/users">Users</a>
            <a href="${pageContext.request.contextPath}/admin/orders">Orders</a>
        </div>
        <div class="main">
            <div class="top-bar"><h2>Products</h2><a class="btn btn-add" href="${pageContext.request.contextPath}/admin/products?action=new">+ Add Product</a></div>
            <table>
                <tr><th>ID</th><th>Name</th><th>Price (Rs.)</th><th>Stock</th><th>Category</th><th>Actions</th></tr>
                <% if (products != null && !products.isEmpty()) {
                    for (Product p : products) { %>
                    <tr>
                        <td><%= p.getProductId() %></td>
                        <td><%= p.getName() %></td>
                        <td><%= p.getPrice() %></td>
                        <td><%= p.getStock() %></td>
                        <td><%= p.getCategoryId() %></td>
                        <td>
                            <a class="btn btn-edit" href="${pageContext.request.contextPath}/admin/products?action=edit&id=<%= p.getProductId() %>">Edit</a>
                            <a class="btn btn-del" href="${pageContext.request.contextPath}/admin/products?action=delete&id=<%= p.getProductId() %>" onclick="return confirm('Delete?')">Delete</a>
                        </td>
                    </tr>
                <% } } else { %>
                    <tr><td colspan="6">No products found.</td></tr>
                <% } %>
            </table>
        </div>
    </div>
</body>
</html>