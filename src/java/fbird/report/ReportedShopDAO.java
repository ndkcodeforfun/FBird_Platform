/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.report;

import fbird.report.ReportedShopDTO;
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
public class ReportedShopDAO {
     private static final String VIEW = "SELECT shop_id, customer_id, detail FROM reported_shop WHERE reported_shop_id= ?";
    private static final String ADD = "INSERT INTO reported_shop (shop_id, customer_id, detail) VALUES(?,?,?)";
    private static final String DELETE_REPORTED_SHOP = "DELETE reported_shop WHERE reported_shop_id = ?";
    
    public List<ReportedShopDTO> getReportShop(int reported_shop_id) throws SQLException {
        List<ReportedShopDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW);
                ptm.setInt(1, reported_shop_id );
                rs = ptm.executeQuery();


                while (rs.next()) {
                    int shop_id= rs.getInt("shop_id");       
                    int customer_id= rs.getInt("customer_id");                                           
                    String detail =rs.getString("detail");
                    
                   list.add(new ReportedShopDTO(shop_id, customer_id, detail));
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
     public void addReportShop(ReportedShopDTO addreportshop) throws SQLException, ClassNotFoundException{
        
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setInt(1, addreportshop.getShop_id());
                ptm.setInt(2, addreportshop.getCustommer_id());
                ptm.setString(3, addreportshop.getDetail());
              
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

    public boolean checkDeleteReportedShop(String reported_shop_id) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_REPORTED_SHOP);
                ptm.setString(1, reported_shop_id);
                checkDelete = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkDelete;
    }
     
     
}
