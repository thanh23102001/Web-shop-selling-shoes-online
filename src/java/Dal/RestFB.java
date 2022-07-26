/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dal;

import Models.FacebookAccount;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import com.restfb.types.User;
/**
 *
 * @author ADMIN
 */
public class RestFB {
     public static String getToken(final String code) throws ClientProtocolException, IOException {
    String link = String.format(FacebookAccount.FACEBOOK_LINK_GET_TOKEN, FacebookAccount.FACEBOOK_APP_ID, FacebookAccount.FACEBOOK_APP_SECRET, FacebookAccount.FACEBOOK_REDIRECT_URL, code);
    String response = Request.Get(link).execute().returnContent().asString();
    JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
    String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
    return accessToken;
  }
  
  public static User getUserInfo(String accessToken) {
    FacebookClient facebookClient = new DefaultFacebookClient(accessToken, FacebookAccount.FACEBOOK_APP_SECRET, Version.LATEST);
    return facebookClient.fetchObject("me", User.class);
  }

}
