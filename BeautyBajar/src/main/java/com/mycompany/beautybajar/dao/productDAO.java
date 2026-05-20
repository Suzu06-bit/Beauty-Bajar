package com.mycompany.beautybajar.dao;

import com.mycompany.beautybajar.model.Product;
import com.mycompany.beautybajar.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * ProductDAO — Data Access Object for all database operations on the products table.
 * Supports filtering by category and search keyword, as well as full CRUD operations.
 * Used by both the public-facing shop pages and the admin product management panel.
 */
public class ProductDAO {
    /**
     * Retrieves all products from the database with optional search and category filtering.
     * If both a search term and a category ID are provided, both filters are applied.
     * Used on the products listing page and the admin product management panel.
     *
     * @param search     keyword to filter products by name using LIKE;
     *                   pass {@code null} or empty to skip name filtering
     * @param categoryId the category to filter by;
     *                   pass {@code null} to return products from all categories
     * @return a {@link List} of {@link Product} objects matching the criteria;
     *         returns an empty list if no products match
     */
    public List<Product> getProducts(String search, String catId) {
        List<Product> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT p.*, c.category_name FROM products p " +
            "LEFT JOIN categories c ON p.category_id = c.category_id WHERE 1=1"
        );
        List<Object> params = new ArrayList<>();

        if (search != null && !search.trim().isEmpty()) {
            sql.append(" AND p.name LIKE ?");
            params.add("%" + search + "%");
        }
        if (catId != null && !catId.trim().isEmpty()) {
            sql.append(" AND p.category_id = ?");
            params.add(Integer.parseInt(catId));
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

     /**
     * Retrieves a limited number of products for display on the home page.
     * Returns the first N products to populate the Featured Products section.
     *
     * @param limit the maximum number of products to return
     * @return a {@link List} of {@link Product} objects up to the specified limit
     */
    public List<Product> getFeaturedProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, c.category_name FROM products p " +
                     "LEFT JOIN categories c ON p.category_id = c.category_id " +
                     "LIMIT 4";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) list.add(mapRow(rs));

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Retrieves a single product record by its primary key.
     * Used on the product detail page and when adding a product to the cart.
     *
     * @param productId the primary key of the product to retrieve
     * @return the matching {@link Product} object, or {@code null} if not found
     */
    public Product getProductById(int id) {
        String sql = "SELECT p.*, c.category_name FROM products p " +
                     "LEFT JOIN categories c ON p.category_id = c.category_id " +
                     "WHERE p.product_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Inserts a new product record into the products table.
     * Used by the admin panel when adding a new product via the add product form.
     *
     * @param product the {@link Product} object containing name, description,
     *                price, categoryId, stock, and imageUrl
     * @return {@code true} if the record was inserted successfully;
     *         {@code false} if a database error occurred
     */
    public boolean insertProduct(Product p) {
        String sql = "INSERT INTO products (name, description, price, category_id, stock, image_url) VALUES (?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4,    p.getCategoryId());
            ps.setInt(5,    p.getStock());
            ps.setString(6, p.getImageUrl());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates an existing product record in the database.
     * Identifies the record to update using the product's ID field.
     * Used by the admin panel's edit product form.
     *
     * @param product the {@link Product} object containing the updated fields
     *                and the existing productId to identify the record
     * @return {@code true} if the record was updated successfully;
     *         {@code false} if no record was found or a database error occurred
     */
    public boolean updateProduct(Product p) {
        String sql = "UPDATE products SET name=?, description=?, price=?, category_id=?, stock=?, image_url=? WHERE product_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4,    p.getCategoryId());
            ps.setInt(5,    p.getStock());
            ps.setString(6, p.getImageUrl());
            ps.setInt(7,    p.getProductId());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Deletes a product record from the database by its product ID.
     * Due to the ON DELETE CASCADE foreign key on order_items,
     * any order items referencing this product are also deleted.
     *
     * @param productId the primary key of the product to delete
     * @return {@code true} if the record was deleted successfully;
     *         {@code false} if no record was found or a database error occurred
     */
    public boolean deleteProduct(int id) {
        String sql = "DELETE FROM products WHERE product_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Returns the total number of products in the database.
     * Used to display the product count stat card on the admin dashboard.
     *
     * @return the total count of products as an {@code int};
     *         returns {@code 0} if a database error occurs
     */
    public int countProducts() {
        String sql = "SELECT COUNT(*) FROM products";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) return rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

     /**
     * Maps a single row from a {@link ResultSet} to a {@link Product} object.
     * Called internally by all retrieval methods to avoid code duplication.
     *
     * @param rs the {@link ResultSet} positioned at the row to map
     * @return a populated {@link Product} object
     * @throws SQLException if any column cannot be read from the ResultSet
     */
    private Product mapRow(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setProductId(rs.getInt("product_id"));
        p.setName(rs.getString("name")); 
        p.setDescription(rs.getString("description"));
        p.setPrice(rs.getDouble("price"));
        p.setCategoryId(rs.getInt("category_id"));
        p.setStock(rs.getInt("stock"));
        p.setImage(rs.getString("image_url"));
        try { p.setCategoryName(rs.getString("category_name")); } catch (SQLException ignored) {}
        return p;
    }
}