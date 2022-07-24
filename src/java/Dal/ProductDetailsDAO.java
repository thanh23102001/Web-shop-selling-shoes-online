/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.ProductDetails;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author vietd
 */
public class ProductDetailsDAO extends DBContext {

    public ArrayList<ProductDetails> getProductDetails(int productId) {
        ArrayList<ProductDetails> details = new ArrayList<>();
        try {
            String sql = "select p1.* from Products p , ProductDetails p1\n"
                    + "where p.ProductId = p1.ProductId and p.ProductId =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //int ProductDetailId, String size, String color, int quantityInStock
                ProductDetails detail = new ProductDetails(rs.getInt("ProductDetailId"), rs.getString("Size"),
                        rs.getString("Color"), rs.getInt("QuantityInStock"));
                detail.setProductId(rs.getInt("ProductId"));
                details.add(detail);
            }
        } catch (Exception e) {
        }
        return details;
    }

    public ArrayList<ProductDetails> checkQuantityOfSize(int productId, String color) {
        ArrayList<ProductDetails> details = new ArrayList<>();
        try {
            String sql = "select * from ProductDetails pd\n"
                    + "where pd.ProductId = ?\n"
                    //                    + "and pd.QuantityInStock > 0\n"
                    + "and pd.Color = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            stm.setString(2, color);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //int ProductDetailId, String size, String color, int quantityInStock
                ProductDetails detail = new ProductDetails(rs.getInt("ProductDetailId"), rs.getString("Size"),
                        rs.getString("Color"), rs.getInt("QuantityInStock"));
                detail.setProductId(rs.getInt("ProductId"));
                details.add(detail);
            }
        } catch (SQLException e) {
        }
        return details;
    }

    public ArrayList<Integer> getQuantityOfProduct(int productId, String color, String size) {
        ArrayList<Integer> list = new ArrayList<>();
        try {
            String sql = "select pd.ProductDetailId, pd.QuantityInStock from ProductDetails pd\n"
                    + "where pd.ProductId = ?\n"
                    + "and pd.Size = ?\n"
                    + "and pd.Color = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            stm.setString(2, size);
            stm.setString(3, color);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
                list.add(rs.getInt(2));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<String> getTypes(String type) {
        ArrayList<String> list = new ArrayList<>();
        try {
            String sql = "select distinct " + type + " from ProductDetails";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ProductDetails getProductDetail(int productDetailId) {
        try {
            String sql = "select p.* from ProductDetails p \n"
                    + "where p.ProductDetailId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productDetailId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //int ProductDetailId, String size, String color, int quantityInStock
                ProductDetails p = new ProductDetails(rs.getInt("ProductDetailId"), rs.getString("Size"),
                        rs.getString("Color"), rs.getInt("QuantityInStock"));
                p.setProductId(rs.getInt("ProductId"));
                return p;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateQuantity(int productDetailId, int quantity) {
        try {
            String sql = "update ProductDetails\n"
                    + "set QuantityInStock = ?"
                    + "where ProductDetailId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, productDetailId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deletePD(int productDetailId) {
        try {
            String sql = "Delete from ProductDetails \n"
                    + "where ProductDetailId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productDetailId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void addPD(int pid, String size, String color, int quantity) {
        try {
            String sql = "Insert into ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.setString(2, size);
            stm.setString(3, color);
            stm.setInt(4, quantity);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updatePD(int pdid, int pid, String size, String color, int quantity) {
        try {
            String sql = "Update ProductDetails set ProductId=? ,Size=?, Color=?, QuantityInStock =? where ProductDetailID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.setString(2, size);
            stm.setString(3, color);
            stm.setInt(4, quantity);
            stm.setInt(5, pdid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }


}
