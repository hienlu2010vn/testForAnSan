/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.HashMap;

/**
 *
 * @author hienl
 */
public class StudentQuizDTO {

    private String email;
    private HashMap<String, String> answer;

    public StudentQuizDTO() {
    }

    public StudentQuizDTO(String email, HashMap<String, String> answer) {
        this.email = email;
        this.answer = answer;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public HashMap<String, String> getAnswer() {
        return answer;
    }

    public void setAnswer(HashMap<String, String> answer) {
        this.answer = answer;
    }

}
