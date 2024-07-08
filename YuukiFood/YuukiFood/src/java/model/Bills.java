/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Bills {

    private int order_id;
    private int detail_id;
    private String user_name;
    private String product_name;
    private String img;
    private double price;
    private int quantity;
    private String status;
    private Date order_date;
    private double total;

    public Bills() {
    }

    public Bills(String user_name, String product_name, String img, double price, int quantity, String status, Date order_date, double total) {
        this.user_name = user_name;
        this.product_name = product_name;
        this.img = img;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.order_date = order_date;
        this.total = total;
    }

    public Bills(int detail_id, String user_name, String product_name, String img, double price, int quantity, String status, Date order_date, double total) {
        this.detail_id = detail_id;
        this.user_name = user_name;
        this.product_name = product_name;
        this.img = img;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.order_date = order_date;
        this.total = total;
    }

    public Bills(int order_id, int detail_id, String user_name, String product_name, String img, double price, int quantity, String status, Date order_date, double total) {
        this.order_id = order_id;
        this.detail_id = detail_id;
        this.user_name = user_name;
        this.product_name = product_name;
        this.img = img;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
        this.order_date = order_date;
        this.total = total;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Bills{" + ", detail_id=" + detail_id + ", user_name=" + user_name + ", product_name=" + product_name + ", img=" + img + ", price=" + price + ", quantity=" + quantity + ", status=" + status + ", order_date=" + order_date + ", total=" + total + '}';
    }

}
