/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

/**
 *
 * @author ADMIN
 */
public class Order {
    int orderID;
    Date orderDate;
    Date shipDate;
    Status status;
    double total;
    Customer customer;
    String address;
    ShippingCompany shippingCompany;
    ArrayList<OrderDetails> orderDetail;
    String customerName;
    String phoneNumber;
    
    public Order() {
    }

    public Order(int orderID, Date orderDate, Date shipDate, Status status, double total, Customer customer, String address, ShippingCompany shippingCompany, String customerName, String phoneNumber) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.status = status;
        this.total = total;
        this.customer = customer;
        this.address = address;
        this.shippingCompany = shippingCompany;
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
    }

    public Order(int orderID, Date orderDate, Date shipDate, Status status, double total, Customer customer, String address, ShippingCompany shippingCompany, ArrayList<OrderDetails> orderDetail,String customerName, String phoneNumber) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.status = status;
        this.total = total;
        this.customer = customer;
        this.address = address;
        this.shippingCompany = shippingCompany;
        this.orderDetail = orderDetail;
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
    }

    public ArrayList<OrderDetails> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(ArrayList<OrderDetails> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public ShippingCompany getShippingCompany() {
        return shippingCompany;
    }

    public void setShippingCompany(ShippingCompany shippingCompany) {
        this.shippingCompany = shippingCompany;
    }
    
    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getTotal() {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
        return currencyVN.format(total);
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderDate() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(orderDate);
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getShipDate() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(shipDate);
    }

    public void setShipDate(Date shipDate) {
        this.shipDate = shipDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return " " + orderID + " " + orderDate +" " + shipDate + " " + status + " " + total;
    }
}
