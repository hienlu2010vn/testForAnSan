/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package until;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.GoogleDTO;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author hienl
 */
public class GoogleUntil {

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post("https://accounts.google.com/o/oauth2/token")
                .bodyForm(Form.form().add("client_id", "709128724769-2o9qiq38ra99icafg7h3qupuav7fpqas.apps.googleusercontent.com")
                        .add("client_secret", "PzX1FkPs3y2ZmGfcxBxsFR61")
                        .add("redirect_uri", "http://localhost:8080/Assignment1-TranPhuocHien/LoginGoogle").add("code", code)
                        .add("grant_type", "authorization_code").build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleDTO getUserInfo(String accessToken) throws ClientProtocolException, IOException {
        String link = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleDTO dto = new Gson().fromJson(response, GoogleDTO.class);
        return dto;
    }
}
