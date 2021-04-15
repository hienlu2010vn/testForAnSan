/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;
import java.util.List;

/**
 *
 * @author hienl
 */
public class QuizDTO {

    private String subject;
    private Date startTime;
    private Date endTime;
    private List<QuestDTO> questList;

    public QuizDTO() {
    }

    public QuizDTO(String subject, Date startTime, Date endTime, List<QuestDTO> questList) {
        this.subject = subject;
        this.startTime = startTime;
        this.endTime = endTime;
        this.questList = questList;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public List<QuestDTO> getQuestList() {
        return questList;
    }

    public void setQuestList(List<QuestDTO> questList) {
        this.questList = questList;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

}
