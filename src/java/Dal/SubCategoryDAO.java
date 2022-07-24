/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.SubCategory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vietd
 */
public class SubCategoryDAO extends DBContext {

    public ArrayList<SubCategory> getSubCategoriesById(int categoryId) {
        ArrayList<SubCategory> subcategories = new ArrayList<>();
        try {
            String sql = "select * from SubCategories where CategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SubCategory s = new SubCategory(rs.getInt("SubCategoryId"),
                        rs.getString("SubCategoryName"), rs.getString("SubCategoryDescription"),
                        rs.getString(5), rs.getString(6), rs.getString(7));
                s.setTotalProduct(getTotalProduct(rs.getInt(1)));
//                s.setCategory(new CategoryDAO().getCategory(rs.getInt("CategoryId")));
                s.setDescription(rs.getString("Description"));
                subcategories.add(s);
            }
        } catch (Exception e) {
        }
        return subcategories;
    }

    public ArrayList<SubCategory> getSubCategoriesById(String categoryId) {
        ArrayList<SubCategory> subcategories = new ArrayList<>();
        try {
            String sql = "select * from SubCategories where CategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SubCategory s = new SubCategory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getString(6), rs.getString(7));
                s.setTotalProduct(getTotalProduct(rs.getInt(1)));
                s.setDescription(rs.getString("Description"));
                subcategories.add(s);
            }
        } catch (Exception e) {
        }
        return subcategories;
    }

    public SubCategory getSubCategoriesBySubCateId(int subcategoryId) {
        try {
            String sql = "select * from SubCategories where SubCategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subcategoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SubCategory s = new SubCategory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getString(6), rs.getString(7));
                s.setTotalProduct(getTotalProduct(rs.getInt(1)));
                s.setDescription(rs.getString("Description"));
                return s;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getTotalProduct(int subcategoryId) {
        int totalProduct = 0;
        try {
            String sql = "select count(p.ProductId) from Products p \n"
                    + "where p.SubCategoryID =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subcategoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalProduct = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return totalProduct;
    }

    public void deleteSubCateGory(String subcateId) {
        try {
            String sql = "update SubCategories set Status = 'not activate' where SubCategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subcateId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void restoreSubCateGory(String subcateId) {
        try {
            String sql = "update SubCategories set Status = 'activate' where SubCategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subcateId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProductInBrand(String subcateId) {
        try {
            String sql = "update Products set Status = 'not activate' where SubCategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, subcateId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateSubCate(String name, String logo, String des, String subId) {
        try {
            String sql = "update SubCategories set SubCategoryName = ?,SubCategoryDescription = ?, Description = ? where SubCategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, logo);
            stm.setString(3, des);
            stm.setString(4, subId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProductInSubCate(String status, String subId) {
        try {
            String sql = "update Products set Status = ? where SubCategoryId  = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, subId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertSubCategory(String name,String logo, String des, String cateId) {
        try {
            String sql = "insert into SubCategories (SubCategoryName, SubCategoryDescription, CategoryId, CreatedAt, Status,Description) VALUES (?,?,?, GETDATE(),'activate',?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, logo);
            stm.setString(3, cateId);
              stm.setString(4, des);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList<SubCategory> getListSubcatesBySearch(String name) {
        ArrayList<SubCategory> list = new ArrayList<>();
        try {
            String sql = " select * from SubCategories";
            if (!name.equals("")) {
                sql += " \n where SubCategoryName = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (!name.equals("")) {
                stm.setString(1, name);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SubCategory s = new SubCategory(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getString(6), rs.getString(7));
                s.setTotalProduct(getTotalProduct(rs.getInt(1)));
                s.setDescription(rs.getString("Description"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
