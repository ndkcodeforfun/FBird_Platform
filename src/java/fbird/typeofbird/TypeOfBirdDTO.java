/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.typeofbird;

/**
 *
 * @author Admin
 */
public class TypeOfBirdDTO {
    private int type_of_bird_id;
    private String type_of_bird_name;

    public TypeOfBirdDTO() {
    }

    public TypeOfBirdDTO(int type_of_bird_id, String type_of_bird_name) {
        this.type_of_bird_id = type_of_bird_id;
        this.type_of_bird_name = type_of_bird_name;
    }



    public TypeOfBirdDTO(String type_of_bird_name) {
        this.type_of_bird_name = type_of_bird_name;
    }

    public int getType_of_bird_id() {
        return type_of_bird_id;
    }

    public void setType_of_bird_id(int type_of_bird_id) {
        this.type_of_bird_id = type_of_bird_id;
    }

    public String getType_of_bird_name() {
        return type_of_bird_name;
    }

    public void setType_of_bird_name(String type_of_bird_name) {
        this.type_of_bird_name = type_of_bird_name;
    }

   
    
}
