/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.google_authentication;

/**
 *
 * @author Louis Kien
 */
public class Constants {
    public static String GOOGLE_CLIENT_ID = "1030788107110-b5qdutua61r96002p0r24f7jeo1det9c.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8084/FBird/LoginGoogleController";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
