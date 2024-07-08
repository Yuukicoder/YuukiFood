/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class CartItem {
    int cartDetailId;
    int cartId;
    Product product;
    int quantity;

    public CartItem() {
    }

    public CartItem(int cartDetailId, int cartId, Product product, int quantity) {
        this.cartDetailId = cartDetailId;
        this.cartId = cartId;
        this.product = product;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CartItem{" + "cartDetailId=" + cartDetailId + ", cartId=" + cartId + ", product=" + product + ", quantity=" + quantity + '}';
    }

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
        
    }

    public int getCartDetailId() {
        return cartDetailId;
    }

    public void setCartDetailId(int cartDetailId) {
        this.cartDetailId = cartDetailId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
