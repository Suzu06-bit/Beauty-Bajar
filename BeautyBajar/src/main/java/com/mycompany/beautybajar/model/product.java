package com.mycompany.beautybajar.model;

public class Product {

    private int productId;
    private String name;
    private String description;
    private double price;
    private int categoryId;
    private String categoryName;
    private int stock;
    private String image;

    public Product() {
    }

    public Product(int productId, String name, String description, double price,
            int categoryId, int stock, String imageUrl) {
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.categoryId = categoryId;
        this.stock = stock;
        this.image = imageUrl;   // fixed: was this.image = image (null)
    }

    // ── Getters ──────────────────────────────────────────────
    public int getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public int getStock() {
        return stock;
    }

    /**
     * Called by JSPs as p.getImage()
     */
    public String getImage() {
        return image;
    }

    /**
     * Called by DAO as p.getImageUrl()
     */
    public String getImageUrl() {
        return image;
    }

    // ── Setters ──────────────────────────────────────────────
    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategoryName(String name) {
        this.categoryName = name;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
