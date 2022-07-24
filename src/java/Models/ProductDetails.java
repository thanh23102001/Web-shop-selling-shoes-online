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
public class ProductDetails extends Product{
    int ProductDetailId;
    String size;
    String color;
    int quantityInStock;
    Product product;

    public ProductDetails() {
    }

    public ProductDetails(int ProductDetailId, String size, String color, int quantityInStock) {
        this.ProductDetailId = ProductDetailId;
        this.size = size;
        this.color = color;
        this.quantityInStock = quantityInStock;
    }

    public int getProductDetailId() {
        return ProductDetailId;
    }

    public void setProductDetailId(int ProductDetailId) {
        this.ProductDetailId = ProductDetailId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
    
    
}
