/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.typeofbird;

import fbird.typeofbird.TypeOfBirdDTO;
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
 * @author Admin
 */
public class TypeOfBirdDAO {

    private static final String CREATE = "INSERT INTO type_of_bird (type_of_bird_name) VALUES (?)";
    private static final String DELETE = "DELETE type_of_bird Where type_of_bird_name = ?";
    private static final String SEARCH = "SELECT type_of_bird_name FROM type_of_bird WHERE type_of_bird_name like ?";
    private static final String GET_TYPE_OF_BIRD = "SELECT * FROM type_of_bird";
    private static final String CHECK_EXIST = "SELECT type_of_bird_name FROM type_of_bird WHERE type_of_bird_name=?";

    public List<TypeOfBirdDTO> searchTypeOfBird(String search) throws SQLException {
        List<TypeOfBirdDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();

                while (rs.next()) {
                    String nameofbird = rs.getString("type_of_bird_name");
                    list.add(new TypeOfBirdDTO(nameofbird));
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

    public void createTypeOfBird(String name) throws SQLException, ClassNotFoundException {

        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, name);

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

    public boolean deleteTypeOfBird(String name) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, name);
                checkDelete = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (ptm != null) {
                conn.close();
            }

        }
        return checkDelete;
    }

    public boolean checkExist(String name) throws SQLException {
        boolean check = false;
        TypeOfBirdDTO tob = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EXIST);
                ptm.setString(1, name);
                rs = ptm.executeQuery();
                if (rs.next()) {

                    check = true;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
        return check;
    }
        public List<TypeOfBirdDTO> getTypeOfBird() throws SQLException {
        List<TypeOfBirdDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TYPE_OF_BIRD);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int typeOfBirdID = rs.getInt("type_of_bird_id");
                    String typeOfBirdName = rs.getString("type_of_bird_name");
                    
                    list.add(new TypeOfBirdDTO(typeOfBirdID, typeOfBirdName));
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
