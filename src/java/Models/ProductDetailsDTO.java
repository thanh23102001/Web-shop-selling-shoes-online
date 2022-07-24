/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.List;

/**
 *
 * @author duong
 */
public class ProductDetailsDTO {

    private String productName;
    private String category;
    private String brand;
    private double importPrice;
    private double unitPrice;
    private String createdAt;
    private String modifiedAt;
    private String des;
    List<String> img;
    List<ProductDetails> details;

    public ProductDetailsDTO() {
    }

    public ProductDetailsDTO(String productName, String category, String brand, double importPrice, double unitPrice, String createdAt, String modifiedAt, List<String> img, List<ProductDetails> details) {
        this.productName = productName;
        this.category = category;
        this.brand = brand;
        this.importPrice = importPrice;
        this.unitPrice = unitPrice;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        this.img = img;
        this.details = details;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getImportPrice() {
        return importPrice;
    }

    public void setImportPrice(double importPrice) {
        this.importPrice = importPrice;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
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

    public List<String> getImg() {
        return img;
    }

    public void setImg(List<String> img) {
        this.img = img;
    }

    public List<ProductDetails> getDetails() {
        return details;
    }

    public void setDetails(List<ProductDetails> details) {
        this.details = details;
    }
    
    
    public static class ProductDetails {

        public String size;
        public String color;
        public int quantityInStock;

        public ProductDetails() {
        }

        public ProductDetails(String size, String color, int quantityInStock) {
            this.size = size;
            this.color = color;
            this.quantityInStock = quantityInStock;
        }

    }
}
