/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Account;
import Models.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author QUANG HUY
 */
public class EmployeeDAO extends DBContext {

    public List<Employee> getAllEmployees() {
        List<Employee> employees = new ArrayList<>();
        try {
            String sql = "select * from Employees";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Employee employee = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                employees.add(employee);
            }
        } catch (SQLException e) {
        }
        return employees;
    }
    
    public Account getEmployeeById(int eId) {
        try {
            String sql = "select * from Employees \n"
                    + "where EmployeeId = ?  \n";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, eId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
}
