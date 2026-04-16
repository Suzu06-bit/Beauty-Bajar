/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.beautybajar.dao;

import com.mycompany.beautybajar.model.user;
import com.mycompany.beautybajar.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class userDAO {

    // Create a new user (registration)
    public boolean createUser(user user) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO users (full_name, email, password, role) VALUES (?,?,?,?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, "user");
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("createUser error: " + e.getMessage());
            return false;
        }
    }

    // Get user by email (used for login)
    public user getUserByEmail(String email) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user u = new user();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setCreatedAt(rs.getTimestamp("created_at"));
                u.setUpdatedAt(rs.getTimestamp("updated_at"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println("getUserByEmail error: " + e.getMessage());
        }
        return null;
    }

    // Get all users (admin panel)
    public List<user> getAllUsers() throws SQLException, ClassNotFoundException {
        List<user> list = new ArrayList<>();
        String sql = "SELECT * FROM users ORDER BY created_at DESC";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                user u = new user();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println("getAllUsers error: " + e.getMessage());
        }
        return list;
    }
    // Delete user by ID (admin panel)

    public boolean deleteUser(int userId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("deleteUser error: " + e.getMessage());
            return false;
        }
    }
}
