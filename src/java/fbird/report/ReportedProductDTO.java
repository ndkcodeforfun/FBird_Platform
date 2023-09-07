/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.report;

/**
 *
 * @author Admin
 */
public class ReportedProductDTO {
    private int report_product_id;
    private int shop_product_item_id;
    private int customer_id;
    private String detail;
    private String title;
    private String fullname;
    public ReportedProductDTO() {
    }

    public ReportedProductDTO(int report_product_id, int shop_product_item_id, int customer_id, String detail) {
        this.report_product_id = report_product_id;
        this.shop_product_item_id = shop_product_item_id;
        this.customer_id = customer_id;
        this.detail = detail;
    }

    public ReportedProductDTO(int shop_product_item_id, int customer_id, String detail) {
        this.shop_product_item_id = shop_product_item_id;
        this.customer_id = customer_id;
        this.detail = detail;
    }

    public ReportedProductDTO(String detail, String title, String fullname) {
        this.detail = detail;
        this.title = title;
        this.fullname = fullname;
    }
    

    public int getReport_product_id() {
        return report_product_id;
    }

    public void setReport_product_id(int report_product_id) {
        this.report_product_id = report_product_id;
    }

    public int getShop_product_item_id() {
        return shop_product_item_id;
    }

    public void setShop_product_item_id(int shop_product_item_id) {
        this.shop_product_item_id = shop_product_item_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

}
