package com.mycompany.beautybajar.model;

import java.sql.Date;

public class Order {

    private int orderId;
    private int userId;
    private String username;   // joined from users table
    private double totalPrice;
    private String status;
    private Date orderDate;

    public Order() {
    }

    public Order(int orderId, int userId, double totalPrice, String status, Date orderDate) {
        this.orderId = orderId;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.status = status;
        this.orderDate = orderDate;
    }

    // Getters
    public int getOrderId() {
        return orderId;
    }

    public int getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    // Setters
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setTotalPrice(double price) {
        this.totalPrice = price;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
