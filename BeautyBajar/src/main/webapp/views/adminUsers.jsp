<%@page import="com.mycompany.beautybajar.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Manage Users — Beauty Bajar Admin"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Dashboard"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/admin/dashboard"/>
                <jsp:param name="page_title" value="Manage Users"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <main class="content">
                <% if (request.getAttribute("success") != null) { %>
                <div class="msg-success">&#9989; <%= request.getAttribute("success") %></div>
                <% } %>

                <!-- Search -->
                <div class="search-bar">
                    <form action="${pageContext.request.contextPath}/admin/users" method="get">
                        <label for="searchUser">Search:</label>
                        <input type="text" id="searchUser" name="q" placeholder="Search by username or email..."
                               value="${param.q}"/>
                        <button type="submit">Search</button>
                    </form>
                </div>

                <div class="table-container">
                    <div class="table-header">
                        <h3>All Users</h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<User> users = (List<User>) request.getAttribute("users");
                                if (users != null && !users.isEmpty()) {
                                    for (User u : users) {
                            %>
                            <tr>
                                <td><%= u.getUserId() %></td>
                                <td><%= u.getFullName() %></td>
                                <td><%= u.getUsername() %></td>
                                <td><%= u.getEmail() %></td>
                                <td><%= u.getPhone() != null ? u.getPhone() : "-" %></td>
                                <td>
                                    <span class="badge <%= "admin".equals(u.getRole()) ? "badge-admin" : "badge-active" %>">
                                        <%= u.getRole() %>
                                    </span>
                                </td>
                                <td>
                                    <div class="action-btns">
                                        <% if (!"admin".equals(u.getRole())) { %>
                                        <form action="${pageContext.request.contextPath}/admin/users" method="post" style="display:inline;"
                                              onsubmit="return confirm('Delete this user?')">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="userId" value="<%= u.getUserId() %>"/>
                                            <button type="submit" class="btn-delete">Delete</button>
                                        </form>
                                        <% } else { %>
                                        <span style="font-size:12px; color:var(--brown-mid);">Protected</span>
                                        <% } %>
                                    </div>
                                </td>
                            </tr>
                            <%      }
                                } else { %>
                            <tr>
                                <td colspan="7" style="text-align:center; padding:30px; color:var(--brown-mid);">
                                    No users found.
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </main>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
