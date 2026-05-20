<%@page contentType="text/html" pageEncoding="UTF-8"%>

<header class="header">
    <a href="${pageContext.request.contextPath}/home" class="header-logo">
        <span>Beauty <em>Bajar</em></span>
    </a>
    <div class="header-session">
        <% if (session != null && session.getAttribute("username") != null) { %>
            <h3>&#128100; <%= session.getAttribute("username") %></h3>
            <% if ("admin".equals(session.getAttribute("role"))) { %>
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn-edit">Admin Panel</a>
            <% } %>
            <a href="${pageContext.request.contextPath}/logout" class="btn-logout"
               onclick="return confirm('Do you want to logout?')">Logout</a>
        <% } else { %>
            <a href="${pageContext.request.contextPath}/login" class="btn-logout">Login</a>
            <a href="${pageContext.request.contextPath}/register" class="btn-submit" style="padding:6px 16px; border-radius:6px; font-size:13px; text-decoration:none; color:white;">Register</a>
        <% } %>
    </div>
</header>