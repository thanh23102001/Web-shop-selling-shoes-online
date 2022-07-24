/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Dal.BrandDAO;
import Dal.SubCategoryDAO;
import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

/**
 *
 * @author vietd
 */
public class Product {
    int productId;
    String productName;
    int subCategoryId;
    int brandId;
    String desscription;
    double importPrice;
    double unitPrice;
    double discount;
    String createdAt;
    String modifiedAt;
    ArrayList<Images> images;
    ArrayList<ProductDetails> details;
    ArrayList<String> colors;
    ArrayList<String> sizes;

    public Product() {
    }

    public Product(int productId, String productName, int subCategoryId, int brandId, String desscription, double importPrice, double unitPrice, double discount, String createdAt, String modifiedAt) {
        this.productId = productId;
        this.productName = productName;
        this.subCategoryId = subCategoryId;
        this.brandId = brandId;
        this.desscription = desscription;
        this.importPrice = importPrice;
        this.unitPrice = unitPrice;
        this.discount = discount;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(int subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public int getBrandId() {
        return brandId;
    }
    
    public String getBrand() {
        return new BrandDAO().getBrandById(brandId).getBrandName();
    }
    
    public String getSubCateName(){
        return new SubCategoryDAO().getSubCategoriesBySubCateId(subCategoryId).getSubCategoryName();
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getDesscription() {
        return desscription;
    }

    public void setDesscription(String desscription) {
        this.desscription = desscription;
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

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
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

    public ArrayList<Images> getImages() {
        return images;
    }

    public void setImages(ArrayList<Images> images) {
        this.images = images;
    }

    public void setDetails(ArrayList<ProductDetails> details) {
        this.details = details;
    }

    public ArrayList<ProductDetails> getDetails() {
        return details;
    }

    public ArrayList<String> getColors() {
        return colors;
    }

    public void setColors(ArrayList<String> colors) {
        this.colors = colors;
    }

    public ArrayList<String> getSizes() {
        return sizes;
    }

    public void setSizes(ArrayList<String> sizes) {
        this.sizes = sizes;
    }
    
    
    // get Money with correct format
    public String getUnitPriceVN() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        return currencyVN.format(unitPrice);
    }
    
    public String getImportPriceVN() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        return currencyVN.format(importPrice);
    }
    
    // get Date with correct format
    public String getCreatedAtDate() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(Date.valueOf(createdAt.substring(0, 10)));
    }
    
    public String getModifiedAtDate() {
        if(modifiedAt == null || modifiedAt.length() <= 10) return "Not modified yet";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(Date.valueOf(modifiedAt.substring(0,10)));
    }
    
}
