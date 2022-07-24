/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;

/**
 *
 * @author vietd
 */
public class Cart extends Account {

    int cartId;
    String createdAt;
    String modifiedAt;
    ArrayList<CartItems> cartItems;

    public Cart() {
    }

    public Cart(int cartId, String createdAt, String modifiedAt) {
        this.cartId = cartId;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(String modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public ArrayList<CartItems> getCartItems() {
        return cartItems;
    }

    public void setCartItems(ArrayList<CartItems> cartItems) {
        this.cartItems = cartItems;
    }

    

}
