<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product - Beauty Bajar</title>
        <style>
            * {
                margin:0;
                padding:0;
                box-sizing:border-box;
            }
            body {
                font-family: Arial, sans-serif;
                background:#f5f5f5;
            }
            .navbar {
                background:#F5C4B0;
                padding:15px 30px;
                display:flex;
                justify-content:space-between;
                flex-wrap:wrap;
            }
            .navbar a {
                color:white;
                text-decoration:none;
                margin-left:20px;
            }
            .container {
                max-width:600px;
                margin:30px auto;
                background:white;
                padding:30px;
                border-radius:8px;
            }
            label {
                display:block;
                margin:10px 0 5px;
                font-weight:bold;
            }
            input, textarea {
                width:100%;
                padding:8px;
                margin-bottom:15px;
                border:1px solid #ddd;
                border-radius:4px;
            }
            .btn-submit {
                background:#F5C4B0;
                color:white;
                padding:10px 20px;
                border:none;
                border-radius:4px;
                cursor:pointer;
            }
            .btn-cancel {
                background:#6c757d;
                color:white;
                padding:10px 20px;
                text-decoration:none;
                border-radius:4px;
                margin-left:10px;
            }
            .error {
                color:red;
                margin-bottom:10px;
            }
            @media (max-width:768px) {
                .container {
                    margin:15px;
                    padding:20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <strong>Beauty Bajar Admin</strong>
            <div><a href="${pageContext.request.contextPath}/home">View Store</a> <a href="${pageContext.request.contextPath}/logout">Logout</a></div>
        </div>
        <div class="container">
            <h2>Add New Product</h2>
            <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
            <% } %>
            <form action="${pageContext.request.contextPath}/admin/products" method="post">
                <input type="hidden" name="action" value="add">
                <label>Product Name *</label>
                <input type="text" name="name" required>
                <label>Description</label>
                <textarea name="description" rows="3"></textarea>
                <label>Price (Rs.) *</label>
                <input type="number" name="price" step="0.01" min="0" required>
                <label>Stock *</label>
                <input type="number" name="stock" min="0" required>
                <label>Category ID</label>
                <input type="number" name="categoryId">
                <label>Image URL</label>
                <input type="text" name="image">
                <div>
                    <button type="submit" class="btn-submit">Add Product</button>
                    <a class="btn-cancel" href="${pageContext.request.contextPath}/admin/products">Cancel</a>
                </div>
            </form>
        </div>
    </body>
</html>