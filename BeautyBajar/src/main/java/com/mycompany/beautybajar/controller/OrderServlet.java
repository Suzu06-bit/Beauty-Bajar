package com.mycompany.beautybajar.controller;
 
import com.mycompany.beautybajar.dao.OrderDAO;
import com.mycompany.beautybajar.model.Product;
import com.mycompany.beautybajar.util.SessionUtil;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Map;
 
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
 
    private final OrderDAO orderDAO = new OrderDAO();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!SessionUtil.isLoggedIn(req.getSession(false))) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int userId = SessionUtil.getUserId(req.getSession(false));
        try {
            req.setAttribute("orders", orderDAO.getOrdersByUser(userId));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        req.getRequestDispatcher("/views/myOrders.jsp").forward(req, res);
    }
 
    @Override
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!SessionUtil.isLoggedIn(req.getSession(false))) {
            res.sendRedirect(req.getContextPath() + "/login");
            return;
        }
 
        HttpSession session = req.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
 
        if (cart == null || cart.isEmpty()) {
            res.sendRedirect(req.getContextPath() + "/cart");
            return;
        }
 
        double total = cart.entrySet().stream()
                .mapToDouble(e -> e.getKey().getPrice() * e.getValue()).sum();
 
        int userId = SessionUtil.getUserId(session);
        int orderId = -1;
        try {
            orderId = orderDAO.insertOrder(userId, total);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
 
        if (orderId > 0) {
            session.removeAttribute("cart");
            session.setAttribute("cartCount", 0);
            res.sendRedirect(req.getContextPath() + "/order?success=placed");
        } else {
            res.sendRedirect(req.getContextPath() + "/cart?error=failed");
        }
    }
}