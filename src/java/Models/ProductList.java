/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.List;

/**
 *
 * @author vietd
 */
public class ProductList {

    private List<Product> products;
    private int countProduct;

    public ProductList() {
    }

    public ProductList(List<Product> products, int countProduct) {
        this.products = products;
        this.countProduct = countProduct;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public int getCountProduct() {
        return countProduct;
    }

    public void setCountProduct(int countProduct) {
        this.countProduct = countProduct;
    }

}
