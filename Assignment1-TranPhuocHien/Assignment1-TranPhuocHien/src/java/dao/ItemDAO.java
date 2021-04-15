/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.HistoryDTO;
import dto.ItemDTO;
import dto.SearchDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class ItemDAO {

    private final static Logger log = Logger.getLogger(ItemDAO.class);

    public SearchDTO getMinMax() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SearchDTO dto = null;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT MAX(price) AS [maxPrice], MIN(price) as [minPrice]FROM tblItem";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                float maxPrice = rs.getFloat("maxPrice");
                float minPrice = rs.getFloat("minPrice");
                dto = new SearchDTO(maxPrice, minPrice, "", "");
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

    public List<HistoryDTO> getListHistory(String itemID, int pageNum, Date update) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<HistoryDTO> list = null;
        UserDAO user = new UserDAO();
        String up = "";
        if (update != null) {
            up = update.toString();
        }
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT i.historyID, userID, itemID ,updateDate, updateContent FROM ( \n"
                    + "SELECT ROW_NUMBER() OVER ( ORDER BY historyID DESC ) AS RowNum, historyID FROM tblHistory\n"
                    + " WHERE itemID LIKE ? AND updateDate LIKE ?) i JOIN tblHistory h ON i.historyID = h.historyID\n"
                    + " WHERE RowNum >= (1 + ?) AND RowNum <= (9 + ?) ORDER BY RowNum";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + itemID + "%");
            ps.setString(2, "%" + up + "%");
            ps.setInt(3, 9 * (pageNum - 1));
            ps.setInt(4, 9 * (pageNum - 1));
            rs = ps.executeQuery();
            while (rs.next()) {
                String historyID = rs.getString(1);
                String userID = rs.getString(2);
                String itemID2 = rs.getString(3);
                String updateContent = rs.getString(5);
                String updateDate = rs.getString(4);
                if (list == null) {
                    list = new ArrayList<>();
                }
                Date upDateDate = Date.valueOf(getTRUEDate(updateDate));
                list.add(new HistoryDTO(historyID, user.getNameFromID(userID), itemID2, updateContent, upDateDate));
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

    public int getTotalHistory(String itemID, int pageNum, Date update) {
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
            String sql = "SELECT COUNT(historyID) AS totalItem FROM tblHistory\n"
                    + "WHERE itemID LIKE ? AND updateDate LIKE ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + itemID + "%");
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

    public List<ItemDTO> getListItemAdmin(SearchDTO dto, int pageNum) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ItemDTO> list = null;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT itemID, itemName, quantity, c.categoryName, imageLink, description , price, createDate, status FROM ( \n"
                    + "SELECT ROW_NUMBER() OVER ( ORDER BY createDate DESC ) AS RowNum,\n"
                    + "itemID, itemName, quantity, c.categoryName, imageLink, description , price, createDate, status , i.categoryID\n"
                    + "FROM tblItem i JOIN tblCategory c ON i.categoryID = c.categoryID \n"
                    + "WHERE price >= ? AND price <= ? AND c.categoryName LIKE ? AND itemName LIKE ?)i JOIN tblCategory c ON i.categoryID = c.categoryID \n"
                    + "WHERE RowNum >= (1 + ?) AND RowNum <= (9 + ?) ORDER BY RowNum";
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, dto.getPriceMin());
            ps.setDouble(2, dto.getPriceMax());
            ps.setString(3, "%" + dto.getCategory() + "%");
            ps.setString(4, "%" + dto.getName() + "%");
            ps.setInt(5, 9 * (pageNum - 1));
            ps.setInt(6, 9 * (pageNum - 1));
            rs = ps.executeQuery();
            while (rs.next()) {
                String itemID = rs.getString(1);
                String itemName = rs.getString(2);
                int quantity = rs.getInt(3);
                String category = rs.getString(4);
                String img = rs.getString(5);
                String des = rs.getString(6);
                float price = rs.getFloat(7);
                String date = rs.getString(8);
                boolean status = rs.getBoolean(9);
                if (list == null) {
                    list = new ArrayList<>();
                }
                Date createDate = Date.valueOf(getTRUEDate(date));
                list.add(new ItemDTO(itemID, itemName, quantity, price, category, img, des, createDate, status));
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

    public List<ItemDTO> getListItem(SearchDTO dto, int pageNum) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ItemDTO> list = null;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT itemID, itemName, quantity, c.categoryName, imageLink, description , price, createDate FROM ( \n"
                    + "SELECT ROW_NUMBER() OVER ( ORDER BY createDate DESC ) AS RowNum,\n"
                    + "itemID, itemName, quantity, c.categoryName, imageLink, description , price, createDate, i.categoryID\n"
                    + "FROM tblItem i JOIN tblCategory c ON i.categoryID = c.categoryID \n"
                    + "WHERE price >= ? AND price <= ? AND c.categoryName LIKE ? AND itemName LIKE ? AND status = 'true' AND quantity > 0)i JOIN tblCategory c ON i.categoryID = c.categoryID \n"
                    + "WHERE RowNum >= (1 + ?) AND RowNum <= (9 + ?) ORDER BY RowNum";
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, dto.getPriceMin());
            ps.setDouble(2, dto.getPriceMax());
            ps.setString(3, "%" + dto.getCategory() + "%");
            ps.setString(4, "%" + dto.getName() + "%");
            ps.setInt(5, 9 * (pageNum - 1));
            ps.setInt(6, 9 * (pageNum - 1));
            rs = ps.executeQuery();
            while (rs.next()) {
                String itemID = rs.getString(1);
                String itemName = rs.getString(2);
                int quantity = rs.getInt(3);
                String category = rs.getString(4);
                String img = rs.getString(5);
                String des = rs.getString(6);
                float price = rs.getFloat(7);
                String date = rs.getString(8);
                if (list == null) {
                    list = new ArrayList<>();
                }
                Date createDate = Date.valueOf(getTRUEDate(date));
                list.add(new ItemDTO(itemID, itemName, quantity, price, category, img, des, createDate, true));
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

    public void updateItem(ItemDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUntils.getCon();
            String sql = "UPDATE tblItem SET itemName = ?, categoryID = ?, quantity = ?, price = ?, description = ?, imageLink = ?, status = ? WHERE itemID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getItemName());
            ps.setString(2, dto.getCategory());
            ps.setInt(3, dto.getQuantity());
            ps.setFloat(4, dto.getPrice());
            ps.setString(5, dto.getDes());
            ps.setString(6, dto.getImg());
            ps.setBoolean(7, dto.isStatus());
            ps.setString(8, dto.getItemID());
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

    public void deleteItem(String itemID, boolean status) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUntils.getCon();
            String sql = "UPDATE tblItem SET status = ? WHERE itemID = ?";
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setString(2, itemID);
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

    public int getTotalPageAdmin(SearchDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalItem;
        int totalPage = 1;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT COUNT(itemID) AS totalItem\n"
                    + "FROM tblItem i JOIN tblCategory c ON i.categoryID = c.categoryID \n"
                    + "WHERE price >= ? AND price <= ? AND c.categoryName LIKE ? AND itemName LIKE ?";
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, dto.getPriceMin());
            ps.setDouble(2, dto.getPriceMax());
            ps.setString(3, "%" + dto.getCategory() + "%");
            ps.setString(4, "%" + dto.getName() + "%");
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

    public int getTotalPage(SearchDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalItem;
        int totalPage = 1;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT COUNT(itemID) AS totalItem\n"
                    + "FROM tblItem i JOIN tblCategory c ON i.categoryID = c.categoryID \n"
                    + "WHERE price >= ? AND price <= ? AND status = 'true' \n"
                    + "AND c.categoryName LIKE ? AND quantity > 0 AND itemName LIKE ?";
            ps = conn.prepareStatement(sql);
            ps.setDouble(1, dto.getPriceMin());
            ps.setDouble(2, dto.getPriceMax());
            ps.setString(3, "%" + dto.getCategory() + "%");
            ps.setString(4, "%" + dto.getName() + "%");
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

    public List<String> getListCategory() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<String> list = null;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT categoryName FROM tblCategory";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String category = rs.getString(1);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(category);
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

    public String getIDFromCate(String cate) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String cateID = "";
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT categoryID FROM tblCategory WHERE categoryName = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, cate);
            rs = ps.executeQuery();
            if (rs.next()) {
                cateID = rs.getString(1);
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
        return cateID;
    }

    public ItemDTO getItem(String itemID) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ItemDTO dto = null;
        try {
            conn = DBUntils.getCon();
            String sql = "SELECT itemName, quantity, c.categoryName, imageLink, description , price, createDate, status "
                    + "FROM tblItem i JOIN tblCategory c ON i.categoryID = c.categoryID WHERE itemID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, itemID);
            rs = ps.executeQuery();
            if (rs.next()) {
                String itemName = rs.getString(1);
                int quantity = rs.getInt(2);
                String category = rs.getString(3);
                String img = rs.getString(4);
                String des = rs.getString(5);
                float price = rs.getFloat(6);
                String date = rs.getString(7);
                boolean status = rs.getBoolean(8);
                Date createDate = Date.valueOf(getTRUEDate(date));
                dto = new ItemDTO(itemID, itemName, quantity, price, category, img, des, createDate, status);
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

    public boolean newItem(ItemDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUntils.getCon();
            String sql = "INSERT INTO tblItem (itemID, itemName, quantity, categoryID, imageLink, description, price, status, createDate) VALUES(?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getItemID());
            ps.setString(2, dto.getItemName());
            ps.setInt(3, dto.getQuantity());
            ps.setString(4, dto.getCategory());
            ps.setString(5, dto.getImg());
            ps.setString(6, dto.getDes());
            ps.setFloat(7, dto.getPrice());
            ps.setBoolean(8, true);
            ps.setDate(9, dto.getCreateDate());
            ps.executeUpdate();
            check = true;
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

    public void recordHistory(String update, Date updateDate, String userID, String itemID) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUntils.getCon();
            String sql = "INSERT INTO tblHistory (userID, itemID, updateDate, updateContent) VALUES(?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, itemID);
            ps.setDate(3, updateDate);
            ps.setString(4, update);
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
