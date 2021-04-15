/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.HistoryDTO;
import dto.QuestDTO;
import dto.TestDTO;
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
import util.DBUtil;

/**
 *
 * @author hienl
 */
public class HistoryDAO {

    private final static Logger LOG = Logger.getLogger(HistoryDAO.class);

    public void recordHistory(String update, Date updateDate, String userID, String itemID) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "INSERT INTO tblHistory (email, questionID, updateDate, updateContent) VALUES(?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, itemID);
            ps.setDate(3, updateDate);
            ps.setString(4, update);
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
            conn = DBUtil.getCon();
            String sql = "SELECT COUNT(historyID) AS totalItem FROM tblHistory\n"
                    + "WHERE questionID LIKE ? AND updateDate LIKE ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + itemID + "%");
            ps.setString(2, "%" + up + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalItem = rs.getInt(1);
                if (totalItem <= 5) {
                    totalPage = 1;
                } else if (totalItem > 5 && totalItem % 5 == 0) {
                    totalPage = totalItem / 5;
                } else {
                    totalPage = totalItem / 5 + 1;
                }
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
        return totalPage;
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
            conn = DBUtil.getCon();
            String sql = "SELECT i.historyID, email, questionID ,updateDate, updateContent FROM ( \n"
                    + "SELECT ROW_NUMBER() OVER ( ORDER BY historyID DESC ) AS RowNum, historyID FROM tblHistory\n"
                    + " WHERE questionID LIKE ? AND updateDate LIKE ?) i JOIN tblHistory h ON i.historyID = h.historyID\n"
                    + " WHERE RowNum >= (1 + ?) AND RowNum <= (5 + ?) ORDER BY RowNum";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + itemID + "%");
            ps.setString(2, "%" + up + "%");
            ps.setInt(3, 5 * (pageNum - 1));
            ps.setInt(4, 5 * (pageNum - 1));
            rs = ps.executeQuery();
            while (rs.next()) {
                String historyID = rs.getString(1);
                String email = rs.getString(2);
                String questID = rs.getString(3);
                String updateContent = rs.getString(5);
                String updateDate = rs.getString(4);
                if (list == null) {
                    list = new ArrayList<>();
                }
                Date upDateDate = Date.valueOf(getTRUEDate(updateDate));
                list.add(new HistoryDTO(historyID, user.getNameFromID(email), questID, updateContent, upDateDate));
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
        return list;
    }

    public List<QuestDTO> getListTestDetail(String Id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<QuestDTO> list = null;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT questID, correctAns, userAns, questContent, ans1, ans2, ans3, ans4 FROM tblTestDetail WHERE testID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, Id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String questID = rs.getString(1);
                String correctAns = rs.getString(2);
                String userAns = rs.getString(3);
                String questContent = rs.getString(4);
                String ans1 = rs.getString(5);
                String ans2 = rs.getString(6);
                String ans3 = rs.getString(7);
                String ans4 = rs.getString(8);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(new QuestDTO(questID, null, "", true, userAns, questContent, ans1, ans2, ans3, ans4, correctAns));
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
        return list;
    }

    public List<TestDTO> getListTest(String subjectIn, int pageNum, String email, String check) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<TestDTO> list = null;
        String check22 = "";
        if (check.equals("pass")) {
            check22 = "AND ((totalCorrect*100 / totalQuest*100)/100 >= 50)";
        } else if (check.equals("fail")) {
            check22 = "AND ((totalCorrect*100 / totalQuest*100)/100 < 50)";
        }
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT  a.testID , t.email, t.createDate, t.totalQuest, t.totalCorrect, t.subjectID\n"
                    + "FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY testID DESC) AS RowNum, testID \n"
                    + "			FROM      tblTest  WHERE email = ? AND subjectID LIKE ? " + check22 + " \n"
                    + "              ) a JOIN tblTest t ON a.testID = t.testID\n"
                    + "WHERE  RowNum >= (1 + ?) AND RowNum <= (5 + ?)ORDER BY RowNum";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, "%" + subjectIn + "%");
            ps.setInt(3, 5 * (pageNum - 1));
            ps.setInt(4, 5 * (pageNum - 1));
            rs = ps.executeQuery();
            while (rs.next()) {
                String testID = rs.getString(1);
                String emailOut = rs.getString(2);
                String createDate = rs.getString(3);
                int totalQuest = rs.getInt(4);
                int totalCorrect = rs.getInt(5);
                String subjectID = rs.getString(6);
                Date date = Date.valueOf(getTRUEDate(createDate));
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(new TestDTO(testID, emailOut, date, totalQuest, totalCorrect, subjectID));

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
        return list;
    }

    public int getTotalPageHistory(String subjectIn, int pageNum, String email, String check) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalItem;
        int totalPage = 1;
        String check22 = "";
        if (check.equals("pass")) {
            check22 = "AND ((totalCorrect*100 / totalQuest*100)/100 >= 50)";
        } else if (check.equals("fail")) {
            check22 = "AND ((totalCorrect*100 / totalQuest*100)/100 < 50)";
        }
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT COUNT(testID) AS totalItem  FROM tblTest WHERE email = ? AND subjectID LIKE ? " + check22;
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, "%" + subjectIn + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalItem = rs.getInt(1);
                if (totalItem <= 5) {
                    totalPage = 1;
                } else if (totalItem > 5 && totalItem % 5 == 0) {
                    totalPage = totalItem / 5;
                } else {
                    totalPage = totalItem / 5 + 1;
                }
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
        return totalPage;
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
            LOG.error(ex);
        }
        return dates;
    }
}
