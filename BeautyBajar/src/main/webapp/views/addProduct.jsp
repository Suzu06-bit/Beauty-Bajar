<%-- 
    Admin Dashboard Page
    Author: Asmi Nepali
    Date: May 2026
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product - Beauty Bajar</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; }
        .navbar { background: #E8846A; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; margin-left: 20px; }
        .container { padding: 30px; max-width: 620px; }
        h1 { color: #333; margin-bottom: 20px; }
        .form-card { background: white; border-radius: 8px; padding: 30px; box-shadow: 0 2px 6px rgba(0,0,0,0.08); }
        label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px; color: #444; }
        input, textarea { width: 100%; padding: 9px 12px; border: 1px solid #ddd; border-radius: 6px; font-size: 14px; margin-bottom: 16px; }
        .btn-submit { background: #E8846A; color: white; border: none; padding: 10px 24px; border-radius: 6px; font-size: 15px; cursor: pointer; }
        .btn-cancel { background: #6c757d; color: white; border: none; padding: 10px 24px; border-radius: 6px; font-size: 15px; text-decoration: none; margin-left: 10px; }
        .error { color: red; font-size: 13px; margin-bottom: 10px; }
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
    <h1>Add New Product</h1>
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %><p class="error"><%= error %></p><% } %>
    <div class="form-card">
        <form action="<%= request.getContextPath() %>/adminproduct" method="post">
            <input type="hidden" name="action" value="add">
            <label>Product Name *</label>
            <input type="text" name="name" required placeholder="Enter product name">
            <label>Description</label>
            <textarea name="description" rows="3" placeholder="Enter description"></textarea>
            <label>Price (Rs.) *</label>
            <input type="number" name="price" step="0.01" min="0" required placeholder="0.00">
            <label>Stock Quantity *</label>
            <input type="number" name="stockQuantity" min="0" required placeholder="0">
            <label>Category ID *</label>
            <input type="number" name="categoryId" required placeholder="1">
            <label>Image URL</label>
            <input type="text" name="imageUrl" placeholder="e.g. images/product.jpg">
            <div>
                <button type="submit" class="btn-submit">Add Product</button>
                <a class="btn-cancel" href="<%= request.getContextPath() %>/adminproduct">Cancel</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
