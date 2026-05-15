<%@ page import="com.mycompany.beautybajar.dao.productDAO, com.mycompany.beautybajar.dao.userDAO, java.util.*" %>
<%
    productDAO pdao = new productDAO();
    userDAO udao = new userDAO();
    int totalProducts = pdao.countAllProducts();
    int totalUsers = udao.getAllUsers().size();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                margin:0;
                padding:0;
                box-sizing:border-box;
            }
            body {
                font-family: Arial;
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
            .wrapper {
                display:flex;
                flex-wrap:wrap;
            }
            .sidebar {
                width:250px;
                background:#2C1810;
                color:white;
                min-height:100vh;
            }
            .sidebar a {
                display:block;
                padding:12px 20px;
                color:#ccc;
                text-decoration:none;
            }
            .sidebar a:hover {
                background:#3d2416;
                color:white;
            }
            .main {
                flex:1;
                padding:30px;
                overflow-x:auto;
            }
            .cards {
                display:grid;
                grid-template-columns:repeat(auto-fit,minmax(180px,1fr));
                gap:20px;
                margin-bottom:30px;
            }
            .card {
                background:white;
                border-radius:10px;
                padding:20px;
                text-align:center;
                border-top:4px solid #F5C4B0;
            }
            .card-value {
                font-size:32px;
                font-weight:bold;
                color:#F5C4B0;
            }
            table {
                width:100%;
                border-collapse:collapse;
                background:white;
            }
            th {
                background:#F5C4B0;
                color:white;
                padding:12px;
                text-align:left;
            }
            td {
                padding:10px;
                border-bottom:1px solid #eee;
            }
            @media (max-width:768px) {
                .sidebar {
                    width:100%;
                    min-height:auto;
                    text-align:center;
                }
                .sidebar a {
                    display:inline-block;
                    margin:5px;
                }
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <strong>Beauty Bajar Admin</strong>
            <div><a href="${pageContext.request.contextPath}/">View Store</a> <a href="#">Logout</a></div>
        </div>
        <div class="wrapper">
            <div class="sidebar">
                <a href="${pageContext.request.contextPath}/admin_dashboard.jsp">Dashboard</a>
                <a href="${pageContext.request.contextPath}/admin_products.jsp">Products</a>
                <a href="${pageContext.request.contextPath}/admin_users.jsp">Users</a>
                <a href="${pageContext.request.contextPath}/admin_orders.jsp">Orders</a>
            </div>
            <div class="main">
                <h2>Dashboard</h2>
                <div class="cards">
                    <div class="card"><div class="card-value"><%= totalProducts%></div><div>Total Products</div></div>
                    <div class="card"><div class="card-value"><%= totalUsers%></div><div>Total Users</div></div>
                    <div class="card"><div class="card-value">0</div><div>Total Orders</div></div>
                    <div class="card"><div class="card-value">Rs.0</div><div>Revenue</div></div>
                </div>
                <h3>Recent Orders</h3>
                <table>
                    <tr><th>Order ID</th><th>Customer</th><th>Total</th><th>Status</th><th>Date</th></tr>
                    <tr><td colspan="5" style="text-align:center;">No orders yet</td></tr>
                </table>
            </div>
        </div>
    </body>
</html>