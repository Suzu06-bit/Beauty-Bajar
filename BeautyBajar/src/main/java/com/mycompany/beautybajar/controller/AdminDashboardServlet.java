package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.OrderDAO;
import com.mycompany.beautybajar.dao.ProductDAO;
import com.mycompany.beautybajar.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

   @Override
protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

    // HttpSession session = req.getSession(false);
    // if (session == null || !"admin".equals(session.getAttribute("role"))) {
    //     res.sendRedirect(req.getContextPath() + "/login");
    //     return;
    // }

    try {
        ProductDAO productDAO = new ProductDAO();
        UserDAO userDAO = new UserDAO();
        OrderDAO orderDAO = new OrderDAO();
        req.setAttribute("totalProducts", productDAO.countProducts());
        req.setAttribute("totalUsers", userDAO.countUsers());
        req.setAttribute("totalOrders", orderDAO.countOrders());
        req.setAttribute("totalRevenue", orderDAO.getTotalRevenue());
        req.setAttribute("recentOrders", orderDAO.getAllOrders());
    } catch (Exception e) {
        e.printStackTrace();
    }

    req.getRequestDispatcher("/views/adminDashboard.jsp").forward(req, res);
}
}
