/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Address;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class AddressDAO extends DBContext {

    public Address getAddressById(int id) {
        try {
            String sql = "select * from CustomerAddresses where CustomerAddressId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Address address = new Address(rs.getInt("CustomerAddressId"), rs.getString("Address"),
                        rs.getString("PhoneNumber"), rs.getString("CustomerName"));
                return address;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Address> getListAddressByCustomerId(int customerId) {
        ArrayList<Address> addresses = new ArrayList<>();
        try {
            String sql = "select * from CustomerAddresses where CustomerId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                addresses.add( new Address(rs.getInt("CustomerAddressId"), rs.getString("Address"),
                        rs.getString("PhoneNumber"), rs.getString("CustomerName")));

            }

        } catch (Exception e) {
        }
        return addresses;
    }

    public void updateInforCustomer(String newName, String newPhone, int accountId) {
        try {
            String sql = "update Customers\n"
                    + "set CustomerName = ?, PhoneNumber = ?\n"
                    + "where CustomerId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setNString(1, newName);
            stm.setString(2, newPhone);
            stm.setInt(3, accountId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi");
        }
    }

    public int addNewAddress(int accountId, String newAddress, String phone, String fullName) {
        try {
            String sql = "insert into CustomerAddresses(CustomerId, Address,PhoneNumber , CustomerName)\n"
                    + "output inserted.CustomerAddressId\n"
                    + "values (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            stm.setNString(2, newAddress);
            stm.setString(3, phone);
            stm.setNString(4, fullName);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void deleteAddress(int addressId) {
        try {
            String sql = "delete from CustomerAddresses\n"
                    + "where  CustomerAddressId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, addressId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateAddress(int addressId, String newAddress, String newName, String newPhone) {
        try {
            String sql = "update CustomerAddresses\n"
                    + "set Address = ? , PhoneNumber = ? , CustomerName = ?\n"
                    + "where CustomerAddressId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setNString(1, newAddress);
            stm.setNString(2, newPhone);
            stm.setNString(3, newName);
            stm.setInt(4, addressId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        new AddressDAO().addNewAddress(4, "Thạch Thất", "0355928414", "Kiều Nguyệt");
    }

}
