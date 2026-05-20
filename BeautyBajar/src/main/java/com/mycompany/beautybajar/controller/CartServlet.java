package com.mycompany.beautybajar.controller;
 
import com.mycompany.beautybajar.dao.ProductDAO;
import com.mycompany.beautybajar.model.Product;
import com.mycompany.beautybajar.util.SessionUtil;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
 
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
 
    private final ProductDAO productDAO = new ProductDAO();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!SessionUtil.isLoggedIn(req.getSession(false))) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        req.setAttribute("cartItems", getCart(req.getSession()));
        req.getRequestDispatcher("/views/cart.jsp").forward(req, res);
    }
 
    @Override
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!SessionUtil.isLoggedIn(req.getSession(false))) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }
 
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
 
        if ("add".equals(action)) {
            int productId;
            try {
                productId = Integer.parseInt(req.getParameter("productId"));
            } catch (NumberFormatException e) {
                res.sendRedirect(req.getContextPath() + "/products");
                return;
            }
            int qty = 1;
            try { qty = Integer.parseInt(req.getParameter("quantity")); } catch (Exception ignored) {}
            Product p = productDAO.getProductById(productId);
            if (p != null) {
                Map<Product, Integer> cart = getCart(session);
                Product existing = cart.keySet().stream()
                        .filter(pr -> pr.getProductId() == productId)
                        .findFirst().orElse(null);
                if (existing != null) {
                    cart.put(existing, cart.get(existing) + qty);
                } else {
                    cart.put(p, qty);
                }
                session.setAttribute("cart", cart);
                updateCartCount(session, cart);
            }
            res.sendRedirect(req.getContextPath() + "/cart");
 
        } else if ("remove".equals(action)) {
            int productId = Integer.parseInt(req.getParameter("productId"));
            Map<Product, Integer> cart = getCart(session);
            cart.entrySet().removeIf(e -> e.getKey().getProductId() == productId);
            session.setAttribute("cart", cart);
            updateCartCount(session, cart);
            res.sendRedirect(req.getContextPath() + "/cart");
 
        } else if ("clear".equals(action)) {
            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);
            res.sendRedirect(req.getContextPath() + "/cart");
 
        } else {
            res.sendRedirect(req.getContextPath() + "/cart");
        }
    }
 
    @SuppressWarnings("unchecked")
    private Map<Product, Integer> getCart(HttpSession session) {
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        if (cart == null) cart = new LinkedHashMap<>();
        return cart;
    }
 
    private void updateCartCount(HttpSession session, Map<Product, Integer> cart) {
        int total = cart.values().stream().mapToInt(Integer::intValue).sum();
        session.setAttribute("cartCount", total);
    }
}