/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Status;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author QUANG HUY
 */
public class StatusDAO extends DBContext{
    public Status getStatus(int id) {
        try {
            String sql = "select * from Statuses where StatusID = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                //int statusId, String statusName, String statusDescription
                Status status = new Status(rs.getInt("StatusID"), rs.getString("StatusName"),
                        rs.getString("Description"));
                return status;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public ArrayList<Status> getAllStatus(){
        ArrayList<Status> statuses = new ArrayList();
        try {
            String sql = "select * from Statuses";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                statuses.add(new Status(rs.getInt("StatusID"), rs.getString("StatusName"),
                        rs.getString("Description")));
            }
        } catch (Exception e) {
        }
        return statuses;
    }
    
    
    public static void main(String[] args){
          StatusDAO dao = new StatusDAO();
          Status s  = dao.getStatus(1);
          System.out.println(dao.getAllStatus().size());
    }
}
