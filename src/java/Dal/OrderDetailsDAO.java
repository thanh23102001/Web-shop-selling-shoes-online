/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.OrderDetails;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 8
 *
 * @author ADMIN
 */
public class OrderDetailsDAO extends DBContext {

    ImageDAO Idao = new ImageDAO();

    public ArrayList<OrderDetails> getOrderDetails(int orderId) {
        ArrayList<OrderDetails> details = new ArrayList<>();
        try {
            String sql = "select o1.* , p.ProductId  from  OrderDetails o1, ProductDetails p\n"
                    + "where o1.OrderID = ? and o1.ProductDetailID = p.ProductDetailId ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetails orderDetails = new OrderDetails(rs.getInt("OrderDetailId"), rs.getInt("Quantity"),
                        rs.getDouble("Price"), rs.getDouble("Discount"));
                orderDetails.setProductDetail(new ProductDetailsDAO().getProductDetail(rs.getInt("ProductDetailID")));
//                orderDetails.setOrderId(new OrderDAO().getOrderById(rs.getInt("OrderID")));
                orderDetails.getProductDetail().setProduct(new ProductDAO().getProductByProductId(rs.getInt("ProductId")));
//                orderDetails.setIsFeedback(rs.getString("isFeedback"));
                details.add(orderDetails);
            }
        } catch (SQLException e) {
        }
        return details;
    }
    

    public void insertOrderItems(int orderId, int productDetailId, int quantity, double price, double discount) {
        try {
            String sql = "insert into OrderDetails(OrderID,ProductDetailID,Quantity,Price,Discount)\n"
                    + "values (?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.setInt(2, productDetailId);
            stm.setInt(3, quantity);
            stm.setDouble(4, price);
            stm.setDouble(5, discount);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateFeedback(int orderDetailId) {
        try {
            String sql = "update OrderDetails\n"
                    + "set isFeedback = 'yes' where OrderDetailId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderDetailId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        OrderDetailsDAO ad = new OrderDetailsDAO();
        System.out.println(ad.getOrderDetails(4).size());
    }

}
