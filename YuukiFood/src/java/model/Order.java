/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Order {
    private int orderId;
    private User user;
    private Date orderDate;
    private double total;
    private String notes;
    private int status;
    private String statusName;

    public Order() {
    }

    public Order(int orderId, User user, Date orderDate, double total, String notes, int status) {
        this.orderId = orderId;
        this.user = user;
        this.orderDate = orderDate;
        this.total = total;
        this.notes = notes;
        this.status = status;
        this.statusName = StatusEnum.findByCode(status).name;
    }

    public Order(int orderId, User user, Date orderDate, double total, String notes) {
        this.orderId = orderId;
        this.user = user;
        this.orderDate = orderDate;
        this.total = total;
        this.notes = notes;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

  


}
