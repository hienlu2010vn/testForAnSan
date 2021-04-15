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
import util.DBUtil;

/**
 *
 * @author hienl
 */
public class UserDAO {

    private final static Logger LOG = Logger.getLogger(UserDAO.class);

    public String getNameFromID(String email) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String userName = "";
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT userName FROM tblUser WHERE email = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                userName = rs.getString("userName");
            }
        } catch (SQLException ex) {
            LOG.error(ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    LOG.error(ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    LOG.error(ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    LOG.error(ex);
                }
            }
        }
        return userName;
    }

    public UserDTO checkLogin(String email, String userPass) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO dto = null;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT userName, roleID, email, status FROM tblUser WHERE email = ? AND userPassword = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, userPass);
            rs = ps.executeQuery();
            if (rs.next()) {
                String userName = rs.getString("userName");
                String roleID = rs.getString("roleID");
                boolean status = rs.getBoolean("status");
                dto = new UserDTO(email, userName, "", roleID, status);
            }
        } catch (SQLException ex) {
            LOG.error(ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    LOG.error(ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    LOG.error(ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    LOG.error(ex);
                }
            }
        }
        return dto;
    }

    public void newUser(UserDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "INSERT INTO tblUser (email , userName, roleID, userPassword, status) VALUES (?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getEmail());
            ps.setString(2, dto.getUserName());
            ps.setString(3, dto.getRoleID());
            ps.setString(4, dto.getUserPassword());
            ps.setBoolean(5, dto.isStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
            LOG.error(ex);
        } finally {

            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    LOG.error(ex);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    LOG.error(ex);
                }
            }
        }
    }
}
