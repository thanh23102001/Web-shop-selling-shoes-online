/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Customer;
import Models.Feedback;
import Models.Order;
import Models.OrderDetails;
import Models.Product;
import Models.ProductDetails;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vietd
 */
public class FeedbackDAO extends DBContext {

    public int insertFeedback(int customerId, int orderId, int orderDetailId, int rating, String comment) {
        try {
            String sql = "insert into Feedbacks(OrderDetailId,CustomerId,OrderID,Rating,Comment)\n"
                    + "values (?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderDetailId);
            stm.setInt(2, customerId);
            stm.setInt(3, orderId);
            stm.setInt(4, rating);
            stm.setNString(5, comment);
            int result = stm.executeUpdate();
            if (result == 1) {
                new OrderDetailsDAO().updateFeedback(orderDetailId);
            }
            return result;
        } catch (Exception e) {
        }
        return -1;
    }

    public List<Feedback> getFeedbacks(int customerId, int orderId) {
        List<Feedback> feedbacks = new ArrayList<>();
        try {
            String sql = "select p.ProductId, p.ProductName,  \n"
                    + "p.UnitPrice, \n"
                    + "od.OrderDetailId,\n"
                    + "od.Quantity, od.Price, od.Discount, pd.Size, pd.Color, f.FeedbackId,\n"
                    + "f.Rating, f.Comment, f.CreatedAt, f.ModifiedAt\n"
                    + "from Orders O\n"
                    + "join OrderDetails od\n"
                    + "on o.OrderID = od.OrderID\n"
                    + "left join ProductDetails pd\n"
                    + "on od.ProductDetailID = pd.ProductDetailId\n"
                    + "join Products p\n"
                    + "on p.ProductId = pd.ProductId\n"
                    + "left join Feedbacks f\n"
                    + "on f.OrderDetailId = od.OrderDetailId and od.OrderID = f.OrderID\n"
                    + "where od.OrderID = ? and o.CustomerId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.setInt(2, customerId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback(rs.getInt("FeedbackId"), rs.getInt("Rating"), rs.getString("Comment"),
                        rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                Product p = new Product();
                p.setProductId(rs.getInt("ProductId"));
                p.setProductName(rs.getString("ProductName"));
                p.setUnitPrice(rs.getDouble("UnitPrice"));
                p.setImages(new ImageDAO().getImagesByProductId(rs.getInt("ProductId")));
                ProductDetails productDetails = new ProductDetails();
                productDetails.setColor(rs.getString("Color"));
                productDetails.setSize(rs.getString("Size"));
                productDetails.setProduct(p);
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setOrderDetailsId(rs.getInt("OrderDetailId"));
                orderDetails.setQuantity(rs.getInt("Quantity"));
                orderDetails.setPrice(rs.getDouble("Price"));
                orderDetails.setDiscount(rs.getDouble("Discount"));
                orderDetails.setProductDetail(productDetails);
                feedback.setOrderDetails(orderDetails);
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
        }
        return feedbacks;
    }

    public Feedback getFeedback(int orderDetailId, int customerId, int orderId) {
        try {
            String sql = "select f.* , p.ProductId from Feedbacks f , ProductDetails p , OrderDetails o1\n"
                    + "where f.OrderDetailId = ? and f.OrderID = ? and f.CustomerId = ? and p.ProductDetailId = o1.ProductDetailID\n"
                    + "and o1.OrderDetailId = f.OrderDetailId";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderDetailId);
            stm.setInt(2, orderId);
            stm.setInt(3, customerId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback(rs.getInt("FeedbackId"), rs.getInt("Rating"), rs.getString("Comment"),
                        rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                feedback.setCustomer(new CustomerDAO().getProfile(rs.getInt("CustomerId")));
                feedback.setOrder(new OrderDAO().getOrderById(rs.getInt("OrderID")));
                feedback.setProduct(new ProductDAO().getProductByProductId(rs.getInt("ProductId")));
                return feedback;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Feedback getFeedbackById(int feedbackId) {
        try {
            String sql = "select f.* , p.ProductId from Feedbacks f , ProductDetails p , OrderDetails o1\n"
                    + "where f.FeedbackId = ? and p.ProductDetailId = o1.ProductDetailID\n"
                    + "and o1.OrderDetailId = f.OrderDetailId";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, feedbackId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback(rs.getInt("FeedbackId"), rs.getInt("Rating"), rs.getString("Comment"),
                        rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                feedback.setCustomer(new CustomerDAO().getProfile(rs.getInt("CustomerId")));
                feedback.setOrder(new OrderDAO().getOrderById(rs.getInt("OrderID")));
                feedback.setProduct(new ProductDAO().getProductByProductId(rs.getInt("ProductId")));
                return feedback;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateFeedback(int newRating, String newComment, int feedbackId) {
        try {
            String sql = "update Feedbacks\n"
                    + "set Rating = ? , Comment = ? , ModifiedAt = getDate()\n"
                    + "where FeedbackId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, newRating);
            stm.setNString(2, newComment);
            stm.setInt(3, feedbackId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public float get_Average_Rating(int productId) {
        try {
            String sql = "select sum(Rating)/COUNT(FeedbackId) as average_Rating\n"
                    + "from Feedbacks\n"
                    + "where OrderDetailId in (select OrderDetailId from OrderDetails\n"
                    + "where ProductDetailID in (select ProductDetailID from ProductDetails where ProductId = ?))";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getFloat(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countReview(int rating, boolean temp, int productId) {
        try {
            String sql = "select COUNT(FeedbackId) as numOfReview \n"
                    + "from Feedbacks\n"
                    + "where OrderDetailId in (select OrderDetailId from OrderDetails\n"
                    + "where ProductDetailID in (select ProductDetailID from ProductDetails where ProductId = ? ))";
            if (!temp) {
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, productId);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt("numOfReview");
                }
            }
            if (temp) {
                sql = sql + " and Rating = ? ";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, productId);
                stm.setInt(2, rating);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt("numOfReview");
                }

            }
        } catch (Exception e) {
        }
        return -1;
    }

    public ArrayList<Feedback> getFeedbacksByProductId(int productId) {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        try {
            String sql = "select f.* , p.ProductId , p.Color , p.Size from Feedbacks f , ProductDetails p , OrderDetails o1 \n"
                    + "where p.ProductDetailId = o1.ProductDetailID\n"
                    + "and o1.OrderDetailId = f.OrderDetailId and p.ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback(rs.getInt("FeedbackId"), rs.getInt("Rating"), rs.getString("Comment"),
                        rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                feedback.setCustomer(new CustomerDAO().getProfile(rs.getInt("CustomerId")));
                feedback.setColor(rs.getString("Color"));
                feedback.setSize(rs.getInt("Size"));
                feedbacks.add(feedback);
            }
        } catch (Exception e) {
        }
        return feedbacks;
    }
    //Statistic
    public int getNumOfReview() {
        try {
            String sql = "Select count(FeedbackID) from Feedbacks";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public static void main(String[] args) {
        System.out.println(new FeedbackDAO().get_Average_Rating(8));
    }
}
