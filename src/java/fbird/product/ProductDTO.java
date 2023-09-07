/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.product;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author louis
 */
public class ProductDTO {

    private int shopProductItemID;
    private int shopID;
    private int categoryID;
    private int typeOfBirdID;
    private String title;
    private String description;
    private int inventory;
    private Date uploadDate;
    private byte status;
    private String image_1;
    private String image_2;
    private String image_3;
    private String image_4;

    private String type_of_bird_name;
    private String category_name;
    private String shop_name;
    private String avatar;
    private Double price;
    private String nameOption;
    private double priceView;
    private double sell_price;
    private int amount;
    private String fullname;

    private int total_product;
    private int total_unit_sell;
    private int total_order;
    private double revenue;
    private int optional_shop_product_item_id;
    public ProductDTO() {
    }

    public ProductDTO(int total_product, int total_order, int total_unit_sell, double revenue) {
        this.total_product = total_product;
        this.total_order = total_order;
        this.total_unit_sell = total_unit_sell;
        this.revenue = revenue;
    }
    
    public ProductDTO(String title, String name, double sell_price, int amount, String fullname) {
        this.title = title;
        this.nameOption = name;
        this.sell_price = sell_price;
        this.amount = amount;
        this.fullname = fullname;
    }

    public ProductDTO(int shopID, int categoryID, int typeOfBirdID, String title, String description, Date uploadDate, byte status) {
        this.shopID = shopID;
        this.categoryID = categoryID;
        this.typeOfBirdID = typeOfBirdID;
        this.title = title;
        this.description = description;
        
        this.uploadDate = uploadDate;
        this.status = status;
    }

    public ProductDTO(int shopProductItemID, int shopID, String title, String image_1, String avatar, Double price, String shop_name) {
        this.shopProductItemID = shopProductItemID;
        this.shopID = shopID;
        this.title = title;
        this.image_1 = image_1;
        this.avatar = avatar;
        this.price = price;
        this.shop_name = shop_name;
    }

    public ProductDTO(int shopProductItemID, int shopID, int categoryID, int typeOfBirdID, String title, String description, Date uploadDate, byte status) {
        this.shopProductItemID = shopProductItemID;
        this.shopID = shopID;
        this.categoryID = categoryID;
        this.typeOfBirdID = typeOfBirdID;
        this.title = title;
        this.description = description;
        
        this.uploadDate = uploadDate;
        this.status = status;
    }

    public ProductDTO(int shopID, int shopProductItemID, String title, String description, Date uploadDate, byte status, String image_1, String image_2, String image_3, String image_4, String type_of_bird_name, String shop_name, String avatar) {
        this.shopProductItemID = shopProductItemID;

        this.shopID = shopID;
        this.title = title;
        this.description = description;
       
        this.uploadDate = uploadDate;

        this.image_1 = image_1;
        this.image_2 = image_2;
        this.image_3 = image_3;
        this.image_4 = image_4;

        this.type_of_bird_name = type_of_bird_name;
        this.shop_name = shop_name;
        this.avatar = avatar;

    }

    public ProductDTO(int optional_shop_product_item_id, String title){
        this.optional_shop_product_item_id = optional_shop_product_item_id;
        this.title = title;
    }
    
    public ProductDTO(int shopProductItemID, int shopID, String title, String image_1, Double price) {
        this.shopProductItemID = shopProductItemID;
        this.shopID = shopID;
        this.title = title;
        this.image_1 = image_1;
        this.price = price;
    }

    public ProductDTO(int shopProductItemID, int shopID, String title, String image_1, Double price, int categoryID) {
        this.shopProductItemID = shopProductItemID;
        this.shopID = shopID;
        this.title = title;
        this.image_1 = image_1;
        this.price = price;
        this.categoryID = categoryID;
    }

    public ProductDTO(int shopProductItemID, int shopID, int categoryID, int typeOfBirdID, String title, String description, int inventory, Date uploadDate, byte status, Double price, String nameOption) {
        this.shopProductItemID = shopProductItemID;
        this.shopID = shopID;
        this.categoryID = categoryID;
        this.typeOfBirdID = typeOfBirdID;
        this.title = title;
        this.description = description;
        this.inventory = inventory;
        this.uploadDate = uploadDate;
        this.status = status;
        this.price = price;
        this.nameOption = nameOption;
    }

    public ProductDTO(int shopProductItemID, int shopID, int categoryID, int typeOfBirdID, String title, byte status, String image_1, String type_of_bird_name, String category_name, String shop_name, String avatar, Double price, String nameOption, double priceView) {
        this.shopProductItemID = shopProductItemID;
        this.shopID = shopID;
        this.categoryID = categoryID;
        this.typeOfBirdID = typeOfBirdID;
        this.title = title;
        this.description = description;
        this.inventory = inventory;
        this.uploadDate = uploadDate;
        this.status = status;
        this.image_1 = image_1;
        this.image_2 = image_2;
        this.image_3 = image_3;
        this.image_4 = image_4;
        this.type_of_bird_name = type_of_bird_name;
        this.category_name = category_name;
        this.shop_name = shop_name;
        this.avatar = avatar;
        this.price = price;
        this.nameOption = nameOption;
        this.priceView = priceView;
    }

    public ProductDTO(int shopProductItemID, String title, String description, int inventory, byte status, String type_of_bird_name, String category_name, Double price, String nameOption, double priceView, int optional_shop_product_item_id) {
        this.shopProductItemID = shopProductItemID;
        this.shopID = shopID;
        this.categoryID = categoryID;
        this.typeOfBirdID = typeOfBirdID;
        this.title = title;
        this.description = description;
        this.inventory = inventory;
        this.uploadDate = uploadDate;
        this.status = status;
        this.type_of_bird_name = type_of_bird_name;
        this.category_name = category_name;
        this.shop_name = shop_name;
        this.avatar = avatar;
        this.price = price;
        this.nameOption = nameOption;
        this.priceView = priceView;
        this.optional_shop_product_item_id = optional_shop_product_item_id;
    }

    public ProductDTO(int shopProductItemID) {
        this.shopProductItemID = shopProductItemID;
    }

    public int getShopProductItemID() {
        return shopProductItemID;
    }

    public void setShopProductItemID(int shopProductItemID) {
        this.shopProductItemID = shopProductItemID;
    }

    public int getShopID() {
        return shopID;
    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getTypeOfBirdID() {
        return typeOfBirdID;
    }

    public void setTypeOfBirdID(int typeOfBirdID) {
        this.typeOfBirdID = typeOfBirdID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public String getImage_1() {
        return image_1;
    }

    public void setImage_1(String image_1) {
        this.image_1 = image_1;
    }

    public String getImage_2() {
        return image_2;
    }

    public void setImage_2(String image_2) {
        this.image_2 = image_2;
    }

    public String getImage_3() {
        return image_3;
    }

    public void setImage_3(String image_3) {
        this.image_3 = image_3;
    }

    public String getImage_4() {
        return image_4;
    }

    public void setImage_4(String image_4) {
        this.image_4 = image_4;
    }

    public String getType_of_bird_name() {
        return type_of_bird_name;
    }

    public void setType_of_bird_name(String type_of_bird_name) {
        this.type_of_bird_name = type_of_bird_name;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getNameOption() {
        return nameOption;
    }

    public void setNameOption(String nameOption) {
        this.nameOption = nameOption;
    }

    public double getPriceView() {
        return priceView;
    }

    public void setPriceView(double priceView) {
        this.priceView = priceView;

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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getTotal_product() {
        return total_product;
    }

    public void setTotal_product(int total_product) {
        this.total_product = total_product;
    }

    public int getTotal_unit_sell() {
        return total_unit_sell;
    }

    public void setTotal_unit_sell(int total_unit_sell) {
        this.total_unit_sell = total_unit_sell;
    }

    public int getTotal_order() {
        return total_order;
    }

    public void setTotal_order(int total_order) {
        this.total_order = total_order;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public int getOptional_shop_product_item_id() {
        return optional_shop_product_item_id;
    }

    public void setOptional_shop_product_item_id(int optional_shop_product_item_id) {
        this.optional_shop_product_item_id = optional_shop_product_item_id;
    }
    

    
}
