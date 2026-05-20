<%@page import="com.mycompany.beautybajar.model.Product"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="My Cart — Beauty Bajar"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Shop"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/products"/>
                <jsp:param name="page_title" value="My Cart"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <main class="content">
                <% if (request.getAttribute("error") != null) {%>
                <div class="msg-error">&#9888; <%= request.getAttribute("error")%></div>
                <% } %>
                <% if (request.getAttribute("success") != null) {%>
                <div class="msg-success">&#9989; <%= request.getAttribute("success")%></div>
                <% } %>

                <%
                    Map<Product, Integer> cartItems = (Map<Product, Integer>) request.getAttribute("cartItems");
                    double total = 0;
                    if (cartItems != null && !cartItems.isEmpty()) {
                        for (Map.Entry<Product, Integer> entry : cartItems.entrySet()) {
                            Product p = entry.getKey();
                            int qty = entry.getValue();
                            double subtotal = p.getPrice() * qty;
                            total += subtotal;
                %>
                <div class="cart-item">
                    <div class="cart-item-icon">
                        <% if (p.getImage() != null && !p.getImage().isEmpty()) {%>
                        <img src="${pageContext.request.contextPath}/<%= p.getImage()%>" 
                             alt="<%= p.getName()%>"
                             style="width:56px; height:56px; object-fit:cover; border-radius:8px; font-size:0;"/>
                        <% } else { %>
                        <div style="width:56px; height:56px; background:var(--peach-pale); border-radius:8px;"></div>
                        <% }%>
                    </div>
                    <div style="flex:1;">
                        <div class="cart-item-name"><%= p.getName()%></div>
                        <div style="font-size:12px; color:var(--brown-mid);">Qty: <%= qty%></div>
                    </div>
                    <div class="cart-item-price">Rs. <%= String.format("%.0f", subtotal)%></div>
                    <form action="${pageContext.request.contextPath}/cart" method="post" style="margin-left:10px;">
                        <input type="hidden" name="action" value="remove"/>
                        <input type="hidden" name="productId" value="<%= p.getProductId()%>"/>
                        <button type="submit" class="btn-delete">Remove</button>
                    </form>
                </div>
                <%      }
                } else { %>
                <div style="text-align:center; padding:60px 0; color:var(--brown-mid);">
                    <div style="font-size:48px; margin-bottom:14px;">&#128717;</div>
                    <p style="font-size:16px;">Your cart is empty.</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn-primary" style="margin-top:18px; display:inline-block;">Browse Products</a>
                </div>
                <% } %>

                <% if (cartItems != null && !cartItems.isEmpty()) {%>
                <div class="cart-total">
                    Total: Rs. <%= String.format("%.0f", total)%>
                </div>
                <div style="margin-top:16px; display:flex; gap:12px;">
                    <form action="${pageContext.request.contextPath}/order" method="post">
                        <input type="hidden" name="action" value="place"/>
                        <button type="submit" class="btn-primary">Place Order &#8594;</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="action" value="clear"/>
                        <button type="submit" class="btn-delete">Clear Cart</button>
                    </form>
                </div>
                <% }%>
            </main>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>

