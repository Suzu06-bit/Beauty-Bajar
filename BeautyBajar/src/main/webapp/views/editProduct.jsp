<%-- 
    Admin Dashboard Page
    Author: Asmi Nepali
    Date: May 2026
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.beautybajar.model.product" %>
<%
    if (session.getAttribute("role") == null || !session.getAttribute("role").equals("admin")) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
    product p = (product) request.getAttribute("product");
    if (p == null) {
        response.sendRedirect(request.getContextPath() + "/adminproduct");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product - Beauty Bajar</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; }
        .navbar { background: #d63384; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; margin-left: 20px; }
        .container { padding: 30px; max-width: 620px; }
        h1 { color: #333; margin-bottom: 20px; }
        .form-card { background: white; border-radius: 8px; padding: 30px; box-shadow: 0 2px 6px rgba(0,0,0,0.08); }
        label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px; color: #444; }
        input, textarea { width: 100%; padding: 9px 12px; border: 1px solid #ddd; border-radius: 6px; font-size: 14px; margin-bottom: 16px; }
        .btn-submit { background: #d63384; color: white; border: none; padding: 10px 24px; border-radius: 6px; font-size: 15px; cursor: pointer; }
        .btn-cancel { background: #6c757d; color: white; border: none; padding: 10px 24px; border-radius: 6px; font-size: 15px; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
<div class="navbar">
    <strong>Beauty Bajar Admin</strong>
    <div>
        <a href="<%= request.getContextPath() %>/admindashboard">Dashboard</a>
        <a href="<%= request.getContextPath() %>/adminproduct">Products</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</div>
<div class="container">
    <h1>Edit Product</h1>
    <div class="form-card">
        <form action="<%= request.getContextPath() %>/adminproduct" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="productId" value="<%= p.getProductId() %>">
            <label>Product Name *</label>
            <input type="text" name="name" value="<%= p.getName() %>" required>
            <label>Description</label>
            <textarea name="description" rows="3"><%= p.getDescription() != null ? p.getDescription() : "" %></textarea>
            <label>Price (Rs.) *</label>
            <input type="number" name="price" step="0.01" value="<%= p.getPrice() %>" required>
            <label>Stock Quantity *</label>
            <input type="number" name="stockQuantity" value="<%= p.getStockQuantity() %>" required>
            <label>Category ID</label>
            <input type="number" name="categoryId" value="<%= p.getCategoryId() %>">
            <label>Image URL</label>
            <input type="text" name="imageUrl" value="<%= p.getImageUrl() != null ? p.getImageUrl() : "" %>">
            <div>
                <button type="submit" class="btn-submit">Save Changes</button>
                <a class="btn-cancel" href="<%= request.getContextPath() %>/adminproduct">Cancel</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
