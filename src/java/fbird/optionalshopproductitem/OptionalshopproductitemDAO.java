/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.optionalshopproductitem;

import fbird.optionalshopproductitem.OptionalshopproductitemDTO;
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
public class OptionalshopproductitemDAO {
      private static final String GET_OPTIONAL = "SELECT name, price, inventory, optional_shop_product_item_id FROM optional_shop_product_item WHERE shop_product_item_id=?";
      private static final String GET_PRICE = "SELECT price FROM optional_shop_product_item WHERE name=?";
      private static final String ADD_OPTIONAL = "INSERT INTO optional_shop_product_item(shop_product_item_id, name, price, inventory) VALUES (?,?,?,?)";
      private static final String UPDATE_OPTIONAL = "UPDATE optional_shop_product_item SET name=?, price=?, inventory=? WHERE shop_product_item_id=? AND optional_shop_product_item_id=?";
      private static final String GET_OPTIONAL_ADD = "select shop_product_item.title, name, optional_shop_product_item.price, optional_shop_product_item_id From optional_shop_product_item JOIN shop_product_item on shop_product_item.shop_product_item_id = optional_shop_product_item.shop_product_item_id where shop_product_item.shop_id=?";
      
      public List<OptionalshopproductitemDTO> getListOptional(int shop_product_item_id) throws SQLException {
        List<OptionalshopproductitemDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_OPTIONAL);
                ptm.setInt(1, shop_product_item_id);
                rs = ptm.executeQuery();
                while(rs.next()){
                    int optional_shop_product_item_id = rs.getInt("optional_shop_product_item_id");
                    String name = rs.getString("name");
                    Double price = rs.getDouble("price");
                    int inventory = rs.getInt("inventory");
                    list.add(new OptionalshopproductitemDTO(optional_shop_product_item_id, name, price, inventory));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
            if(rs!=null) rs.close();
        }
        return list;
    }
       public List<OptionalshopproductitemDTO> getPrice(String name) throws SQLException {
        List<OptionalshopproductitemDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_PRICE);
                ptm.setString(1, name);
                rs = ptm.executeQuery();
                while(rs.next()){
                 
                    
                    Double price = rs.getDouble("price");
                    list.add(new OptionalshopproductitemDTO(price));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
            if(rs!=null) rs.close();
        }
        return list;
    }
       
    public boolean addOptionalProductItem(List<OptionalshopproductitemDTO> listOptional) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                for(OptionalshopproductitemDTO option : listOptional){
                ptm = conn.prepareStatement(ADD_OPTIONAL);
                ptm.setInt(1, option.getShop_product_item_id());
                ptm.setString(2, option.getName());
                ptm.setDouble(3, option.getPrice());
                ptm.setInt(4, option.getInventory());
                check = ptm.executeUpdate()>0?true:false;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }

    public boolean updateOptional(List<OptionalshopproductitemDTO> listOptional) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn != null){
                for(OptionalshopproductitemDTO option : listOptional){
                ptm = conn.prepareStatement(UPDATE_OPTIONAL);
                ptm.setInt(4, option.getShop_product_item_id());
                ptm.setString(1, option.getName());
                ptm.setDouble(2, option.getPrice());
                ptm.setInt(3, option.getInventory());
                ptm.setInt(5, option.getOptional_shop_product_item_id());
                check = ptm.executeUpdate()>0?true:false;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm != null) ptm.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    public List<OptionalshopproductitemDTO> getListOptionalAdd(int shop_id) throws SQLException {
        List<OptionalshopproductitemDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_OPTIONAL_ADD);
                ptm.setInt(1, shop_id);
                rs = ptm.executeQuery();
                while(rs.next()){
                  
                    String name = rs.getString("name");
                    String title = rs.getString("title");
                    double price = rs.getDouble("price");
                    int optionalShopProductItemID = rs.getInt("optional_shop_product_item_id");
                    
                   
                    list.add(new OptionalshopproductitemDTO(optionalShopProductItemID, name, price, title));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(conn!=null) conn.close();
            if(ptm!=null) ptm.close();
            if(rs!=null) rs.close();
        }
        return list;
    }
}
