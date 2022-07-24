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
public class ProductDTO {

    public List<ProductDTORes> data;
    public int total;

    public ProductDTO() {
    }

    public ProductDTO(List<ProductDTORes> data, int total) {
        this.data = data;
        this.total = total;
    }

    public List<ProductDTORes> getData() {
        return data;
    }

    public void setData(List<ProductDTORes> data) {
        this.data = data;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

   public static class ProductDTORes {

        private int index;
        private int id;
        private String productName;
        private String category;
        private String brand;
        private double importPrice;
        private double unitPrice;
        private String createdAt;
        private String modifiedAt;

        public ProductDTORes() {
        }

        public ProductDTORes(int index, int id, String productName, String category, String brand, double importPrice, double unitPrice, String createdAt, String modifiedAt) {
            this.index = index;
            this.id = id;
            this.productName = productName;
            this.category = category;
            this.brand = brand;
            this.importPrice = importPrice;
            this.unitPrice = unitPrice;
            this.createdAt = createdAt;
            this.modifiedAt = modifiedAt;
        }

        public int getIndex() {
            return index;
        }

        public void setIndex(int index) {
            this.index = index;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
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

    }
}
