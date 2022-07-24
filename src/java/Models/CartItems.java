/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author vietd
 */
public class CartItems {

    int cartDetailId;
    int cartId;
    ProductDetails productDetail;
    int quantityInCart;
    Product product;

    public CartItems() {
    }

    public CartItems(int cartItemId, int quantityInCart) {
        this.cartId = cartItemId;
        this.quantityInCart = quantityInCart;
    }

    public int getCartDetailId() {
        return cartDetailId;
    }

    public void setCartDetailId(int cartDetailId) {
        this.cartDetailId = cartDetailId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public void setProductDetail(ProductDetails productDetail) {
        this.productDetail = productDetail;
    }

    public ProductDetails getProductDetail() {
        return productDetail;
    }

    public int getQuantityInCart() {
        return quantityInCart;
    }

    public void setQuantityInCart(int quantityInCart) {
        this.quantityInCart = quantityInCart;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
