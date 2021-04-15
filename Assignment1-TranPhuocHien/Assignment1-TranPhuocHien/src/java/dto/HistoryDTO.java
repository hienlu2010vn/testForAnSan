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
    private String userID;
    private String itemID;
    private String updateContent;
    private Date updateDate;

    public HistoryDTO(String historyID, String userID, String itemID, String updateContent, Date updateDate) {
        this.historyID = historyID;
        this.userID = userID;
        this.itemID = itemID;
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

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
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
