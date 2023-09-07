/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.shop;

import java.util.Date;

public class ShopDTO {

    private String username, shopName, phone, address, avatar, email, city;
    private Date registed_date;

    private String report_detail, customer_fullname;
    private int shop_status;
    private int reported_shop_id;
    
    public ShopDTO() {
    }

    public ShopDTO(String username, String shopName, String phone, String address, String avatar, String email, String city, Date registed_date) {
        this.username = username;
        this.shopName = shopName;
        this.phone = phone;
        this.address = address;
        this.avatar = avatar;
        this.email = email;
        this.city = city;
        this.registed_date = registed_date;
    }

    public ShopDTO(String username, String phone, String email, Date registed_date) {
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.registed_date = registed_date;
    }

    public ShopDTO(String username, String shopName, String report_detail, String customer_fullname, int shop_status, int reported_shop_id) {
        this.username = username;
        this.shopName = shopName;
        this.report_detail = report_detail;
        this.customer_fullname = customer_fullname;
        this.shop_status = shop_status;
        this.reported_shop_id = reported_shop_id;
    }

    public ShopDTO(String username, int shop_status) {
        this.username = username;
        this.shop_status = shop_status;
    }

    public ShopDTO(String shopName, String avatar) {
        this.shopName = shopName;
        this.avatar = avatar;
    }

    
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Date getRegisted_date() {
        return registed_date;
    }

    public void setRegisted_date(Date registed_date) {
        this.registed_date = registed_date;
    }

    public String getReport_detail() {
        return report_detail;
    }

    public void setReport_detail(String report_detail) {
        this.report_detail = report_detail;
    }

    public String getCustomer_fullname() {
        return customer_fullname;
    }

    public void setCustomer_fullname(String customer_fullname) {
        this.customer_fullname = customer_fullname;
    }

    public int getShop_status() {
        return shop_status;
    }

    public void setShop_status(int shop_status) {
        this.shop_status = shop_status;
    }

    public int getReported_shop_id() {
        return reported_shop_id;
    }

    public void setReported_shop_id(int reported_shop_id) {
        this.reported_shop_id = reported_shop_id;
    }

    

    
    
}
