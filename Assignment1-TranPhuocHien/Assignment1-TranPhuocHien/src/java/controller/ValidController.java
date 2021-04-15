/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author hienl
 */
public class ValidController {

    public boolean checkFloat(String num) {
        try {
            float checkNum;
            checkNum = Float.parseFloat(num);
            if (checkNum <= 0) {
                return false;
            }
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    public boolean checkInt(String num) {
        try {
            int checkNum;
            checkNum = Integer.parseInt(num);
            if (checkNum <= 0) {
                return false;
            }
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    public boolean checkDate(String date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        formatter.setLenient(false);
        try {
            java.util.Date redate = formatter.parse(date);
            java.util.Date thisdate = new java.util.Date();
            return redate.compareTo(thisdate) <= 0;
        } catch (ParseException ex) {
            return false;
        }
    }

    public boolean checkID(String ID) {
        return ID.matches("[a-zA-Z0-9-/_.]{1,10}");
    }

    public boolean checkString(String string) {
        return string.matches("[a-zA-Z0-9@$!%*?&#^-_. +]+");
    }
}
