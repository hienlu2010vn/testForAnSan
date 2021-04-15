/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author hienl
 */
public class CartDTO {
    
    private int orderID;
    private String userID;
    private float totalPrice;
    private Date orderDate;
    private boolean status;
    private List<DetailDTO> listItem;
    
    public CartDTO(int orderID, String userID, float totalPrice, Date orderDate, boolean status, List<DetailDTO> listItem) {
        this.orderID = orderID;
        this.userID = userID;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.status = status;
        this.listItem = listItem;
    }
    
    public int getOrderID() {
        return orderID;
    }
    
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
    
    public String getUserID() {
        return userID;
    }
    
    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    public float getTotalPrice() {
        return totalPrice;
    }
    
    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public Date getOrderDate() {
        return orderDate;
    }
    
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    
    public boolean isStatus() {
        return status;
    }
    
    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public List<DetailDTO> getListItem() {
        return listItem;
    }
    
    public void setListItem(List<DetailDTO> listItem) {
        this.listItem = listItem;
    }
    
    public CartDTO() {
    }
    

}
