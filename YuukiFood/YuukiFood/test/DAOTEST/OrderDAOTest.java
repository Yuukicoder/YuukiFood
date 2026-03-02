/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAOTEST;

import DAO.OrderDAO;
import java.util.ArrayList;
import model.Order;
import model.OrderDetail;
import model.User;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class OrderDAOTest {
//    public OrderDAO OrderDAO;
    public OrderDAOTest() {
    }
     @Test
 public void testGetNumberOrder(){
     int ex = 10;
     OrderDAO o = new OrderDAO();
      int result = o.getNumberOrder();
        assertEquals(ex, result);
 }
 @Test
 public void testGetAllOrder2(){
     String exrs = null;
          OrderDAO o = new OrderDAO();
     ArrayList<Order> rs = o.getAllOrder("01", "2", "9");
     assertNull(exrs, rs);
 }
  @Test
 public void testGetAllOrder(){
     ArrayList<Order> exrs = null;
          OrderDAO o = new OrderDAO();
     ArrayList<Order> rs = o.getAllOrder("01", "2", "9");
     assertEquals(exrs, rs);
 }
 @Test
  public void testGetAllOrderExisted(){
      User u = new User(3);
//      Order or = new Order(1, u, "2023-06-15", 25000, null);
     ArrayList<Order> exrs = new ArrayList<Order>();
          OrderDAO o = new OrderDAO();
     ArrayList<Order> rs = o.getAllOrder("3", "2023-06-15", "2023-06-15");
     assertEquals(exrs, rs);
 }
 @Test
 public void testGetAllOrderDetailByoId(){
     ArrayList<OrderDetail> exrs = null;
               OrderDAO o = new OrderDAO();
               ArrayList<OrderDetail> rs= o.getAllOrderDetailByoId(1);
               assertEquals(exrs, rs);
 }
}
