<%@page import="com.mycompany.beautybajar.model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Shop — Beauty Bajar"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Home"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/home"/>
                <jsp:param name="page_title" value="All Products"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <main class="content">
                <!-- Search Bar -->
                <div class="search-bar">
                    <form action="${pageContext.request.contextPath}/products" method="get">
                        <label for="search">Search:</label>
                        <input type="text" id="search" name="q" placeholder="Search products, brands..."
                               value="${param.q}"/>
                        <select name="cat" style="padding:8px 12px; border:1px solid var(--peach-soft); border-radius:8px; background:var(--cream); color:var(--brown-dark); font-size:14px;">
                            <option value="">All Categories</option>
                            <option value="1" ${param.cat == '1' ? 'selected' : ''}>Lipstick</option>
                            <option value="2" ${param.cat == '2' ? 'selected' : ''}>Skincare</option>
                            <option value="3" ${param.cat == '3' ? 'selected' : ''}>Foundation</option>
                            <option value="4" ${param.cat == '4' ? 'selected' : ''}>Eyeshadow</option>
                            <option value="5" ${param.cat == '5' ? 'selected' : ''}>Perfume</option>
                        </select>
                        <button type="submit">Search</button>
                    </form>
                </div>

                <% if (request.getAttribute("error") != null) {%>
                <div class="msg-error">&#9888; <%= request.getAttribute("error")%></div>
                <% } %>
                <% if (request.getAttribute("success") != null) {%>
                <div class="msg-success">&#9989; <%= request.getAttribute("success")%></div>
                <% } %>

                <div class="products-grid">
                    <%
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        if (products != null && !products.isEmpty()) {
                            for (Product p : products) {
                    %>
                    <div class="product-card">
                        <div class="product-img">
                            <% if (p.getImage() != null && !p.getImage().isEmpty()) {%>
                            <img src="${pageContext.request.contextPath}/<%= p.getImage()%>" alt="<%= p.getName()%>"/>
                            <% } else { %>
                            &#128144;
                            <% }%>
                            <span class="product-badge"><%= p.getName() != null ? p.getName() : "Beauty"%></span>
                        </div>
                        <div class="product-info">
                            <div class="product-brand">Beauty Bajar</div>
                            <div class="product-name"><%= p.getName()%></div>
                            <div class="product-footer">
                                <span class="product-price">Rs. <%= String.format("%.0f", p.getPrice())%></span>
                                <a href="${pageContext.request.contextPath}/product?id=<%= p.getProductId()%>"
                                   class="btn-edit">View</a>
                            </div>
                        </div>
                    </div>
                    <%      }
                    } else { %>
                    <div style="grid-column:1/-1; text-align:center; padding:60px 0; color:var(--brown-mid);">
                        <div style="font-size:48px; margin-bottom:14px;">&#128269;</div>
                        <p style="font-size:16px;">No products found. Try a different search.</p>
                    </div>
                    <% }%>
                </div>
            </main>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>
