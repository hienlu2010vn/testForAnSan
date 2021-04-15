/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CartDTO;
import dto.DetailDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.apache.log4j.Logger;
import until.DBUntils;

/**
 *
 * @author hienl
 */
public class OrderDAO {

    private final static Logger log = Logger.getLogger(OrderDAO.class);

    public int createOrder(CartDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = 0;
        try {
            conn = DBUntils.getCon();
            String sql = "INSERT INTO tblOrder (userID, totalPrice, orderDate, status) VALUES(?,?,?,?)";
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, dto.getUserID());
            ps.setFloat(2, dto.getTotalPrice());
            ps.setDate(3, dto.getOrderDate());
            ps.setBoolean(4, true);
            ps.execute();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
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
        return id;
    }

    public int getTotalOrder(String userID, Date update) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalItem;
        int totalPage = 1;
        String up = "";
        if (update != null) {
            up = update.toString();
        }
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT COUNT(orderID) AS totalItem \n"
                    + "FROM tblOrder WHERE userID = ? AND orderDate LIKE ? AND status = 'true'";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, "%" + up + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalItem = rs.getInt(1);
                if (totalItem <= 9) {
                    totalPage = 1;
                } else if (totalItem > 9 && totalItem % 9 == 0) {
                    totalPage = totalItem / 9;
                } else {
                    totalPage = totalItem / 9 + 1;
                }
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
        return totalPage;
    }

    public void createOrderDetail(List<DetailDTO> list, int orderID) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUntils.getCon();
            for (int i = 0; i < list.size(); i++) {
                String sql = "INSERT INTO tblOrderDetail (orderID, itemID, quantity, price) VALUES(?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, orderID);
                ps.setString(2, list.get(i).getItemID());
                ps.setInt(3, list.get(i).getQuantity());
                ps.setDouble(4, list.get(i).getPrice());
                ps.executeUpdate();
            }
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

    public List<DetailDTO> getListOrderDetail(String orederID) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<DetailDTO> list = null;

        try {
            conn = DBUntils.getCon();
            String sql = "SELECT d.itemID , i.itemName , d.quantity ,d.price FROM tblOrderDetail d JOIN tblItem i ON i.itemID = d.itemID WHERE orderID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, orederID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String itemID = rs.getString(1);
                String itemName = rs.getString(2);
                int quantity = rs.getInt(3);
                float price = rs.getFloat(4);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(new DetailDTO(itemID, itemName, quantity, price));
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
        return list;
    }

    public List<CartDTO> getListOrder(String userID, int pageNum, Date update) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<CartDTO> list = null;
        String up = "";
        if (update != null) {
            up = update.toString();
        }
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT o.orderID, userID, totalPrice, orderDate, status FROM ( \n"
                    + "SELECT ROW_NUMBER() OVER ( ORDER BY orderID DESC ) AS RowNum, \n"
                    + "orderID FROM tblOrder WHERE userID = ? AND orderDate LIKE ? AND status = 'true') "
                    + "i JOIN tblOrder o ON i.orderID = o.orderID \n"
                    + "WHERE RowNum >= (1 + ?) AND RowNum <= (9 + ?) ORDER BY RowNum";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, "%" + up + "%");
            ps.setInt(3, 9 * (pageNum - 1));
            ps.setInt(4, 9 * (pageNum - 1));
            rs = ps.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt(1);
                float totalPrice = rs.getFloat(3);
                String updateDate = rs.getString(4);
                if (list == null) {
                    list = new ArrayList<>();
                }
                Date date = Date.valueOf(getTRUEDate(updateDate));
                list.add(new CartDTO(orderID, userID, totalPrice, date, true, null));
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
        return list;
    }

    private String getTRUEDate(String date) {
        String dates = null;
        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date redate = df.parse(date);
            Calendar cal = Calendar.getInstance();
            cal.setTime(redate);
            cal.add(Calendar.DATE, 2);
            dates = df.format(cal.getTime());
        } catch (ParseException ex) {
            log.error(ex);
        }
        return dates;
    }
}
