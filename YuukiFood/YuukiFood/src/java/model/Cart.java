/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {
    private int id;
    private int userId;
    private float totalPrice;
    private List<CartItem> items;

    public Cart() {
    }

    public Cart(int id, int userId, float totalPrice, List<CartItem> items) {
        this.id = id;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.items = items;
    }

    public Cart(List<CartItem> items) {
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }
//    ============================= getItemById =======================
    private CartItem getItemById(int id){
        for(CartItem item : items){
            if(item.getProduct().getProductId()==id){
                return item;
            }
        }
        return null;
    }
//    ============================= checkExist ========================
    private boolean checkExist(int id){
        for(CartItem item : items){
            if(item.getProduct().getProductId() == id){
                return true;
            }
        }
        return false;
    }
//    =========================== addItem ========================
    public void addItem(CartItem newItem){
        if(checkExist(newItem.getProduct().getProductId())){
            CartItem oldItem = getItemById(newItem.getProduct().getProductId());
            oldItem.setQuantity(oldItem.getQuantity() + newItem.getQuantity());
        }else{
            items.add(newItem);
        }
    }
//    ========================= removeItem ======================
    public void removeItem(int id){
        if(getItemById(id)!= null){
            items.remove((getItemById(id)));
        }
    }
//    ====================== getTotalMoney ======================
    public double getTotalMoney(){
        double t = 0;
        for(CartItem i : items){
            t += (i.getQuantity()*i.getProduct().getPrice());
        }
        return t;
    }
}
