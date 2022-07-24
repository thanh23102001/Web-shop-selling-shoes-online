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
public class ProductFilter {

    private String brandId;
    private String size;
    private String color;
    private int numOfAttributeFitler;
    private String specifiedAttribute;
    private String subcategoryId;
    private String sortBy;
    private boolean isAsc;
    private int currentPage;
    private int totalPage;
    private int recordPerPage;
    private int statusId;
    private int totalRecord;

    public ProductFilter() {
        numOfAttributeFitler = 0;
        brandId = "";
        specifiedAttribute = "";
        subcategoryId = "";
        sortBy = "date";
        isAsc = false;
        currentPage = 1;
        totalPage = 0;
        recordPerPage = 12;
        statusId = 1;
        totalRecord = 0;
        size = "";
        color = "";
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

    public String getSubcategoryId() {
        return subcategoryId;
    }

    public void setSubcategoryId(String subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPage() {
        if (totalRecord % recordPerPage == 0) {
            return totalRecord / recordPerPage;
        } else {
            return totalRecord / recordPerPage + 1;
        }
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getRecordPerPage() {
        return recordPerPage;
    }

    public void setRecordPerPage(int recordPerPage) {
        this.recordPerPage = recordPerPage;
    }

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }

    public boolean isIsAsc() {
        return isAsc;
    }

    public void setIsAsc(boolean isAsc) {
        this.isAsc = isAsc;
    }

    public int getNumOfAttributeFitler() {
        return numOfAttributeFitler;
    }

    public void setNumOfAttributeFitler(int numOfAttributeFitler) {
        this.numOfAttributeFitler = numOfAttributeFitler;
    }

    public String getSpecifiedAttribute() {
        return specifiedAttribute;
    }

    public void setSpecifiedAttribute(String specifiedAttribute) {
        this.specifiedAttribute = specifiedAttribute;
    }

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

}
