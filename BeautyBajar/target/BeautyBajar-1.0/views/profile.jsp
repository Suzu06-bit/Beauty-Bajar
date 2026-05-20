<%@page import="com.mycompany.beautybajar.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="My Profile — Beauty Bajar"/>
    </jsp:include>
    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>
            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Home"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/home"/>
                <jsp:param name="page_title" value="My Profile"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <main class="content">
                <%
                    User user = (User) request.getAttribute("user");
                    if (user != null) {
                %>
                <div class="profile-card">
                    <div class="profile-avatar">
                        <%= user.getFullName().substring(0, 1).toUpperCase() %>
                    </div>
                    <div class="profile-name"><%= user.getFullName() %></div>
                    <div class="profile-role"><%= user.getRole() %></div>

                    <div style="margin-top:20px; display:flex; flex-direction:column; gap:12px;">
                        <div style="display:flex; gap:10px; font-size:13px;">
                            <span style="font-weight:600; color:var(--brown-dark); min-width:100px;">Username:</span>
                            <span style="color:var(--brown-mid);"><%= user.getUsername() %></span>
                        </div>
                        <div style="display:flex; gap:10px; font-size:13px;">
                            <span style="font-weight:600; color:var(--brown-dark); min-width:100px;">Email:</span>
                            <span style="color:var(--brown-mid);"><%= user.getEmail() %></span>
                        </div>
                        <div style="display:flex; gap:10px; font-size:13px;">
                            <span style="font-weight:600; color:var(--brown-dark); min-width:100px;">Phone:</span>
                            <span style="color:var(--brown-mid);"><%= user.getPhone() != null ? user.getPhone() : "Not provided" %></span>
                        </div>
                        <div style="display:flex; gap:10px; font-size:13px;">
                            <span style="font-weight:600; color:var(--brown-dark); min-width:100px;">Address:</span>
                            <span style="color:var(--brown-mid);"><%= user.getAddress() != null ? user.getAddress() : "Not provided" %></span>
                        </div>
                    </div>

                    <div style="margin-top:24px; display:flex; gap:10px;">
                        <a href="${pageContext.request.contextPath}/products" class="btn-primary">Shop Now</a>
                        <a href="${pageContext.request.contextPath}/logout" class="btn-delete">Logout</a>
                    </div>
                </div>
                <% } %>
            </main>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>