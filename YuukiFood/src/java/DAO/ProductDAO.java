/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import model.*;
/**
 *
 * @author Admin
 */
public class ProductDAO extends DBConnect{
      public ArrayList<Product> getProduct(String cid, String search, int index, String sort) {
        String sortby = "";
        switch (sort) {
            case "1":
                sortby = "order by p.create_date desc";
                break;
            case "2":
                sortby = "order by p.price asc";
                break;
            case "3":
                sortby = "order by p.price desc";
                break;
            default:
                sortby = "order by p.product_name desc";
                break;

        }
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select * from [Product] p, Category c where p.category_id = c.category_id \n"
                + "  and p.category_id like ?  and p.product_name like ?  "
                + sortby
                + "  OFFSET ? ROWS FETCH NEXT 6  ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + cid + "%");
            ps.setString(2, "%" + search + "%");
            ps.setInt(3, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(6), rs.getString(7), rs.getDate(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Product> getTopSelling() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 6 p.*,c.* from Product p, (select sum(quantity) as numberSell, product_id from OrderDetail group by product_id) as b, Category c\n"
                + " where b.product_id = p.product_id and p.category_id = c.category_id order by b.numberSell desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(6), rs.getString(7), rs.getDate(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    
    public ArrayList<Product> getAllProduct(String cid, String search) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select * from Product p, Category c where p.category_id = c.category_id \n"
                + "  and p.category_id like ?  and p.product_name like ?"
                + " order by p.product_id asc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + cid + "%");
            ps.setString(2, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(6), rs.getString(7), rs.getDate(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getNumberProduct(String cid, String search) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "  select count(*) from Product p, Category c where p.category_id = c.category_id \n"
                + "  and p.category_id like ?  and p.product_name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + cid + "%");
            ps.setString(2, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public Product getProductById(int pid) {
        String sql = " select * from Product p, Category c where p.category_id = c.category_id \n"
                + "  and p.product_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), new Category(rs.getInt("category_id"), rs.getString("category_name")), rs.getString(6), rs.getString(7), rs.getDate(8));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "  select* from Category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("category_id"), rs.getString("category_name")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void DeleteProduct(int pid) {
        String sql = "  DELETE FROM [Product] WHERE product_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateProduct(int id, String name, double price, int cateId, int stock, String createDate, String descri, String img) {
        String sql = "  UPDATE [Product]  set [product_name]= ?   ,[price] = ?  ,[stock]= ?,  \n"
                + "  [category_id] = ?   ,[img] = ? ,[description] = ?,[create_date]= ? \n"
                + "  where product_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, stock);
            ps.setInt(4, cateId);
            ps.setString(5, img);
            ps.setString(6, descri);
            ps.setString(7, createDate);
            ps.setInt(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void AddProduct(String name, double price, int cateId, int stock, String descri, String img) {
        String sql = "insert into [Product] ([product_name],[price],[stock],[category_id],[img],[description],[create_date]) values (?,?,?,?,?,?, getdate())";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, stock);
            ps.setInt(4, cateId);
            ps.setString(5, img);
            ps.setString(6, descri);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<Category> getAllCategorys() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void AddCategory(String name) {
        String sql = "  insert into [Category] ([category_name])  values (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void EditCategory(String name, String id) {
        String sql = " update [Category] set [category_name] = ? where [category_id] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
     public static void main(String[] args) {
        LocalTime currentTime = LocalTime.now();

        // Print the current time
        System.out.println("abc" + currentTime);
        ProductDAO pdao = new ProductDAO();
       ArrayList<Product> l = pdao.getAllProduct("1", "Magnam Tiste");
       for(Product c : l){
           System.out.println(c.getImg());
       }
    }
}
