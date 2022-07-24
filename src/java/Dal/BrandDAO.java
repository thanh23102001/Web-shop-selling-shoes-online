/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Brands;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class BrandDAO extends DBContext {

    public ArrayList<Brands> getListBrands() {
        ArrayList<Brands> brands = new ArrayList<>();
        try {
            String sql = "select * from Brands";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brands d = new Brands(rs.getInt("BrandId"), rs.getString("BrandName"),
                        rs.getString("BrandDescription"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"), rs.getString("Status"));
                d.setTotalProduct(getTotalProduct(rs.getInt("BrandId")));
                d.setDescription(rs.getString("Description"));
                brands.add(d);
            }
        } catch (Exception e) {
        }
        return brands;
    }

    public ArrayList<Brands> getBrands() {
        ArrayList<Brands> brands = new ArrayList<>();
        try {
            String sql = "select * from Brands ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brands d = new Brands(rs.getInt("BrandId"), rs.getString("BrandName"),
                        rs.getString("BrandDescription"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"), rs.getString("Status"));
                d.setTotalProduct(getTotalProduct(rs.getInt("BrandId")));
                d.setDescription(rs.getString("Description"));
                brands.add(d);
            }
        } catch (Exception e) {
        }
        return brands;
    }

    public Brands getBrandById(int bid) {
        try {
            String sql = "select * from Brands where Status = 'activate' and brandId = " + bid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brands d = new Brands(rs.getInt("BrandId"), rs.getString("BrandName"),
                        rs.getString("BrandDescription"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"), rs.getString("Status"));
                d.setTotalProduct(rs.getInt("BrandId"));
                d.setDescription(rs.getString("Description"));
                return d;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getTotalProduct(int brandId) {
        int totalProduct = 0;
        try {
            String sql = "select count(ProductId) from Products where BrandID =? and Status = 'activate' ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brandId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                totalProduct = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return totalProduct;
    }

    public void deleteBrand(int brandId) {
        try {
            String sql = "update Brands set Status = 'not activate' where BrandId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brandId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
        public void restoreBrand(int brandId) {
        try {
            String sql = "update Brands set Status = 'activate' where BrandId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brandId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProductInBrand(int brandId) {
        try {
            String sql = "update Products set Status = 'not activate' where BrandId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brandId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void RestoreProductInBrand(int brandId) {
        try {
            String sql = "update Products set Status = 'activate' where BrandId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brandId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateBrand(String name, String logo, String des, String brandId) {
        try {
            String sql = "update Brands set BrandName = ?, BrandDescription = ?,  Description = ? where brandId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, logo);
            stm.setString(3, des);
            stm.setString(4, brandId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateBrand(String name, String des, String brandId) {
        try {
            String sql = "update Brands set BrandName = ?, Description = ? where brandId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, des);
            stm.setString(3, brandId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProductInBrand(String status, String brandId) {
        try {
            String sql = "update Products set Status = ? where brandId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, brandId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertBrand(String name, String logo, String des) {
        try {
            String sql = "insert into Brands (BrandName, BrandDescription, CreatedAt, Status, Description) VALUES (?,?, GETDATE(),'activate',?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, logo);
            stm.setString(3, des);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        new BrandDAO().deleteBrand(1);
    }

    public ArrayList<Brands> getListBrandsBySearch(String name) {
        ArrayList<Brands> list = new ArrayList<>();
        try {
            String sql = " select * from Brands";
            if (!name.equals("")) {
                sql += " \n where BrandName = ?";
            }
            PreparedStatement stm = connection.prepareStatement(sql);
            if (!name.equals("")) {
                stm.setString(1, name);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Brands d = new Brands(rs.getInt("BrandId"), rs.getString("BrandName"),
                        rs.getString("BrandDescription"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"), rs.getString("Status"));
                d.setTotalProduct(getTotalProduct(rs.getInt("BrandId")));
                d.setDescription(rs.getString("Description"));
                list.add(d);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
