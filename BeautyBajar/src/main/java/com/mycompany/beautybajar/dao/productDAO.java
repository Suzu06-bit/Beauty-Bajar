/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.beautybajar.dao;

import com.mycompany.beautybajar.model.product;
import com.mycompany.beautybajar.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Suzu♡
 */
public class productDAO {

// ── Get ALL products ─────────────────────────────
    public List<product> getAllProducts() throws SQLException, ClassNotFoundException {
        List<product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY product_id DESC";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            System.out.println("getAllProducts: " + e.getMessage());
        }
        return list;
    }

    // ── Get featured products for home page ──────────
    public List<product> getFeaturedProducts(int limit) throws SQLException, ClassNotFoundException {
        List<product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY product_id DESC LIMIT ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            System.out.println("getFeaturedProducts: " + e.getMessage());
        }
        return list;
    }

    // ── Get products by category ──────────────────────
    public List<product> getProductsByCategory(int categoryId) throws SQLException, ClassNotFoundException {
        List<product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE category_id = ? ORDER BY product_id DESC";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            System.out.println("getProductsByCategory: " + e.getMessage());
        }
        return list;
    }

    // ── Search products by name ───────────────────────
    public List<product> searchProducts(String keyword) throws SQLException, ClassNotFoundException {
        List<product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE name LIKE ? ORDER BY product_id DESC";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            System.out.println("searchProducts: " + e.getMessage());
        }
        return list;
    }

    // ── Get products with pagination ──────────────────
    public List<product> getProductsPaged(int offset, int limit) throws SQLException, ClassNotFoundException {
        List<product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY product_id DESC LIMIT ? OFFSET ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            System.out.println("getProductsPaged: " + e.getMessage());
        }
        return list;
    }

    // ── Count total products (for pagination) ────────
    public int countAllProducts() throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM products";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("countAllProducts: " + e.getMessage());
        }
        return 0;
    }

    // ── Get one product by ID ───
    public product getById(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapRow(rs);
            }
        } catch (SQLException e) {
            System.out.println("getById: " + e.getMessage());
        }
        return null;
    }

    // ── Add new product ───────────────────────────────
    public boolean addProduct(product p) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO products (name,price,stock,image,description,category_id) VALUES (?,?,?,?,?,?)";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setInt(3, p.getStock());
            ps.setString(4, p.getImage());
            ps.setString(5, p.getDescription());
            ps.setInt(6, p.getCategoryId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("addProduct: " + e.getMessage());
            return false;
        }
    }

    // ── Update existing product ───────────────────────
    public boolean updateProduct(product p) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE products SET name=?,price=?,stock=?,image=?,description=?,category_id=? WHERE product_id=?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setDouble(2, p.getPrice());
            ps.setInt(3, p.getStock());
            ps.setString(4, p.getImage());
            ps.setString(5, p.getDescription());
            ps.setInt(6, p.getCategoryId());
            ps.setInt(7, p.getProductId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("updateProduct: " + e.getMessage());
            return false;
        }
    }

    // ── Delete product by ID ──────────────────────────
    public boolean deleteProduct(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM products WHERE product_id = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("deleteProduct: " + e.getMessage());
            return false;
        }
    }

    // ── Private helper: map ResultSet → Product ───────
    private product mapRow(ResultSet rs) throws SQLException {
        product p = new product();
        p.setProductId(rs.getInt("product_id"));
        p.setName(rs.getString("name"));
        p.setPrice(rs.getDouble("price"));
        p.setStock(rs.getInt("stock"));
        p.setImage(rs.getString("image"));
        p.setDescription(rs.getString("description"));
        p.setCategoryId(rs.getInt("category_id"));
        return p;
    }
}
