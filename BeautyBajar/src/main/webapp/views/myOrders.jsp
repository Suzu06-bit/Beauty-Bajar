<%@page import="com.mycompany.beautybajar.model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="My Orders — Beauty Bajar"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Home"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/home"/>
                <jsp:param name="page_title" value="My Orders"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <main class="content">
                <div class="table-container">
                    <div class="table-header">
                        <h3>&#128666; Order History</h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>Status</th>
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
                                <td><%= o.getOrderDate() %></td>
                                <td>Rs. <%= String.format("%.0f", o.getTotalPrice()) %></td>
                                <td>
                                    <span class="badge <%= "delivered".equalsIgnoreCase(o.getStatus()) ? "badge-active" : "badge-pending" %>">
                                        <%= o.getStatus() %>
                                    </span>
                                </td>
                            </tr>
                            <%      }
                                } else { %>
                            <tr>
                                <td colspan="4" style="text-align:center; padding:40px; color:var(--brown-mid);">
                                    No orders yet. <a href="${pageContext.request.contextPath}/products" style="color:var(--peach);">Start Shopping</a>
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
