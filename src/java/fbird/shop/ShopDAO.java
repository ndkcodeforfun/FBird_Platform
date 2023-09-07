/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.shop;

import fbird.user.UserDTO;
import fbird.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author louis
 */
public class ShopDAO {
    private static final String CREATE_SHOP = "insert into shop_owner(username, shop_name, phone, email, address, registed_date, city) values(?, ?, ?, ?, ?, ?, ?)";
    private static final String VIEW_REPORTED_SHOP = "SELECT shop_owner.username, shop_name, detail, customer.fullname, account.status, reported_shop_id FROM reported_shop left join shop_owner on reported_shop.shop_id = shop_owner.shop_id left join customer on reported_shop.customer_id = customer.customer_id left join account on shop_owner.username = account.username";
    private static final String DISABLE_SHOP_ACCOUNT = "UPDATE account SET status = ? WHERE username = ?";
    private static final String VIEW_SHOP_INFORMATION = "UPDATE account SET status = ? WHERE username = ?";
    public void createShop(String username, String shop_name, String phone, String email, String address, Date date, String city) throws SQLException{
        
        Connection conn = null;
        PreparedStatement ptm = null;
        
        try{
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(CREATE_SHOP);
            ptm.setString(1, username);
            ptm.setString(2, shop_name);
            ptm.setString(3, phone);
            ptm.setString(4, email);
            ptm.setString(5, address);
            ptm.setDate(6, (java.sql.Date) date);
            ptm.setString(7, city);
            ptm.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
            
        }finally {
            
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
    
        }
    }
    
    public List<ShopDTO> viewShopReport() throws SQLException {
        List<ShopDTO> listReport = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(VIEW_REPORTED_SHOP);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String shop_name = rs.getString("shop_name");
                String detail = rs.getString("detail");
                String customer_fullname = rs.getString("fullname");
                int status = Integer.parseInt(rs.getString("status"));
                int reported_shop_id = Integer.parseInt(rs.getString("reported_shop_id"));
                listReport.add(new ShopDTO(username, shop_name, detail, customer_fullname, status, reported_shop_id));
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
        return listReport;
    }

    public boolean disableShopAccount(ShopDTO disable) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DISABLE_SHOP_ACCOUNT);
                ptm.setInt(1, disable.getShop_status());
                ptm.setString(2, disable.getUsername());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return check;
    }
}
