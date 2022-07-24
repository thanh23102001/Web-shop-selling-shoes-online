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
public class Brands {
    int brandId;
    String brandName;
    String brandImage;
    String createdAt;
    String modifiedAt;
    int totalProduct;
    String status;
    String description;

    public Brands() {
    }

    public Brands(int brandId, String brandName, String brandImage, String createdAt, String modifiedAt, String status) {
        this.brandId = brandId;
        this.brandName = brandName;
        this.brandImage = brandImage;
        this.createdAt = createdAt;
        this.modifiedAt = modifiedAt;
        this.status = status;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandImage() {
        return brandImage;
    }

    public void setBrandImage(String brandImage) {
        this.brandImage = brandImage;
    }

   public String getCreatedAt() {
        if(createdAt == null || createdAt.length() <= 10) return "Not yet";
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-yy");
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

    public int getTotalProduct() {
        return totalProduct;
    }

    public void setTotalProduct(int totalProduct) {
        this.totalProduct = totalProduct;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
