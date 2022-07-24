/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vietd
 */
public class CategoryDAO extends DBContext {

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> categories = new ArrayList();
        try {
            String sql = "select * from Categories";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("CategoryId"), rs.getString("CategoryName"), rs.getString("CategoryDescription"),
                        rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                c.setSubcategories(new SubCategoryDAO().getSubCategoriesById(rs.getInt("CategoryId")));
                c.setTotalProduct(getTotalProduct(rs.getInt("CategoryId")));
                categories.add(c);
            }
        } catch (Exception e) {
        }
        return categories;
    }
    
    public Category getCategory(int categoryId){
        try {
            String sql = "select * from Categories where CategoryId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("CategoryId"), rs.getString("CategoryName"), rs.getString("CategoryDescription"),
                        rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
//                c.setSubcategories(new SubCategoryDAO().getSubCategoriesById(rs.getInt("CategoryId")));
                c.setTotalProduct(getTotalProduct(rs.getInt("CategoryId")));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getTotalProduct(int categoryId) {
        int totalProduct =0;
        try {
            String sql = "select count(p.ProductId) as total from Products p , Categories c , SubCategories s\n"
                    + "where p.SubCategoryID = s.SubCategoryId and s.CategoryId = c.CategoryId and s.CategoryId =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                totalProduct = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return totalProduct;
    }
    
        public void insertCategory(String name, String des) {
        try {
            String sql = " insert into Categories(CategoryName, CategoryDescription,CreatedAt) VALUES (?,?, GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, des);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    public static void main(String[] args) {
        System.out.println(new CategoryDAO().getAllCategories().size());
    }
}
