/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.customer;

import java.util.Date;

/**
 *
 * @author louis
 */
public class CustomerDTO {
    private int customer_id;
    private String username;
    private String fullname;
    private Date date_of_birth;
    private String phone;
    private String avatar;
    private boolean gender;
    private String email;
    private Date registed_date;

    public CustomerDTO() {
    }

    public CustomerDTO(int customer_id, String username, String fullname, Date date_of_birth, String phone, String avatar, boolean gender, String email) {
        this.customer_id = customer_id;
        this.username = username;
        this.fullname = fullname;
        this.date_of_birth = date_of_birth;
        this.phone = phone;
        this.avatar = avatar;
        this.gender = gender;
        this.email = email;
    }

    public CustomerDTO(String username, String phone, String email, Date registed_date) {
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.registed_date = registed_date;
    }

    public CustomerDTO(String username, String fullname) {
        this.username = username;
        this.fullname = fullname;
    }

    public CustomerDTO(String username, String fullname, String email, String avatar) {
        this.username = username;
        this.fullname = fullname;
        this.email = email;
        this.avatar = avatar;
    }

    public CustomerDTO(String username, String fullname, Date date_of_birth, String phone, boolean gender, String email, Date registed_date) {
        this.username = username;
        this.fullname = fullname;
        this.date_of_birth = date_of_birth;
        this.phone = phone;
        this.gender = gender;
        this.email = email;
        this.registed_date = registed_date;
    }

    
    

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getRegisted_date() {
        return registed_date;
    }

    public void setRegisted_date(Date registed_date) {
        this.registed_date = registed_date;
    }

}
