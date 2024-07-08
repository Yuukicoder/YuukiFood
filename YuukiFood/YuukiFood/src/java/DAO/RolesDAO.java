/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Roles;

/**
 *
 * @author 84777
 */
public class RolesDAO extends DBConnect{
    public ArrayList<Roles> getAll() {
        try {
            String sql = "SELECT * FROM Roles";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Roles> list = new ArrayList<>();
            while(rs.next()) {
                Roles role = new Roles(rs.getInt("role_id"), rs.getString("role_name"));
                list.add(role);
            }
            rs.close();
            ps.close();
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
