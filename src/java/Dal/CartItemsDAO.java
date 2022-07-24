/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.CartItems;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author vietd
 */
public class CartItemsDAO extends DBContext {

    public ArrayList<CartItems> getItems(int cartId) {
        ArrayList<CartItems> items = new ArrayList();
        try {
            String sql = "select c.* , p.ProductId from CartDetails c , ProductDetails p\n" + "where c.ProductDetailId = p.ProductDetailId and c.CartId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cartId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CartItems item = new CartItems(rs.getInt("CartId"), rs.getInt("QuantityInCart"));
                item.setCartDetailId(rs.getInt("CartDetailId"));
                item.setProductDetail(new ProductDetailsDAO().getProductDetail(rs.getInt("ProductDetailId")));
                item.setProduct(new ProductDAO().getProductByProductId(rs.getInt("ProductId")));
                items.add(item);
            }
        } catch (SQLException e) {
        }
        return items;
    }

    public int updateCartItems(CartItems item) {
        try {
            String sql = "update CartDetails set QuantityInCart = ? , ProductDetailId = ? where CartDetailId = ? and CartId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, item.getQuantityInCart());
            stm.setInt(2, item.getProductDetail().getProductDetailId());
            stm.setInt(3, item.getCartDetailId());
            stm.setInt(4, item.getCartId());
            return stm.executeUpdate();
        } catch (SQLException e) {
        }
        return -1;
    }

    public int deleteCartItems(int cartDetailId, int cartId) {
        try {
            String sql = "delete from CartDetails where CartDetailId =  ? and CartId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cartDetailId);
            stm.setInt(2, cartId);
            return stm.executeUpdate();
        } catch (SQLException e) {
            return -1;
        }
    }

    public void insertItemsToCart(int cartId, int productDetailId, int quantity) {
        try {
            String sql = " insert into CartDetails(CartId,ProductDetailId,QuantityInCart)\n"
                    + " values (?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cartId);
            stm.setInt(2, productDetailId);
            stm.setInt(3, quantity);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateQuantity(int productDetailId, int newQuantity, int cartId, int oldQuantity) {
        try {
            String sql = " Update CartDetails\n"
                    + "	set QuantityInCart = ? \n"
                    + "	where CartId = ? and ProductDetailId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, oldQuantity + newQuantity);
            stm.setInt(2, cartId);
            stm.setInt(3, productDetailId);
            stm.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public CartItems getCartItem(int accountId, int cartItemId) {
        try {
            String sql = "select c1.* , p.ProductId from Carts c , CartDetails c1 , ProductDetails p , Products p1\n"
                    + "where c.AccountId = ? and c1.CartId = c.CartId and c1.CartDetailId = ? and c1.ProductDetailId = p.ProductDetailId and p1.ProductId = p.ProductId ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            stm.setInt(2, cartItemId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CartItems item = new CartItems(rs.getInt("CartId"), rs.getInt("QuantityInCart"));
                item.setCartDetailId(rs.getInt("CartDetailId"));
                item.setProductDetail(new ProductDetailsDAO().getProductDetail(rs.getInt("ProductDetailId")));
                item.setProduct(new ProductDAO().getProductByProductId(rs.getInt("ProductId")));
                return item;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
