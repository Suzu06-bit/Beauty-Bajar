<%@page import="com.mycompany.beautybajar.model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Manage Products — Beauty Bajar Admin"/>
    </jsp:include>

    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value="Dashboard"/>
                <jsp:param name="back_href" value="${pageContext.request.contextPath}/admin/dashboard"/>
                <jsp:param name="page_title" value="Manage Products"/>
                <jsp:param name="action_title" value="+ Add Product"/>
                <jsp:param name="action_href" value="${pageContext.request.contextPath}/admin/products?action=new"/>
            </jsp:include>

            <main class="content">
                <% if (request.getAttribute("success") != null) { %>
                <div class="msg-success">&#9989; <%= request.getAttribute("success") %></div>
                <% } %>
                <% if (request.getAttribute("error") != null) { %>
                <div class="msg-error">&#9888; <%= request.getAttribute("error") %></div>
                <% } %>

                <!-- Add / Edit Form -->
                <% if ("new".equals(request.getParameter("action")) || "edit".equals(request.getParameter("action"))) {
                    Product ep = (Product) request.getAttribute("editProduct"); %>
                <div class="form-card" style="max-width:600px; margin-bottom:24px;">
                    <h3 style="margin-bottom:18px; color:var(--brown-dark);">
                        <%= ep != null ? "Edit Product" : "Add New Product" %>
                    </h3>
                    <form action="${pageContext.request.contextPath}/admin/products" method="post">
                        <input type="hidden" name="action" value="<%= ep != null ? "update" : "add" %>"/>
                        <% if (ep != null) { %>
                        <input type="hidden" name="productId" value="<%= ep.getProductId() %>"/>
                        <% } %>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Product Name <span>*</span></label>
                                <input type="text" name="name" required
                                       value="<%= ep != null ? ep.getName() : "" %>"/>
                            </div>
                            <div class="form-group">
                                <label>Price (Rs.) <span>*</span></label>
                                <input type="number" name="price" step="0.01" required
                                       value="<%= ep != null ? ep.getPrice() : "" %>"/>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Category <span>*</span></label>
                                <select name="categoryId">
                                    <option value="1" <%= ep != null && ep.getCategoryId() == 1 ? "selected" : "" %>>Lipstick</option>
                                    <option value="2" <%= ep != null && ep.getCategoryId() == 2 ? "selected" : "" %>>Skincare</option>
                                    <option value="3" <%= ep != null && ep.getCategoryId() == 3 ? "selected" : "" %>>Foundation</option>
                                    <option value="4" <%= ep != null && ep.getCategoryId() == 4 ? "selected" : "" %>>Eyeshadow</option>
                                    <option value="5" <%= ep != null && ep.getCategoryId() == 5 ? "selected" : "" %>>Perfume</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Stock Quantity</label>
                                <input type="number" name="stock"
                                       value="<%= ep != null ? ep.getStock() : "0" %>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea name="description"><%= ep != null && ep.getDescription() != null ? ep.getDescription() : "" %></textarea>
                        </div>
                        <div class="form-group">
                            <label>Image URL</label>
                            <input type="text" name="imageUrl" placeholder="images/product.jpg"
                                   value="<%= ep != null && ep.getImageUrl() != null ? ep.getImageUrl() : "" %>"/>
                        </div>
                        <div class="action-btns">
                            <button type="submit" class="btn-submit" style="width:auto; padding:10px 28px;">Save Product</button>
                            <a href="${pageContext.request.contextPath}/admin/products" class="btn-delete" style="padding:10px 20px; display:inline-block; text-decoration:none;">Cancel</a>
                        </div>
                    </form>
                </div>
                <% } %>

                <!-- Products Table -->
                <div class="table-container">
                    <div class="table-header">
                        <h3>All Products</h3>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Stock</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Product> products = (List<Product>) request.getAttribute("products");
                                if (products != null && !products.isEmpty()) {
                                    for (Product p : products) {
                            %>
                            <tr>
                                <td><%= p.getProductId() %></td>
                                <td><%= p.getName() %></td>
                                <td><%= p.getCategoryName() != null ? p.getCategoryName() : "-" %></td>
                                <td>Rs. <%= String.format("%.0f", p.getPrice()) %></td>
                                <td><%= p.getStock() %></td>
                                <td>
                                    <div class="action-btns">
                                        <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=<%= p.getProductId() %>"
                                           class="btn-edit">Edit</a>
                                        <form action="${pageContext.request.contextPath}/admin/products" method="post" style="display:inline;"
                                              onsubmit="return confirm('Delete this product?')">
                                            <input type="hidden" name="action" value="delete"/>
                                            <input type="hidden" name="productId" value="<%= p.getProductId() %>"/>
                                            <button type="submit" class="btn-delete">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <%      }
                                } else { %>
                            <tr>
                                <td colspan="6" style="text-align:center; padding:30px; color:var(--brown-mid);">
                                    No products found.
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
