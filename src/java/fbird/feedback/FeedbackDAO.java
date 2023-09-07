/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.feedback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import fbird.utils.DBUtils;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class FeedbackDAO {
    private static final String VIEW = "SELECT  avatar, number_of_stars, status, fullname, feedback_date, feedback.feedback FROM feedback join customer on customer.customer_id = feedback.customer_id WHERE shop_product_item_id = ?";
    private static final String ADD = "INSERT INTO feedback(customer_id, shop_product_item_id, feedback, status, number_of_stars, feedback_date) VALUES(?,?,?,?,?,?)";
    private static final String VIEW_ALL_FEEDBACK_OF_SHOP = "SELECT feedback.feedback FROM feedback JOIN shop_product_item ON feedback.shop_product_item_id = shop_product_item.shop_product_item_id WHERE shop_product_item.shop_id = ?";
    
    public List<FeedbackDTO> getFeedback(int shop_product_item_id) throws SQLException {
        List<FeedbackDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW);
                ptm.setInt(1, shop_product_item_id );
                rs = ptm.executeQuery();
//                while(rs.next()){
//                    list.add(new UserDto(rs.getString("userID"), rs.getString("fullName"), rs.getString("roleID"), "***"));   
//                }

                while (rs.next()) {
                   
                    
                    String avatar = rs.getString("avatar");
                    String fullname = rs.getString("fullname");
                    String feedback = rs.getString("feedback");
                  
                    int number_of_stars = rs.getInt("number_of_stars");
                    Boolean status = rs.getBoolean("status");
                    Date feedback_date =rs.getDate("feedback_date");
                    
                    list.add(new FeedbackDTO( feedback,  status,  number_of_stars,  feedback_date,  avatar,  fullname));
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
    public void addFeedback(FeedbackDTO addfeedback) throws SQLException, ClassNotFoundException{
        
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setInt(1, addfeedback.getCustomer_id());
                ptm.setInt(2, addfeedback.getShop_product_item_id());
                ptm.setString(3, addfeedback.getFeedback());
                ptm.setBoolean(4, addfeedback.getStatus());
                ptm.setInt(5, addfeedback.getNumber_of_stars());
                ptm.setDate(6, (java.sql.Date) addfeedback.getFeedback_date());
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
     public List<FeedbackDTO> getAllFeedback(int shop_id) throws SQLException {
        List<FeedbackDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_ALL_FEEDBACK_OF_SHOP);
                ptm.setInt(1, shop_id);
                rs = ptm.executeQuery();
//                while(rs.next()){
//                    list.add(new UserDto(rs.getString("userID"), rs.getString("fullName"), rs.getString("roleID"), "***"));   
//                }

                while (rs.next()) {
                   
                    
                
                    String feedback = rs.getString("feedback");
                  
                    
                    list.add(new FeedbackDTO(feedback));
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
}
