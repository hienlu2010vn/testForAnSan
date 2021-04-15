/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author hienl
 */
public class SubDTO {

    private String subjectID;
    private String subjectName;
    private int totalQuest;
    private int time;
    private boolean status;

    public SubDTO() {
    }

    public SubDTO(String subjectID, String subjectName, int totalQuest, int time, boolean status) {
        this.subjectID = subjectID;
        this.subjectName = subjectName;
        this.totalQuest = totalQuest;
        this.time = time;
        this.status = status;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getTotalQuest() {
        return totalQuest;
    }

    public void setTotalQuest(int totalQuest) {
        this.totalQuest = totalQuest;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
}
