/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAOTEST;

import DAO.UserDAO;
import model.User;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class UserDAOTest {
    
    public UserDAOTest() {
    }
    @Test
    public void testGetUserById(){
        User exrs = null;
        UserDAO u = new UserDAO();
        User rs = u.getUserById(2);
        assertEquals(exrs, rs);
    }
    @Test
    public void testGetNumberUser(){
            int exrs = 5;
               UserDAO u = new UserDAO();
              int rs = u.getNumberUser();
              assertEquals(exrs, rs);
    }
    @Test
    public void testGetNumberUserTypeDouble(){
        double exrs = 4.1;
        int devi = 1;
        UserDAO u = new UserDAO();
        double rs = Double.valueOf(u.getNumberUser());

        assertEquals(exrs, rs, devi);
    }
    @Test
       public void testGetUserByExistId(){
        User exrs = new User(2);
        UserDAO u = new UserDAO();
        User rs = u.getUserById(2);
        assertEquals(exrs, rs);
    }
 
}
