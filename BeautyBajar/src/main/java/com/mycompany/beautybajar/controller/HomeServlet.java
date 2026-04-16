/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.dao.productDAO;
import com.mycompany.beautybajar.model.product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    private productDAO productDAO;

    // ── GET: Show home page with featured products ──
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get featured products (latest 8 products from DB)
            List<product> featuredProducts = productDAO.getFeaturedProducts(8);
            request.setAttribute("featuredProducts", featuredProducts);

            // Get cart count from session for navbar
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("cartCount") == null) {
                session.setAttribute("cartCount", 0);
            }

            // Forward to index.jsp
            request.getRequestDispatcher("/views/index.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            // If error, still show home page with empty list
            System.out.println("HomeServlet error: " + e.getMessage());
            request.getRequestDispatcher("/views/index.jsp")
                    .forward(request, response);
        }
    }
}
