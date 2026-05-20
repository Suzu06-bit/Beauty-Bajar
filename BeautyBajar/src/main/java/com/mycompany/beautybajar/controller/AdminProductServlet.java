package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.ProductDAO;
import com.mycompany.beautybajar.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/products")
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list";

        ProductDAO pDao = new ProductDAO();

        try {
            switch (action) {
                case "new":
                    request.getRequestDispatcher("/views/adminProducts.jsp")
                           .forward(request, response);
                    break;

                case "edit":
                    int editId = Integer.parseInt(request.getParameter("id"));
                    Product p = pDao.getProductById(editId);
                    request.setAttribute("editProduct", p);
                    request.getRequestDispatcher("/views/adminProducts.jsp")
                           .forward(request, response);
                    break;

                case "delete":
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    pDao.deleteProduct(deleteId);
                    response.sendRedirect(request.getContextPath() + "/admin/products");
                    break;

                default:
                    request.setAttribute("products", pDao.getProducts(null, null));
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
        ProductDAO pDao = new ProductDAO();

        try {
            if ("add".equals(action)) {
                String name = request.getParameter("name");
                String priceStr = request.getParameter("price");
                String stockStr = request.getParameter("stock");

                if (name == null || name.trim().isEmpty()) {
                    request.setAttribute("error", "Product name cannot be empty.");
                    request.getRequestDispatcher("/views/adminProducts.jsp").forward(request, response);
                    return;
                }
                if (Double.parseDouble(priceStr) <= 0) {
                    request.setAttribute("error", "Price must be greater than 0.");
                    request.getRequestDispatcher("/views/adminProducts.jsp").forward(request, response);
                    return;
                }
                if (Integer.parseInt(stockStr) < 0) {
                    request.setAttribute("error", "Stock cannot be negative.");
                    request.getRequestDispatcher("/views/adminProducts.jsp").forward(request, response);
                    return;
                }

                Product p = new Product();
                p.setName(name.trim());
                p.setDescription(request.getParameter("description"));
                p.setPrice(Double.parseDouble(priceStr));
                p.setStock(Integer.parseInt(stockStr));
                p.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                p.setImage(request.getParameter("imageUrl"));
                pDao.insertProduct(p);

            } else if ("update".equals(action)) {
                Product p = new Product();
                p.setProductId(Integer.parseInt(request.getParameter("productId")));
                p.setName(request.getParameter("name"));
                p.setDescription(request.getParameter("description"));
                p.setPrice(Double.parseDouble(request.getParameter("price")));
                p.setStock(Integer.parseInt(request.getParameter("stock")));
                p.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
                p.setImage(request.getParameter("imageUrl"));
                pDao.updateProduct(p);

            } else if ("delete".equals(action)) {
                int deleteId = Integer.parseInt(request.getParameter("productId"));
                pDao.deleteProduct(deleteId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
}
