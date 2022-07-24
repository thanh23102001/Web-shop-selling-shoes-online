/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author vietd
 */
public class Category {
    int categoryId;
    String categoryName;
    String categoryDescription;
    String createdAt;
    String modifiedAt;
    ArrayList<SubCategory> subcategories;
    int totalProduct;

    public Category() {
    }

    public Category(int categoryId, String categoryName, String categoryDescription, String createdAt, String modifiedAt) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public String getCreatedAt() {
        if(createdAt == null || createdAt.length() <= 10) return "Not yet";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(Date.valueOf(createdAt.substring(0,10)));
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

   public String getModifiedAt() {
        if(modifiedAt == null || modifiedAt.length() <= 10) return "Not modified yet";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(Date.valueOf(modifiedAt.substring(0,10)));
    }

    public void setModifiedAt(String modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public void setSubcategories(ArrayList<SubCategory> subcategories) {
        this.subcategories = subcategories;
    }

    public ArrayList<SubCategory> getSubcategories() {
        return subcategories;
    }

    public void setTotalProduct(int totalProduct) {
        this.totalProduct = totalProduct;
    }

    public int getTotalProduct() {
        return totalProduct;
    }
    
    
    
}
