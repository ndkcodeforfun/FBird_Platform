/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.report;

import fbird.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ReportedProductDAO {
    private static final String VIEW = "SELECT reported_product.detail, shop_product_item.title, customer.fullname FROM reported_product JOIN shop_product_item  ON shop_product_item.shop_product_item_id = reported_product.shop_product_item_id JOIN customer  ON customer.customer_id = reported_product.customer_id where shop_product_item.title like ?";
    private static final String ADD = "INSERT INTO reported_product (shop_product_item_id, customer_id, detail) VALUES(?,?,?)";
    
    public List<ReportedProductDTO> getReportProduct(String search) throws SQLException {
        List<ReportedProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW);
                ptm.setString(1,"%"+ search+ "%" );
                rs = ptm.executeQuery();


                while (rs.next()) {
                    String title= rs.getString("title");       
                    String fullname = rs.getString("fullname");                                           
                    String detail =rs.getString("detail");
                    
                   list.add(new ReportedProductDTO(title, fullname, detail));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    public void addReportProduct(ReportedProductDTO addreportproduct) throws SQLException, ClassNotFoundException{
        
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setInt(1, addreportproduct.getShop_product_item_id());
                ptm.setInt(2, addreportproduct.getCustomer_id());
                ptm.setString(3, addreportproduct.getDetail());
              
                ptm.executeUpdate();
               
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
    }
}
