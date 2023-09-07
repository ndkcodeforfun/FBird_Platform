/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.user;

/**
 *
 * @author louis
 */
public class UserDTO {
    private String username, password;
    private int role, status;
    private int shop_id;
    private int customer_id;
    private String fullname, avatar;

    public UserDTO() {
    }

    public UserDTO(String username, String password, int role, int status) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.status = status;
    }
    
    public UserDTO(String username, int role, int status) {
        this.username = username;
        this.role = role;
        this.status = status;
    }

    public UserDTO(String username, String password, int role, int status, int shop_id, String shop_name) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.status = status;
        this.shop_id = shop_id;
        this.fullname = shop_name;
    }

    public UserDTO(String username, String password, int role, int status, int customer_id, String fullname, String avatar) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.status = status;
        this.customer_id = customer_id;
        this.fullname = fullname;
        this.avatar = avatar;
    }
    
    
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    
}
