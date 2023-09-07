/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.order;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class OrderDTO {
    private String street;
    private String city;
    private String postal_code;
    private String phone;
    private String home_number;
    
    private String title, name, img;
    private int quantity;
    private double price;
    
    private int order_id, optional_product_item_id;
    private double sell_price, shipping_fee;
    private int amount;
    private int customer_id, delivery_method_id;
    private String order_address;
    private Date order_date;
    private String status;
    private double total_price_order;
    private String paypal_transaction_id;
    private String order_phone;
    private int shop_id;
    private String fullname;
    private String image_1, shop_name, dmname;
    
    
    public OrderDTO() {
    }

    public OrderDTO(String order_address, String order_phone, Date order_date, String title, String name, Double sell_price, int amount, String dmname, String fullname, double shipping_fee) {
        this.order_address = order_address;
        this.order_phone = order_phone;
        this.order_date = order_date;
        this.title = title;
        this.name = name;
        this.sell_price = sell_price;
        this.amount = amount;
        this.fullname = fullname;
        this.dmname = dmname;
        this.shipping_fee = shipping_fee;
    }
    
    public OrderDTO(String order_address, String order_phone, Date order_date, Double total_price_order, String image_1, String shop_name, String title, String name, Double sell_price, int amount) {
        this.order_address = order_address;
        this.order_phone = order_phone;
        this.order_date = order_date;
        this.total_price_order = total_price_order;
        this.image_1 = image_1;
        this.shop_name = shop_name;
        this.title = title;
        this.name = name;
        this.sell_price = sell_price;
        this.amount = amount;
    }
    
    public OrderDTO(int shop_id) {
        this.shop_id = shop_id;
    }
    
    public OrderDTO(int order_id, int shop_id) {
        this.order_id = order_id;
        this.shop_id = shop_id;
    }
    
    public OrderDTO(int order_id, int optional_product_item_id, double sell_price, int amount) {
        this.order_id = order_id;
        this.optional_product_item_id = optional_product_item_id;
        this.sell_price = sell_price;
        this.amount = amount;
    }
    
    public OrderDTO(int order_id, double total_price_order, String status, String paypal_transaction_id, Date order_date, String name) {
        this.order_id = order_id;
        this.total_price_order = total_price_order;
        this.status = status;
        this.paypal_transaction_id = paypal_transaction_id;
        this.order_date = order_date;
        this.name = name;
    }
    
    public OrderDTO(int customer_id, int delivery_method_id, String order_address, Date order_date, String status, double total_price_order, String paypal_transaction_id, String order_phone) {
        this.customer_id = customer_id;
        this.delivery_method_id = delivery_method_id;
        this.order_address = order_address;
        this.order_date = order_date;
        this.status = status;
        this.total_price_order = total_price_order;
        this.paypal_transaction_id = paypal_transaction_id;
        this.order_phone = order_phone;
    } 
    

    public OrderDTO(String title, String name, String img, int quantity, double price) {
        this.title = title;
        this.name = name;
        this.img = img;
        this.quantity = quantity;
        this.price = price;
    }

    
    
    public OrderDTO(String street, String city, String postal_code, String phone, String home_number) {
        this.street = street;
        this.city = city;
        this.postal_code = postal_code;
        this.phone = phone;
        this.home_number = home_number;
    }

    public OrderDTO(String title, String name, Date order_date, String status, double total_price_order) {
        this.title = title;
        this.name = name;
        this.order_date = order_date;
        this.status = status;
        this.total_price_order = total_price_order;
    }

    public OrderDTO(int optional_product_item_id, int order_id, String title, String name, double sell_price, Date order_date, String status, String fullname) {
        this.optional_product_item_id = optional_product_item_id;
        this.order_id = order_id;
        this.title = title;
        this.name = name;
        this.sell_price = sell_price;
        this.order_date = order_date;
        this.status = status;
        this.fullname = fullname;
    }

    
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHome_number() {
        return home_number;
    }

    public void setHome_number(String home_number) {
        this.home_number = home_number;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getOptional_product_item_id() {
        return optional_product_item_id;
    }

    public void setOptional_product_item_id(int optional_product_item_id) {
        this.optional_product_item_id = optional_product_item_id;
    }

    public double getSell_price() {
        return sell_price;
    }

    public void setSell_price(double sell_price) {
        this.sell_price = sell_price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getDelivery_method_id() {
        return delivery_method_id;
    }

    public void setDelivery_method_id(int delivery_method_id) {
        this.delivery_method_id = delivery_method_id;
    }

    public String getOrder_address() {
        return order_address;
    }

    public void setOrder_address(String order_address) {
        this.order_address = order_address;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotal_price_order() {
        return total_price_order;
    }

    public void setTotal_price_order(double total_price_order) {
        this.total_price_order = total_price_order;
    }

    public String getPaypal_transaction_id() {
        return paypal_transaction_id;
    }

    public void setPaypal_transaction_id(String paypal_transaction_id) {
        this.paypal_transaction_id = paypal_transaction_id;
    }

    public String getOrder_phone() {
        return order_phone;
    }

    public void setOrder_phone(String order_phone) {
        this.order_phone = order_phone;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getImage_1() {
        return image_1;
    }

    public void setImage_1(String image_1) {
        this.image_1 = image_1;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public double getShipping_fee() {
        return shipping_fee;
    }

    public void setShipping_fee(double shipping_fee) {
        this.shipping_fee = shipping_fee;
    }

    public String getDmname() {
        return dmname;
    }

    public void setDmname(String dmname) {
        this.dmname = dmname;
    }
    
    
    
    @Override
    public String toString() {
        return home_number + "/" + street +"/" + city;
    }
}
