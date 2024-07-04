/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBConnect{
    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
//        System.out.println(o.getAllOrderDetailByoId(1));
//        User u = new User(8);
//    ArrayList<Order> ao = o.getAllOrderByuId(2, "2024-07-02", "2024-07-04");
//        for (Order order : ao) {
//            System.out.println(order.getOrderId());
//                        System.out.println(order.getOrderDate());
//            System.out.println(order.getUser().getUserId());
//            
//            System.out.println(order.getUser().getUserName());
//
//        }
          ArrayList<Order> ai = o.getAllOrder(1, "2024-07-02", "2024-07-04");
        for (Order order : ai) {
            System.out.println(order.getOrderId());
                        System.out.println(order.getOrderDate());
            System.out.println(order.getUser().getUserId());
                        System.out.println(order.getTotal());

            System.out.println(order.getUser().getUserName());
            System.out.println(order.getUser().getAddress());
                        System.out.println(order.getNotes());

        }
//          ArrayList<OrderDetail> ai = o.getAllOrderDetailByoId(1);
//        for (OrderDetail orderd : ai) {
//            System.out.println(orderd.getProduct().getProductName());
//        }
//        System.out.println(o.getAllOrderByuId(2, "2024-07-02", "2024-07-04"));
//                System.out.println(o.getAllOrder("8", "2024-07-02", "2024-07-04"));
            User u = new User(1);
            Cart cart = new Cart(200);
         
        o.insertOrder(u, cart, "hello2");
    }
//    ===================================== insertOrder ======================================
     public void insertOrder(User u, Cart cart, String notes) {
//        PreparedStatement ps = null;
//        ResultSet rs = null;
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql = "insert into [Order] ([user_id],[order_date],[total],[notes]) values (?,?, ?, ?)";
             PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, u.getUserId());
            ps.setString(2,date);
            ps.setDouble(3, cart.getTotalMoney());
            ps.setString(4, notes);
//            ps.setInt(5, 1);
            ps.executeUpdate();

            String sql1 = "select top 1 order_id from [Order] order by order_id desc";
            ps = connection.prepareStatement(sql1);
           ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int oid = rs.getInt(1);
                for (CartItem item : cart.getItems()) {
                    String sql2 = "insert into [OrderDetail] ([order_id],[product_id]  ,[price],[quantity]) values (?,?, ?, ?)";
                    ps = connection.prepareStatement(sql2);
                    ps.setInt(1, oid);
                    ps.setInt(2, item.getProduct().getProductId());
                    ps.setDouble(3, item.getProduct().getPrice());
                    ps.setInt(4, item.getQuantity());
                    ps.executeUpdate();
                }
            }
            String sql3 = "update [Product] set [stock] = [stock] - ? "
                    + "where product_id = ?";
            ps = connection.prepareStatement(sql3);
            for (CartItem item : cart.getItems()) {
                ps.setInt(1, item.getQuantity());
                ps.setInt(2, item.getProduct().getProductId());
                ps.executeUpdate();
            }

        } catch (Exception e) {
             e.printStackTrace();
        }
    }
//     ========================================== getAllOrderByUserId ==============================
       public ArrayList<Order> getAllOrderByuId(int uid, String fdate, String tdate) {
    ArrayList<Order> ol = new ArrayList<>();
    String sql = "SELECT o.order_id, o.user_id, o.order_date, u.user_name " +
                 "FROM [Order] o " +
                 "JOIN [Users] u ON o.user_id = u.user_id " +
                 "WHERE o.user_id = ? AND o.order_date BETWEEN ? AND ?";
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, uid);
        ps.setString(2, fdate);
        ps.setString(3, tdate);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            User user = new User(rs.getInt("user_id"), rs.getString("user_name"));
            Order order = new Order(rs.getInt("order_id"), user, rs.getDate("order_date"));
            ol.add(order);
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Xử lý ngoại lệ hoặc in ra thông báo lỗi nếu cần
    }
    return ol;
}

//         =================================== getAllOrder ================================
             public ArrayList<Order> getAllOrder(int uid, String fdate, String tdate) {
//        if (fdate.isEmpty()) {
//            fdate = "1990-01-01";
//        }
//          if (tdate.isEmpty()) {
//            tdate = "2990-01-01";
//        }
        ArrayList<Order> ol = new ArrayList<>();
        String sql = "SELECT * \n" +
"                 FROM [Order] o  \n" +
"                 JOIN [Users] u ON o.user_id = u.user_id \n" +
"                 WHERE o.user_id = ? AND o.order_date BETWEEN ? AND ?";
//        if (!uid.isEmpty()) {
//            sql = sql + " and user_id = ? ";
//        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
                    ps.setInt(1, uid);

            ps.setString(2, fdate);
            ps.setString(3, tdate);
//            if (!uid.isEmpty()) {
//                ps.setString(3, uid);
//            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                            User user = new User(rs.getInt("user_id"), rs.getString("user_name"),rs.getString("address"));
                Order o = new Order(uid, user, rs.getDate(3), rs.getDouble("total"), rs.getString("notes"));
                ol.add(o);
            }
        } catch (Exception e) {
        }
        return ol;
    }
//     ======================================== getAllOrderDetailByOrderId ===========================
               public ArrayList<OrderDetail> getAllOrderDetailByoId(int oid) {
        ArrayList<OrderDetail> odl = new ArrayList<>();
        String sql = " SELECT  p.*, o.* FROM [OrderDetail] o, Product p where o.product_id = p.product_id and o.order_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), new Category(rs.getInt("category_id")), rs.getString(6), rs.getString(7), rs.getDate(8));
                odl.add(new OrderDetail(rs.getInt("detail_id"), rs.getInt("order_id"), p, rs.getDouble("price"), rs.getInt("quantity")));
            }
        } catch (Exception e) {
        }
        return odl;
    }
//               ================================= getNumberOrder ===================================
                   public int getNumberOrder() {
        String sql = "  select count(*)from  OrderDetail";
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
//                   ============================= getTotalProfit ============================
                    public double getTotalProfit() {
        String sql = "  select sum(price*quantity) from OrderDetail";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
//                    ========================== updateStatusOrder ================================
                        public void updateStatusOrder(int status, int id) {
        try {
            String sql = " update [Order] set status = " + status + " where [order_id] =" + id;
            System.out.println(sql);
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
