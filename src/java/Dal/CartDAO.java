/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author vietd
 */
public class CartDAO extends DBContext {

    public Cart getCartByCustomer(int customerId) {
        try {
            String sql = "select * from Carts where AccountId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, customerId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart(rs.getInt("CartId"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                cart.setAccountId(rs.getInt("AccountId"));
                cart.setCartItems(new CartItemsDAO().getItems(rs.getInt("CartId")));
                return cart;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int insertCart(int accountId) {
        try {
            String sql = " insert into Carts(AccountId)"
                    + "output inserted.CartId values (?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, accountId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("CartId");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public static void main(String[] args) {
        System.out.println(new CartDAO().getCartByCustomer(10).getCartItems().get(0).getProduct().getImages().size());
    }

}
