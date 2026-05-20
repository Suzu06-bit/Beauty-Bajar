package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.ProductDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 * ProductServlet — Controller servlet that handles all product-related HTTP GET requests.
 * Mapped to two URL patterns:
 * <ul>
 *   <li>{@code /products} — displays the full product listing page with optional
 *       search and category filtering</li>
 *   <li>{@code /product} — displays the detail page for a single product by its ID</li>
 * </ul>
 * Uses {@link ProductDAO} to fetch product data from the database and sets
 * the results as request attributes before forwarding to the appropriate JSP view.
 *
 */
@WebServlet(urlPatterns = {"/products", "/product"})
public class ProductServlet extends HttpServlet {
/**
     * The Data Access Object used to perform all product-related database queries.
     * Initialised once when the servlet is loaded and reused for all requests.
     */
    private final ProductDAO productDAO = new ProductDAO();
/**
     * Handles all HTTP GET requests for both {@code /products} and {@code /product}.
     * Routes the request to the correct handler based on the servlet path:
     *
     * <p><b>If path is {@code /product}:</b><br>
     * Reads the {@code id} query parameter and fetches the matching product from the database.
     * Sets the product as a request attribute named {@code "product"} and forwards to
     * {@code /views/productDetail.jsp}.
     * If {@code id} is missing, redirects to {@code /products}.
     * If {@code id} is not a valid integer, sets an error attribute and still forwards
     * to the detail page so the JSP can display the error message.</p>
     *
     * <p><b>If path is {@code /products}:</b><br>
     * Reads optional query parameters {@code q} (search keyword) and {@code cat} (category ID).
     * Fetches matching products from the database and sets them as a request attribute
     * named {@code "products"}, then forwards to {@code /views/products.jsp}.</p>
     *
     * @param req the {@link HttpServletRequest} containing optional query parameters:
     *            <ul>
     *              <li>{@code id} — the product ID for the detail view (used with /product)</li>
     *              <li>{@code q} — search keyword to filter products by name (used with /products)</li>
     *              <li>{@code cat} — category ID to filter products by category (used with /products)</li>
     *            </ul>
     * @param res the {@link HttpServletResponse} used to forward to the JSP view
     *            or redirect to {@code /products} if the ID parameter is missing
     * @throws ServletException if the request dispatcher encounters an error during forwarding
     * @throws IOException      if an I/O error occurs during forwarding or redirection
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String path = req.getServletPath();

        if ("/product".equals(path)) {
            // Single product detail
            String idStr = req.getParameter("id");
            if (idStr == null) {
                res.sendRedirect(req.getContextPath() + "/products");
                return;
            }
            try {
                int id = Integer.parseInt(idStr);
                req.setAttribute("product", productDAO.getProductById(id));
            } catch (NumberFormatException e) {
                req.setAttribute("error", "Invalid product ID.");
            } catch (Exception ex) {
                System.getLogger(ProductServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
            }
            req.getRequestDispatcher("/views/productDetail.jsp").forward(req, res);

        } else {
            // Product listing
            String search = req.getParameter("q");
            String catId = req.getParameter("cat");
            try {
                req.setAttribute("products", productDAO.getProducts(search, catId));
            } catch (Exception ex) {
                System.getLogger(ProductServlet.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
            }
            req.getRequestDispatcher("/views/products.jsp").forward(req, res);
        }
    }
}
