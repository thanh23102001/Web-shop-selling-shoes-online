/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Address;
import Models.Customer;
import Models.Order;
import Models.OrderDTO;
import Models.ShippingCompany;
import Models.StatisticCB;
import Models.StatisticOrders;
import Models.StatisticRevenues;
import Models.Status;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {
    
    ResultSet rs;
    
    public ArrayList<Order> getAllOrders() {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "select * from Orders order by getDate()-OrderDate";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            CustomerDAO cusDao = new CustomerDAO();
            StatusDAO stDao = new StatusDAO();
            ShippingCompanyDAO scDao = new ShippingCompanyDAO();
            while (rs.next()) {
                Customer cus = cusDao.getProfile(rs.getInt("CustomerId"));
                Status status = stDao.getStatus(rs.getInt("StatusID"));
                ShippingCompany sc = scDao.getShippingCompany(rs.getInt("ShippingCompanyId"));
                Order order = new Order(rs.getInt("OrderId"), rs.getDate("OrderDate"), rs.getDate("ShipDate"), status, rs.getDouble("TotalPrice"), cus, rs.getString("Address"), sc, rs.getString("CustomerName"), rs.getString("PhoneNumber"));
                order.setOrderDetail(new OrderDetailsDAO().getOrderDetails(rs.getInt("OrderId")));
                list.add(order);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Order getOrderById(int oId) {
        try {
            String sql = "select * from Orders where OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, oId);
            ResultSet rs = stm.executeQuery();
            CustomerDAO cusDao = new CustomerDAO();
            StatusDAO stDao = new StatusDAO();
            AddressDAO aDAO = new AddressDAO();
            ShippingCompanyDAO scDao = new ShippingCompanyDAO();
            while (rs.next()) {
                Customer cus = cusDao.getProfile(rs.getInt("CustomerId"));
                Status status = stDao.getStatus(rs.getInt("StatusID"));
                ShippingCompany sc = scDao.getShippingCompany(rs.getInt("ShippingCompanyId"));
                Order order = new Order(rs.getInt("OrderId"), rs.getDate("OrderDate"), rs.getDate("ShipDate"), status, rs.getDouble("TotalPrice"), cus, rs.getString("Address"), sc, rs.getString("CustomerName"), rs.getString("PhoneNumber"));
                order.setOrderDetail(new OrderDetailsDAO().getOrderDetails(rs.getInt("OrderId")));
                return order;
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Order> getOrdersByStatus(int id) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "select * from Orders o where StatusID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            CustomerDAO cusDao = new CustomerDAO();
            StatusDAO stDao = new StatusDAO();
            ShippingCompanyDAO scDao = new ShippingCompanyDAO();
            while (rs.next()) {
                Customer cus = cusDao.getProfile(rs.getInt("CustomerId"));
                Status status = stDao.getStatus(rs.getInt("StatusID"));
                ShippingCompany sc = scDao.getShippingCompany(rs.getInt("ShippingCompanyId"));
                Order order = new Order(rs.getInt("OrderId"), rs.getDate("OrderDate"), rs.getDate("ShipDate"), status, rs.getDouble("TotalPrice"), cus, rs.getString("Address"), sc, rs.getString("CustomerName"), rs.getString("PhoneNumber"));
                list.add(order);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Order> getListOrders(int customerID) {
        ArrayList<Order> list = new ArrayList<>();
        try {
            String sql = "select * from Orders where CustomerId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, customerID);
            ResultSet rs = stm.executeQuery();
            CustomerDAO cusDao = new CustomerDAO();
            StatusDAO stDao = new StatusDAO();
            ShippingCompanyDAO scDao = new ShippingCompanyDAO();
            while (rs.next()) {
                Customer cus = cusDao.getProfile(rs.getInt("CustomerId"));
                Status status = stDao.getStatus(rs.getInt("StatusID"));
                ShippingCompany sc = scDao.getShippingCompany(rs.getInt("ShippingCompanyId"));
                Order order = new Order(rs.getInt("OrderId"), rs.getDate("OrderDate"), rs.getDate("ShipDate"), status, rs.getDouble("TotalPrice"), cus, rs.getString("Address"), sc, rs.getString("CustomerName"), rs.getString("PhoneNumber"));
                order.setOrderDetail(new OrderDetailsDAO().getOrderDetails(rs.getInt("OrderId")));
                list.add(order);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void changeStatus(int orderId, int statusId) {
        try {
            String sql = "Update [Orders] set StatusID = ? where OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, statusId);
            stm.setInt(2, orderId);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrder(int orderID) {
        try {
            String sql = " UPDATE Orders \n"
                    + "   SET StatusID = 4 \n"
                    + "	  where OrderId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void changeStatusOrder(int orderID) {
        try {
            String sql = " UPDATE Orders \n"
                    + "   SET StatusID = 3 \n"
                    + "	  where OrderId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderID);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editOrder(String address, String phone, String name, String orderid) {
        try {
            String sql = " Update Orders \n"
                    + "	Set Address = ?, CustomerName = ?, PhoneNumber = ? \n"
                    + "	 where OrderId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, address);
            stm.setString(2, name);
            stm.setString(3, phone);
            stm.setString(4, orderid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int addOrder(int cID, int scid, String address, double total, int sttid, String name, String phone) {
        try {
            String sql = "INSERT INTO Orders(CustomerId, ShippingCompanyId, OrderDate, ShipDate, TotalPrice, StatusID , Address , CustomerName , PhoneNumber) "
                    + "VALUES (?, ?,  GETDATE(), GETDATE()+2, ?, ? , ? , ? , ? )";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, cID);
            stm.setInt(2, scid);
            stm.setDouble(3, total);
            stm.setInt(4, sttid);
            stm.setString(5, address);
            stm.setString(6, name);
            stm.setString(7, phone);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                int orderId = Integer.parseInt(rs.getString(1));
                return orderId;
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    // Get statistics
    public String getRevenueVND() {
        try {
            String sql = "Select sum(TotalPrice) from Orders where StatusID = 3";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            Locale localeVN = new Locale("vi", "VN");
            NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
            while (rs.next()) {
                return currencyVN.format(rs.getDouble(1));
            }
        } catch (SQLException e) {
        }
        return "";
    }

    public double getRevenue() {
        try {
            String sql = "Select sum(TotalPrice) from Orders where StatusID = 3";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public double getCapital() {
        try {
            String sql = "Select sum(p.ImportPrice*od.Quantity) from Orders o, OrderDetails od, ProductDetails pd, Products p \n" +
"where o.StatusID = 3 and o.OrderId = od.OrderID \n" +
"and od.ProductDetailID = pd.ProductDetailID and pd.ProductId = p.ProductId ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<StatisticOrders> getOrdersByMonth(int s) {
        List<StatisticOrders> list = new ArrayList<>();
        try {
            String sql = "Select MONTH(o.OrderDate), ISNULL(COUNT(o2.OrderID), 0)\n"
                    + "from Orders o left join Orders o2 on (o.OrderId = o2.OrderId) and o.StatusID = ?\n"
                    + "group by MONTH(o.OrderDate)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int month = rs.getInt(1);
                int count = rs.getInt(2);
                list.add(new StatisticOrders(month, count));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<StatisticOrders> getAllOrdersByMonth() {
        List<StatisticOrders> list = new ArrayList<>();
        try {
            String sql = "Select MONTH(OrderDate), count(OrderID) from Orders "
                    + "group by MONTH(OrderDate)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int month = rs.getInt(1);
                int count = rs.getInt(2);
                list.add(new StatisticOrders(month, count));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getNumberOfOrders() {
        try {
            String sql = "Select count(OrderID) from Orders ";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public int getNumberOfOrders(int s) {
        try {
            String sql = "Select count(OrderID) from Orders where StatusID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public ArrayList<StatisticCB> getNumberOfCate() {
        ArrayList<StatisticCB> cs = new ArrayList();
        try {
            String sql = "Select c.CategoryName, count(od.ProductDetailID) from OrderDetails od, ProductDetails pd, Products p, SubCategories sc, Categories c\n"
                    + "where od.ProductDetailID = pd.ProductDetailID and pd.ProductId = p.ProductId \n"
                    + "and p.SubCategoryId = sc.SubCategoryId and sc.CategoryId = c.CategoryId\n"
                    + "group by c.CategoryName";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                int count = rs.getInt(2);
                cs.add(new StatisticCB(name, count));
            }
        } catch (Exception e) {
        }
        return cs;
    }

    public ArrayList<StatisticCB> getNumberOrdersByBrand() {
        ArrayList<StatisticCB> cs = new ArrayList();
        try {
            String sql = "Select b.BrandName, count(od.ProductDetailID) from OrderDetails od, ProductDetails pd, Products p, Brands b\n"
                    + "where od.ProductDetailID = pd.ProductDetailID and pd.ProductId = p.ProductId \n"
                    + "and b.BrandId = p.BrandID\n"
                    + "group by b.BrandName";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                int count = rs.getInt(2);
                cs.add(new StatisticCB(name, count));
            }
        } catch (Exception e) {
        }
        return cs;
    }

    // revenue
    public ArrayList<StatisticRevenues> getRevenuesByMonth() {
        ArrayList<StatisticRevenues> rvns = new ArrayList();
        try {
            String sql = "Select MONTH(o.OrderDate), ISNULL(sum(o2.TotalPrice),0)\n"
                    + "from Orders o left join Orders o2 on (o.OrderId = o2.OrderId) and o.StatusID = 3\n"
                    + "group by MONTH(o.OrderDate)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int unit = rs.getInt(1);
                double revenue = rs.getDouble(2);
                rvns.add(new StatisticRevenues(unit, revenue));
            }
        } catch (Exception e) {
        }
        return rvns;
    }

    public ArrayList<StatisticRevenues> getProfitByMonth() {
        ArrayList<StatisticRevenues> rvns = new ArrayList();
        try {
            String sql = "Select MONTH(o.OrderDate), ISNULL(sum(o2.TotalPrice),0) - ISNULL(CAST(sum(p.ImportPrice*od.Quantity) as int),0) \n" +
"from ((Orders o left join Orders o2  on (o.OrderId = o2.OrderId and o.StatusID = 3)  \n" +
"left join OrderDetails od on o.OrderId = od.OrderID) left join ProductDetails pd on od.ProductDetailID = pd.ProductDetailId) \n" +
"left join Products p on pd.ProductId = p.ProductId and o.StatusID = 3\n" +
"group by MONTH(o.OrderDate)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int unit = rs.getInt(1);
                double revenue = rs.getDouble(2);
                rvns.add(new StatisticRevenues(unit, revenue));
            }
        } catch (Exception e) {
        }
        return rvns;
    }

    public ArrayList<StatisticRevenues> getCapitalByMonth() {
        ArrayList<StatisticRevenues> rvns = new ArrayList();
        try {
            String sql = "Select MONTH(o.OrderDate), ISNULL(CAST(sum(p.ImportPrice*od.Quantity) as int),0) from ((Orders o left join Orders o2  on o.OrderId = o2.OrderId \n"
                    + "left join OrderDetails od on o.OrderId = od.OrderID) left join ProductDetails pd on od.ProductDetailID = pd.ProductDetailId) \n"
                    + "left join Products p on pd.ProductId = p.ProductId and o.StatusID = 3   \n"
                    + "group by MONTH(o.OrderDate)";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int unit = rs.getInt(1);
                double revenue = rs.getDouble(2);
                rvns.add(new StatisticRevenues(unit, revenue));
            }
        } catch (Exception e) {
        }
        return rvns;
    }
    
    

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getAllOrders().size());
    }
}
