package com.mycompany.beautybajar.dao;
 
import com.mycompany.beautybajar.model.Order;
import com.mycompany.beautybajar.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
 /**
 * OrderDAO — Data Access Object for all database operations on the orders table.
 * Handles order creation, retrieval, and status updates.
 * Used by the cart checkout flow and the admin order management panel.
 *
 */
public class OrderDAO {
    /**
     * Creates a new order record in the orders table.
     * Sets the initial status to "pending" and the order date to today's date.
     * Returns the auto-generated order ID so that order items can be linked immediately.
     *
     * @param userId     the ID of the user placing the order
     * @param totalPrice the total price of all items in the order
     * @return the auto-generated {@code order_id} if successful;
     *         {@code -1} if a database error occurred
     */
 
    public int insertOrder(int userId, double totalPrice) {
        String sql = "INSERT INTO orders (user_id, total_price, status, order_date) VALUES (?, ?, 'pending', CURDATE())";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
 
            ps.setInt(1, userId);
            ps.setDouble(2, totalPrice);
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    /**
     * Retrieves all orders placed by a specific user.
     * Used on the user's order history page to display their past purchases.
     *
     * @param userId the ID of the user whose orders to retrieve
     * @return a {@link List} of {@link Order} objects belonging to the user;
     *         returns an empty list if the user has no orders
     */
    public List<Order> getOrdersByUser(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
 
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
     /**
     * Retrieves all orders from all users in the database.
     * Used by the admin orders management panel to view and manage all orders.
     *
     * @return a {@link List} of all {@link Order} objects;
     *         returns an empty list if no orders exist
     */
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.*, u.username FROM orders o " +
                     "JOIN users u ON o.user_id = u.user_id ORDER BY o.order_date DESC";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
 
            while (rs.next()) {
                Order o = mapRow(rs);
                o.setUsername(rs.getString("username"));
                list.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
 /**
     * Updates the status of an existing order.
     * Valid status values are: "pending", "confirmed", "shipped", "delivered".
     * Used by the admin panel to manage the order fulfilment workflow.
     *
     * @param orderId the primary key of the order to update
     * @param status  the new status string to set
     * @return {@code true} if the status was updated successfully;
     *         {@code false} if no record was found or a database error occurred
     */
    public boolean updateStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
 
            ps.setString(1, status);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
 
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
  /**
     * Returns the total number of orders in the database.
     * Used to display the order count stat card on the admin dashboard.
     *
     * @return the total count of orders as an {@code int};
     *         returns {@code 0} if a database error occurs
     */
    public int countOrders() {
        String sql = "SELECT COUNT(*) FROM orders";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
 
            if (rs.next()) return rs.getInt(1);
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
 
    public double getTotalRevenue() {
        String sql = "SELECT COALESCE(SUM(total_price), 0) FROM orders";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
 
            if (rs.next()) return rs.getDouble(1);
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
 
    private Order mapRow(ResultSet rs) throws SQLException {
        Order o = new Order();
        o.setOrderId(rs.getInt("order_id"));
        o.setUserId(rs.getInt("user_id"));
        o.setTotalPrice(rs.getDouble("total_price"));
        o.setStatus(rs.getString("status"));
        o.setOrderDate(rs.getDate("order_date"));
        return o;
    }
}
 