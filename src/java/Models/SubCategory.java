/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author vietd
 */
public class SubCategory {

    int subCategoryId;
    String subCategoryName;
    String image;
    String createdAt;
    String modifiedAt;
    Category category;
    int totalProduct;
    String status;
    String description;

    public SubCategory(int subCategoryId, String subCategoryName, String image, String createdAt, String modifiedAt, String status) {
        this.subCategoryId = subCategoryId;
        this.subCategoryName = subCategoryName;
        this.image = image;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        this.status = status;
    }

    public SubCategory() {
    }

    public int getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(int subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public String getSubCategoryName() {
        return subCategoryName;
    }

    public void setSubCategoryName(String subCategoryName) {
        this.subCategoryName = subCategoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatedAt() {
        if(createdAt == null || createdAt.length() <= 10) return "Not yet";
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        return df.format(Date.valueOf(createdAt.substring(0,10)));
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getModifiedAt() {
        if(modifiedAt == null || modifiedAt.length() <= 10) return "Not modified yet";
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        return df.format(Date.valueOf(modifiedAt.substring(0,10)));
    }


    public void setModifiedAt(String modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setTotalProduct(int totalProduct) {
        this.totalProduct = totalProduct;
    }

    public int getTotalProduct() {
        return totalProduct;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    

}
