/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.ShippingCompany;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author QUANG HUY
 */
public class ShippingCompanyDAO extends DBContext{
     public ShippingCompany getShippingCompany(int id) {
        try {
            String sql = "select * from ShippingCompanies where ShippingCompanyId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ShippingCompany sc = new ShippingCompany(rs.getInt("ShippingCompanyID"), rs.getString("CompanyName"),
                        rs.getString("Description"));
                return sc;
            }
        } catch (Exception e) {
        }
        return null;
    }
     
     public ArrayList<ShippingCompany> getAllShips(){
         ArrayList<ShippingCompany> ships = new ArrayList<>();
         try {
             String sql = "select * from ShippingCompanies ";
             PreparedStatement stm = connection.prepareStatement(sql);
             ResultSet rs = stm.executeQuery();
             while(rs.next()){
                 ships.add(new ShippingCompany(rs.getInt("ShippingCompanyID"), rs.getString("CompanyName"),
                        rs.getString("Description")));
             }
         } catch (Exception e) {
         }
         return ships;
     }
}
