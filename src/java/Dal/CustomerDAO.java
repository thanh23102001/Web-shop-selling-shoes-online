/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Account;
import Models.Address;
import Models.Customer;
import Models.StatisticCB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class CustomerDAO extends DBContext {

    AddressDAO Adao = new AddressDAO();
    public Customer getProfile(int accountId) {
        try {
            String sql = "select * from Customers where CustomerId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4));
                customer.setAddresses(Adao.getListAddressByCustomerId(rs.getInt(1)));
                return customer;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public String getCustomerEmailByOrderId(int oId){
        try {
            String sql = "select a.Email from Accounts a, Orders o where a.AccountId = o.CustomerId and o.OrderId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, oId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
        }
        return "";
    }


    public List<Customer> getAllCustomerForAdmin() {
        List<Customer> list = new ArrayList<>();
        try {
            String sql = "select * from Customers";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(customer);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    //Statistic
    public int getNumOfCustomers() {
        try {
            String sql = " Select count(CustomerID) from Customers";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public List<StatisticCB> getTopCustomers() {
        List<StatisticCB> list = new ArrayList<>();
        try {
            String sql = "Select top 5 c.CustomerId, count(o.OrderId) as num from Orders o, Customers c\n"
                    + "where o.CustomerId = c.CustomerId group by c.CustomerId order by num desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer customer = (new CustomerDAO()).getProfile(rs.getInt(1));
                list.add(new StatisticCB(customer.getCustomerName(), rs.getInt(2)));
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}

class Test {
    public static void main(String[] args) {
       CustomerDAO cDao = new CustomerDAO();
       String s = cDao.getCustomerEmailByOrderId(17);
        System.out.println(s);
    }
}
