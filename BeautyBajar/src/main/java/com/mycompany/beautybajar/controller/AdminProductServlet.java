package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.productDAO;
import com.mycompany.beautybajar.model.product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        productDAO pDao = new productDAO();

        try {
            switch (action) {
                // Show add product form
                case "new":
                    request.getRequestDispatcher("/views/addProduct.jsp")
                           .forward(request, response);
                    break;

                // Load product from    
                case "edit":
                    int editId = Integer.parseInt(request.getParameter("id"));
                    product p = pDao.getById(editId);
                    request.setAttribute("product", p);
                    request.getRequestDispatcher("/views/editProduct.jsp")
                           .forward(request, response);
                    break;
                    
                // Delete product 
                case "delete":
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    pDao.deleteProduct(deleteId);
                    response.sendRedirect(request.getContextPath() + "/admin/products");
                    break;

                default:
                    request.setAttribute("products", pDao.getAllProducts());
                    request.getRequestDispatcher("/views/adminProducts.jsp")
                           .forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        productDAO pDao = new productDAO();

        try {
            if ("add".equals(action)) {
                String name = request.getParameter("name");
                String priceStr = request.getParameter("price");
                String stockStr = request.getParameter("stockQuantity");

                // Validation
                if (name == null || name.trim().isEmpty()) {
                    request.setAttribute("error", "Product name cannot be empty.");
                    request.getRequestDispatcher("/views/addProduct.jsp").forward(request, response);
                    return;
                }
                if (Double.parseDouble(priceStr) <= 0) {
                    request.setAttribute("error", "Price must be greater than 0.");
                    request.getRequestDispatcher("/views/addProduct.jsp").forward(request, response);
                    return;
                }
                if (Integer.parseInt(stockStr) < 0) {
                    request.setAttribute("error", "Stock cannot be negative.");
                    request.getRequestDispatcher("/views/addProduct.jsp").forward(request, response);
                    return;
                }

                product p = new product();
                p.setName(name.trim());
                p.setDescription(request.getParameter("description"));
                p.setPrice(Double.parseDouble(priceStr));
                p.setStock(Integer.parseInt(stockStr));
                p.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                p.setImage(request.getParameter("imageUrl"));
                pDao.addProduct(p);

            } else if ("update".equals(action)) {
                product p = new product();
                p.setProductId(Integer.parseInt(request.getParameter("productId")));
                p.setName(request.getParameter("name"));
                p.setDescription(request.getParameter("description"));
                p.setPrice(Double.parseDouble(request.getParameter("price")));
                p.setStock(Integer.parseInt(request.getParameter("stockQuantity")));
                p.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                p.setImage(request.getParameter("imageUrl"));
                pDao.updateProduct(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
}