/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Images;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class ImageDAO extends DBContext {

    public ArrayList<Images> getImagesByProductId(int productId) {
        ArrayList<Images> images = new ArrayList<>();
        try {
            String sql = "select * from Images\n"
                    + "where ProductId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                images.add(new Images(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return images;
    }
    
    public ArrayList<String> getImagesUrl(int productId) {
        ArrayList<String> images = new ArrayList<>();
        try {
            String sql = "select Url from Images where ProductId= ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                images.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return images;
    }

    public void addImage
        (String pid, String url) {
        try {
            String sql = "INSERT INTO Images(ProductId,Url) values (?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pid);
            stm.setString(2, url);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
        public void deleteImagesByProductId
        (String pid) {
        try {
            String sql = "Delete From Images where ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, pid);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
