/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.Roles;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBConnect {

    private MD5 md5 = new MD5();
//    =================== getAllUser ========================

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from [Users]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(8));
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), r));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
//        ==================== getUserById ====================

    public User getUserById(int id) {
        String sql = "select * from [Users] where [user_id]=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(8));
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), r);
                return u;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
//  ========================= getUserByEmail ==========================

    public User getUserByEmail(String email) {
        String sql = "select * from [Users] where [email]= ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Roles r = new Roles(rs.getInt(8));
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getBoolean(6), rs.getString(7), r);
                return u;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
//         ===================== insertUser ===========================

    public void insertUser(String name, String email, String phone, String address, String pass, int gender) {
        String sql = "  insert into [Users] ([user_name],[email],[password],[address],[gender] ,[phone],[role_id]) \n"
                + "  values (?,?,?,?,?,?,1)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, md5.getMd5(pass));
            ps.setString(4, address);
            ps.setInt(5, gender);
            ps.setString(6, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
//             ================ updateUser ==============================

    public void UpdateUser(String name, String email, String phone, String address, int gender, int userid) {
        String sql = " update [Users] set [user_name]=? ,[email] =? ,[address]=?, [gender]=? ,[phone]=? where [user_id] =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setInt(4, gender);
            ps.setString(5, phone);
            ps.setInt(6, userid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateAll(String name, String password, String email, String phone, String address, boolean gender, int role, int userid) {
        String sql = "UPDATE Users SET user_name=?, password=?, email=?, address=?, gender=?, phone=?, role_id=? WHERE user_id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password); // Assuming you missed setting the password in your original method
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setBoolean(5, gender);
            ps.setString(6, phone);
            ps.setInt(7, role);
            ps.setInt(8, userid);
            ps.executeUpdate();
            ps.close(); // Close PreparedStatement after use
        } catch (Exception e) {
            e.printStackTrace(); // Handle your exception appropriately, this is just an example
        }
    }
//               ==================== getNumberUser =========================

    public int getNumberUser() {
        String sql = "  select count(*)from  Users";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
//                =================== changePassword =========================

    public void changePassword(String uid, String pass) {
        String sql = " update [Users] set [password]=? where [user_id] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, md5.getMd5(pass));
            stm.setString(2, uid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
//                  ==================== deleteUser =======================

    public void deleteUser(String uid) {
        String sql = " delete [Users] where [user_id] =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, uid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
//                   ================================================

    //                =================== get all account with user role =========================
    public ArrayList<User> getAllUserRole() {
        try {
            String sql = "Select * from Users Where role_id = 1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<User> list = new ArrayList<>();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUserName(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setAddress(rs.getString("address"));
                user.setGender(rs.getBoolean("gender"));
                user.setPhone(rs.getString("phone"));
                user.setRoles(new Roles(1, "user"));
                list.add(user);
            }
            rs.close();
            ps.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    //                   ================================================

//    public static void main(String[] args) {
//        UserDAO uDAO = new UserDAO();
//        ArrayList<User> list = uDAO.getAllUserRole();
//        for (User u : list) {
//            System.out.println(u.getUserName()+ ", " + u.getPassword() + ", " + u.getRoles().getRoleName());
//        }
//    }
}
