/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import org.apache.log4j.Logger;

/**
 *
 * @author hienl
 */
public class Controller {

    private final static Logger LOG = Logger.getLogger(Controller.class);

    public String getSHA(String input) {
        String output = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(input.getBytes(StandardCharsets.UTF_8));
            BigInteger number = new BigInteger(1, hash);
            StringBuilder hexString = new StringBuilder(number.toString(16));
            while (hexString.length() < 32) {
                hexString.insert(0, '0');
            }
            output = hexString.toString();
        } catch (NoSuchAlgorithmException ex) {
            LOG.error(ex);
        }
        return output;
    }

    public boolean checkEmail(String email) {
        return email.matches("[a-z][a-zA-Z0-9_.]{5,32}@[a-z0-9]{2,}(.[a-z0-9]{2,4}){1,2}");
    }

    public boolean checkID(String ID) {
        return ID.matches("[a-zA-Z0-9-/_.]{1,10}");
    }

    public boolean checkString(String in) {
        return in.matches("[a-zA-Z0-9@$!%*?&#^-_. +]+");
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
}
