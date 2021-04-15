/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;
import until.DBUntils;

/**
 *
 * @author hienl
 */
public class UserDAO {

    private final static Logger log = Logger.getLogger(UserDAO.class);

    public String getNameFromID(String userID) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String userName = "";
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT userName FROM tblUser WHERE userID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                userName = rs.getString("userName");
            }
        } catch (SQLException ex) {
            log.error(ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
        }
        return userName;
    }

    public UserDTO checkLogin(String userID, String userPass) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO dto = null;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT userName, roleID, email, phone, address, status FROM tblUser WHERE userID = ? AND userPassword = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, userPass);
            rs = ps.executeQuery();
            if (rs.next()) {
                String userName = rs.getString("userName");
                String roleID = rs.getString("roleID");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");

                boolean status = rs.getBoolean("status");
                dto = new UserDTO(userID, userName, "", roleID, email, phone, address, status);
            }
        } catch (SQLException ex) {
            log.error(ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
        }
        return dto;
    }

    public boolean checkLoginGoogle(String userID) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT userName FROM tblUser WHERE userID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } catch (SQLException ex) {
            log.error(ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
        }
        return check;
    }

    public void newUserGoogle(UserDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUntils.getCon();
            String sql = "INSERT INTO tblUser (userID, userName, roleID, email, status) VALUES (?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getUserID());
            ps.setString(2, dto.getUserName());
            ps.setString(3, dto.getRoleID());
            ps.setString(4, dto.getEmail());
            ps.setBoolean(5, true);
            ps.executeUpdate();
        } catch (SQLException ex) {
            log.error(ex);
        } finally {

            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    log.error(ex);
                }
            }
        }
    }
}
