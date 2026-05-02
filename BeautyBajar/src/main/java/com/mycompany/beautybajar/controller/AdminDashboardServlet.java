package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.productDAO;
import com.mycompany.beautybajar.dao.userDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Admin Dashboard Servlet
 * Author: Asmi Nepali
 * Date: May 2026
 */

public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            productDAO pDao = new productDAO();
            userDAO uDao = new userDAO();
            request.setAttribute("totalProducts", pDao.countAllProducts());
            request.setAttribute("totalUsers", uDao.getAllUsers().size());
            request.setAttribute("totalOrders", 0);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("totalProducts", 0);
            request.setAttribute("totalUsers", 0);
            request.setAttribute("totalOrders", 0);
        }
        request.getRequestDispatcher("/views/adminDashboard.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}