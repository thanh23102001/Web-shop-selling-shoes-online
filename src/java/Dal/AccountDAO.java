/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Account;
import Models.StatisticCB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext {

    public Account getAccountById(int accountId) {
        try {
            String sql = "select * from Accounts \n"
                    + "where AccountId = ?  \n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account getAccountByEmail(String email) {
        try {
            String sql = "select * from Accounts \n"
                    + "where Email = ? \n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public Account getAccount(String user, String pass) {
        try {
            String sql = "select * from Accounts \n"
                    + "where UserName = ? \n"
                    + "and PassWord = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
//                int accountId, String username, String password, String role, String email, String createdAt, String modifiedAt
                return new Account(rs.getInt("AccountId"), rs.getString("UserName"), rs.getString("PassWord"),
                        rs.getString("Role"), rs.getString("Email"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Account> getAllAccount() {
        List<Account> account = new ArrayList<>();
        try {
            String sql = "select UserName, Email from Accounts ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account ac = new Account();
                ac.setUsername(rs.getString("UserName"));
                ac.setEmail(rs.getString("Email"));
                account.add(ac);
            }
        } catch (Exception e) {
        }
        return account;
    }

    public int insertAccount(String name, String pass, String role, String email) {
        int accountId = 0;
        try {
            String sql = "insert into dbo.[Accounts](UserName, PassWord,Role, Email) \n"
                    + "output inserted.AccountID \n"
                    + "values (?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, pass);
            stm.setString(3, role);
            stm.setString(4, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                accountId = rs.getInt(1);
                System.out.println(accountId);
            }
        } catch (Exception e) {
        }
        return accountId;
    }

    public void insertCustomer(int id, String name, String phone) {
        try {
            String sql = "insert into Customers (CustomerId, CustomerName, PhoneNumber) \n "
                    + "values (?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, name);
            stm.setString(3, phone);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateEmail(String newEmail, int accountId) {
        try {
            String sql = "Update Accounts\n"
                    + "set Email = ? , ModifiedAt =  getDate() where AccountId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newEmail);
            stm.setInt(2, accountId);
            stm.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi");
        }
    }

    public void updatePassword(String email, String newPass) {
        try {
            String sql = "update Accounts\n"
                    + "set PassWord = ? , ModifiedAt = getDate() \n"
                    + "where Email = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, newPass);
            stm.setString(2, email);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateAccount(String email, String password, String username) {
        try {
            String sql = "update Accounts\n"
                    + "set UserName = ? , PassWord = ? \n"
                    + "where Email = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, email);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    //Get statistic
    public List<StatisticCB> getRoleStatistic() {
        List<StatisticCB> account = new ArrayList<>();
        try {
            String sql = "Select a.Role, count(a.Role) from Accounts a where a.Role = 'CUSTOMER' or a.Role = 'EMPLOYEE' group by a.Role";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                account.add(new StatisticCB(rs.getString(1), rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return account;
    }

    public List<StatisticCB> getNumberOfNewAccByMonth() {
        List<StatisticCB> account = new ArrayList<>();
        try {
            String sql = "Select MONTH(a.CreatedAt), count(a.AccountId) from Accounts a\n"
                    + "group by MONTH(a.CreatedAt)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                account.add(new StatisticCB(rs.getString(1), rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return account;
    }


}
