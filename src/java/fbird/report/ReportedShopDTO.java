/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.report;

/**
 *
 * @author Admin
 */
public class ReportedShopDTO {
    private int reported_shop_id;
    private int shop_id;
    private int custommer_id;
    private String detail;
    

    public ReportedShopDTO() {
    }

    public ReportedShopDTO(int reported_shop_id, int shop_id, int custommer_id, String detail) {
        this.reported_shop_id = reported_shop_id;
        this.shop_id = shop_id;
        this.custommer_id = custommer_id;
        this.detail = detail;
        
    }

    public ReportedShopDTO(int shop_id, int custommer_id, String detail) {
        this.shop_id = shop_id;
        this.custommer_id = custommer_id;
        this.detail = detail;
        
    }

    public int getReported_shop_id() {
        return reported_shop_id;
    }

    public void setReported_shop_id(int reported_shop_id) {
        this.reported_shop_id = reported_shop_id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public int getCustommer_id() {
        return custommer_id;
    }

    public void setCustommer_id(int custommer_id) {
        this.custommer_id = custommer_id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
