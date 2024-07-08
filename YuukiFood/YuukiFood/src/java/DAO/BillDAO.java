/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.*;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BillDAO extends DBConnect {

    public ArrayList<Bills> getBillByUserId(int user_id, String fdate, String tdate) {
        ArrayList<Bills> list = new ArrayList<>();
        if (fdate.isEmpty() || fdate == null) {
            fdate = "1990-01-01";
        }
        if (tdate.isEmpty() || tdate == null) {
            tdate = "2990-01-01";
        }
        try {
            PreparedStatement st;
            if (user_id == 0) {
                String sql = """
             select od.detail_id, od.order_id, u.user_name, p.product_name, od.price, od.quantity, p.img, o.order_date, s.status, o.total  from [YuukiFood].[dbo].[Order] as o
             join [YuukiFood].[dbo].[OrderDetail] as od on o.order_id = od.order_id
             join [YuukiFood].[dbo].[Users] as u on o.user_id = u.user_id
             join [YuukiFood].[dbo].[Product] as p on od.product_id = p.product_id
             join [YuukiFood].[dbo].[Status] as s on od.status_id = s.status_id
             where o.order_date between ? and ?""";
                st = connection.prepareStatement(sql);
                st.setDate(1, java.sql.Date.valueOf(fdate));
                st.setDate(2, java.sql.Date.valueOf(tdate));
            } else {
                String sql = """
             select od.detail_id,od.order_id, u.user_name, p.product_name, od.price, od.quantity, p.img, o.order_date, s.status, o.total  from [YuukiFood].[dbo].[Order] as o
                          join [YuukiFood].[dbo].[OrderDetail] as od on o.order_id = od.order_id
                          join [YuukiFood].[dbo].[Users] as u on o.user_id = u.user_id
                          join [YuukiFood].[dbo].[Product] as p on od.product_id = p.product_id
                          join [YuukiFood].[dbo].[Status] as s on od.status_id = s.status_id
                          where u.user_id = ?  and o.order_date between ? and ?""";
                st = connection.prepareStatement(sql);
                st.setInt(1, user_id);
                st.setDate(2, java.sql.Date.valueOf(fdate));
                st.setDate(3, java.sql.Date.valueOf(tdate));
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bills b = new Bills();
                b.setDetail_id(rs.getInt("detail_id"));
                b.setUser_name(rs.getString("user_name"));
                b.setProduct_name(rs.getString("product_name"));
                b.setPrice(rs.getDouble("price"));
                b.setQuantity(rs.getInt("quantity"));
                b.setImg(rs.getString("img"));
                b.setOrder_date(rs.getDate("order_date"));
                b.setStatus(rs.getString("status"));
                b.setTotal(rs.getDouble("total"));
                b.setOrder_id(rs.getInt("order_id"));
                list.add(b);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void addStatistics(int order_id, String product_id, float price, int quantity) {
        String sql = "INSERT INTO [Statistics] (order_id, product_id, price, quantity) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, order_id);
            ps.setString(2, product_id);
            ps.setFloat(3, price);
            ps.setInt(4, quantity);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public void deleteOrder(int Order_id) {
//        try {
//            String sql = "DELETE FROM Order WHERE order_id = ?";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, Order_id);
//            ps.execute();
//            ps.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    public void deleteOrderDetail(int Order_id) {
        try {
            String sql = "DELETE FROM [OrderDetail] WHERE order_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Order_id);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public double getTotalProfit() {
        String sql = "  select sum(price*quantity) from [Statistics]";
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

    public ArrayList<Statistic> getAllStatics() {
        try {
            String sql = "SELECT \n"
                    + "    p.product_id, \n"
                    + "    p.product_name, \n"
                    + "    MAX(CAST(p.img AS nvarchar(max))) AS img,\n"
                    + "    MAX(s.price) AS price,\n"
                    + "    SUM(s.quantity) AS quantity,\n"
                    + "    p.stock\n"
                    + "FROM \n"
                    + "    Product p\n"
                    + "JOIN \n"
                    + "    [Statistics] s ON p.product_name = s.product_id\n"
                    + "GROUP BY \n"
                    + "    p.product_id, p.product_name, p.stock;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            ArrayList<Statistic> list = new ArrayList<>();
            while (rs.next()) {
                Statistic statistic = new Statistic();
                statistic.setProduct_id(rs.getInt("product_id"));
                statistic.setProduct_name(rs.getString("product_name"));
                statistic.setImg(rs.getString("img"));
                statistic.setPrice(rs.getInt("price"));
                statistic.setQuantity(rs.getInt("quantity"));
                statistic.setStock(rs.getInt("stock"));

                list.add(statistic);
            }
            rs.close();
            ps.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
