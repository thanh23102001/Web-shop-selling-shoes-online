/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author ADMIN
 */
public class FacebookAccount {
  public static String FACEBOOK_APP_ID = "693294385112739";
  public static String FACEBOOK_APP_SECRET = "37e44c18b4aac318a458912e70daca5d";
  public static String FACEBOOK_REDIRECT_URL = "http://localhost:8080/ShoeStore2/FacebookLogin";
  public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
}
