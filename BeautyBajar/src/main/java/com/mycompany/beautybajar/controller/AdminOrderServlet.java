package com.mycompany.beautybajar.controller;

import com.mycompany.beautybajar.model.Order;
import com.mycompany.beautybajar.util.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT o.*, u.email AS username FROM orders o " +
                     "JOIN users u ON o.user_id = u.user_id ORDER BY o.order_date DESC";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalPrice(rs.getDouble("total_price"));
                o.setStatus(rs.getString("status"));
                o.setOrderDate(rs.getDate("order_date"));
                o.setUsername(rs.getString("username"));
                orders.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/views/adminOrders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("updateStatus".equals(action)) {
            try {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                String status = request.getParameter("status");
                String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
                try (Connection con = DBConnection.getConnection();
                     PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, status);
                    ps.setInt(2, orderId);
                    ps.executeUpdate();
                }
                request.setAttribute("success", "Order status updated.");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}