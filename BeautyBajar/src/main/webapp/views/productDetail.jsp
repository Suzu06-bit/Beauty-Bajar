<%@page import="com.mycompany.beautybajar.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Product Detail — Beauty Bajar"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Shop"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/products"/>
                <jsp:param name="page_title" value="Product Detail"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <main class="content">
                <% if (request.getAttribute("success") != null) { %>
                <div class="msg-success">&#9989; <%= request.getAttribute("success") %></div>
                <% } %>

                <%
                    Product p = (Product) request.getAttribute("product");
                    if (p != null) {
                %>
                <div class="product-detail">
                    <div class="product-detail-img">
                        <% if (p.getImage() != null && !p.getImage().isEmpty()) { %>
                            <img src="${pageContext.request.contextPath}/<%= p.getImage() %>" alt="<%= p.getName() %>"/>
                        <% } else { %>
                            &#128144;
                        <% } %>
                    </div>
                    <div class="product-detail-info">
                        <div class="brand-tag">&#10022; Beauty Bajar — <%= p.getName() != null ? p.getName() : "Beauty" %></div>
                        <h1><%= p.getName() %></h1>
                        <div class="price">Rs. <%= String.format("%.0f", p.getPrice()) %></div>
                        <p class="desc"><%= p.getDescription() != null ? p.getDescription() : "Premium quality beauty product." %></p>

                        <% if (session != null && session.getAttribute("userId") != null) { %>
                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="add"/>
                            <input type="hidden" name="productId" value="<%= p.getProductId() %>"/>
                            <div class="form-group" style="max-width:120px; margin-bottom:16px;">
                                <label>Quantity</label>
                                <input type="number" name="quantity" value="1" min="1" max="10"/>
                            </div>
                            <button type="submit" class="btn-primary">&#128717; Add to Cart</button>
                        </form>
                        <% } else { %>
                        <p style="margin-bottom:14px; color:var(--brown-mid); font-size:14px;">Please login to add items to cart.</p>
                        <a href="${pageContext.request.contextPath}/login" class="btn-primary">Login to Buy</a>
                        <% } %>
                    </div>
                </div>
                <% } else { %>
                <div class="msg-error">&#9888; Product not found.</div>
                <% } %>
            </main>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
