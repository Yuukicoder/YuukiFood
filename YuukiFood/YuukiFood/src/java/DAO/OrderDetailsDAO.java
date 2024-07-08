/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author Admin
 */
public class OrderDetailsDAO extends DBConnect {

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
                odl.add(new OrderDetail(rs.getInt("detail_id"), rs.getInt("order_id"), p, rs.getDouble("price"), rs.getInt("quantity"), rs.getInt("status_id")));
            }
        } catch (Exception e) {
        }
        return odl;
    }
//                    ========================== updateStatusOrder ================================

    public void updateStatusOrder(int status, int id) {
        try {
            String sql = " update [OrderDetail] set status_id = " + status + " where [detail_id] =" + id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
