<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.beautybajar.model.product" %>
<%
    product p = (product) request.getAttribute("editProduct");
    if (p == null) {
        response.sendRedirect(request.getContextPath() + "/admin/products");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product - Beauty Bajar</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .navbar {
            background: #F5C4B0;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }
        .container {
            max-width: 600px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            font-size: 14px;
            color: #444;
        }
        input, textarea {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            margin-bottom: 15px;
        }
        .btn-submit {
            background: #F5C4B0;
            color: white;
            padding: 10px 24px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn-submit:hover {
            background: #e07a5f;
        }
        .btn-cancel {
            background: #6c757d;
            color: white;
            padding: 10px 24px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 15px;
            margin-left: 10px;
            display: inline-block;
            transition: background 0.3s;
        }
        .btn-cancel:hover {
            background: #5a6268;
        }
        .error {
            color: #dc3545;
            font-size: 13px;
            margin-bottom: 15px;
            background: #f8d7da;
            padding: 8px;
            border-radius: 4px;
        }
        @media (max-width: 768px) {
            .container {
                margin: 15px;
                padding: 20px;
            }
            .navbar {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }
            .navbar div {
                display: flex;
                gap: 15px;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <strong>Beauty Bajar Admin</strong>
        <div>
            <a href="${pageContext.request.contextPath}/home">View Store</a>
            <a href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </div>
    <div class="container">
        <h2>Edit Product</h2>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="${pageContext.request.contextPath}/admin/products" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="productId" value="<%= p.getProductId() %>">

            <label>Product Name *</label>
            <input type="text" name="name" value="<%= p.getName() %>" required>

            <label>Description</label>
            <textarea name="description" rows="3"><%= p.getDescription() != null ? p.getDescription() : "" %></textarea>

            <label>Price (Rs.) *</label>
            <input type="number" name="price" step="0.01" min="0" value="<%= p.getPrice() %>" required>

            <label>Stock Quantity *</label>
            <input type="number" name="stock" min="0" value="<%= p.getStock() %>" required>

            <label>Category ID</label>
            <input type="number" name="categoryId" value="<%= p.getCategoryId() %>">

            <label>Image URL</label>
            <input type="text" name="image" value="<%= p.getImage() != null ? p.getImage() : "" %>">

            <div style="margin-top: 10px;">
                <button type="submit" class="btn-submit">Save Changes</button>
                <a class="btn-cancel" href="${pageContext.request.contextPath}/admin/products">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>