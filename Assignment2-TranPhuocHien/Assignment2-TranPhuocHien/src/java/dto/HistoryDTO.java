/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author hienl
 */
public class HistoryDTO {

    private String historyID;
    private String email;
    private String questID;
    private String updateContent;
    private Date updateDate;

    public HistoryDTO(String historyID, String email, String questID, String updateContent, Date updateDate) {
        this.historyID = historyID;
        this.email = email;
        this.questID = questID;
        this.updateContent = updateContent;
        this.updateDate = updateDate;
    }

    public HistoryDTO() {
    }

    public String getHistoryID() {
        return historyID;
    }

    public void setHistoryID(String historyID) {
        this.historyID = historyID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQuestID() {
        return questID;
    }

    public void setQuestID(String questID) {
        this.questID = questID;
    }

    public String getUpdateContent() {
        return updateContent;
    }

    public void setUpdateContent(String updateContent) {
        this.updateContent = updateContent;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
