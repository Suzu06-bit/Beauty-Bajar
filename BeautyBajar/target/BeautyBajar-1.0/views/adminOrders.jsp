<%@page import="com.mycompany.beautybajar.model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Manage Orders — Beauty Bajar Admin"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Dashboard"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/admin/dashboard"/>
                <jsp:param name="page_title" value="Manage Orders"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <main class="content">
                <% if (request.getAttribute("success") != null) { %>
                <div class="msg-success">&#9989; <%= request.getAttribute("success") %></div>
                <% } %>

                <div class="table-container">
                    <div class="table-header">
                        <h3>All Orders</h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>User</th>
                                <th>Total</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Order> orders = (List<Order>) request.getAttribute("orders");
                                if (orders != null && !orders.isEmpty()) {
                                    for (Order o : orders) {
                            %>
                            <tr>
                                <td>#<%= o.getOrderId() %></td>
                                <td><%= o.getUsername() != null ? o.getUsername() : "User #" + o.getUserId() %></td>
                                <td>Rs. <%= String.format("%.0f", o.getTotalPrice()) %></td>
                                <td><%= o.getOrderDate() %></td>
                                <td>
                                    <span class="badge <%= "delivered".equalsIgnoreCase(o.getStatus()) ? "badge-active" : "badge-pending" %>">
                                        <%= o.getStatus() %>
                                    </span>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/admin/orders" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="updateStatus"/>
                                        <input type="hidden" name="orderId" value="<%= o.getOrderId() %>"/>
                                        <select name="status" style="padding:4px 8px; border:1px solid var(--peach-soft); border-radius:6px; font-size:12px; background:var(--cream);">
                                            <option value="pending"   <%= "pending".equals(o.getStatus())   ? "selected" : "" %>>Pending</option>
                                            <option value="confirmed" <%= "confirmed".equals(o.getStatus()) ? "selected" : "" %>>Confirmed</option>
                                            <option value="shipped"   <%= "shipped".equals(o.getStatus())   ? "selected" : "" %>>Shipped</option>
                                            <option value="delivered" <%= "delivered".equals(o.getStatus()) ? "selected" : "" %>>Delivered</option>
                                        </select>
                                        <button type="submit" class="btn-edit" style="margin-left:4px;">Update</button>
                                    </form>
                                </td>
                            </tr>
                            <%      }
                                } else { %>
                            <tr>
                                <td colspan="6" style="text-align:center; padding:30px; color:var(--brown-mid);">
                                    No orders found.
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
