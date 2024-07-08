/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class User {
    private int userId;
    private String userName;
    private String email;
    private String password;
    private String address;
    private Boolean gender;
    private String phone;
    private Roles roles;

    public User() {
    }

    public User(int userId, String userName, String email, String password, String address, Boolean gender, String phone, Roles roles) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.gender = gender;
        this.phone = phone;
        this.roles = roles;
    }

    public User(int userId) {
        this.userId = userId;
    }

    public User(String userName, String email, String password, String address, String phone, Roles roles) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.roles = roles;
    }

    public User(String userName, String email, String password, String address, String phone) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
    }
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Roles getRoles() {
        return roles;
    }

    public void setRoles(Roles roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", email=" + email + ", password=" + password + ", address=" + address + ", gender=" + gender + ", phone=" + phone + ", roles=" + roles + '}';
    }
    
     
}
