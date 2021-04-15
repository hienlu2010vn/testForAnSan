/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.QuestDTO;
import dto.SubDTO;
import dto.TestDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
public class QuestDAO {

    private final static Logger LOG = Logger.getLogger(QuestDAO.class);

    public int getTotalQuestToTake(String subjectIn) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalItem = 0;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT COUNT(questID) AS totalItem FROM tblQuestion WHERE subjectID = ? AND status = 1";
            ps = conn.prepareStatement(sql);
            ps.setString(1, subjectIn);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalItem = rs.getInt(1);
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
        return totalItem;
    }

    public int getTotalQuest(String subjectIn, String status, String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int totalItem;
        int totalPage = 1;
        if (status.equals("True")) {
            status = "1";
        } else if (status.equals("False")) {
            status = "0";
        }
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT COUNT(questID) AS totalItem FROM "
                    + "tblQuestion WHERE subjectID LIKE ? AND status LIKE ? AND questContent LIKE ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + subjectIn + "%");
            ps.setString(2, "%" + status + "%");
            ps.setString(3, "%" + name + "%");

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

    public List<QuestDTO> getListQuiz(String subjectIn, int total) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<QuestDTO> list = null;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT TOP (?) questID , questContent, ans1, ans2, ans3, ans4, correctAns "
                    + "FROM tblQuestion WHERE subjectID = ? AND status = 1 ORDER BY NEWID()";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, total);
            ps.setString(2, subjectIn);
            rs = ps.executeQuery();
            while (rs.next()) {
                String questID = rs.getString(1);
                String questContent = rs.getString(2);
                String ans1 = rs.getString(3);
                String ans2 = rs.getString(4);
                String ans3 = rs.getString(5);
                String ans4 = rs.getString(6);
                String ansCorrect = rs.getString(7);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(new QuestDTO(questID, null, "", true, "", questContent, ans1, ans2, ans3, ans4, ansCorrect));
//                updateQuiztime(questID);
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

    public List<QuestDTO> getListQuest(String subjectIn, int pageNum, String status, String name) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<QuestDTO> list = null;
        if (status.equals("True")) {
            status = "1";
        } else if (status.equals("False")) {
            status = "0";
        }
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT  a.questID , q.createDate , email, status, subjectID, questContent, ans1, ans2, ans3, ans4, correctAns\n"
                    + "FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY subjectID ) AS RowNum, questID\n"
                    + "          FROM      tblQuestion \n"
                    + "          WHERE     subjectID LIKE ? AND status LIKE ? AND questContent LIKE ?\n"
                    + "        ) a join tblQuestion q on a.questID = q.questID\n"
                    + "WHERE  RowNum >= (1 + ?) AND RowNum <= (5 + ?)ORDER BY RowNum";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + subjectIn + "%");
            ps.setString(2, "%" + status + "%");
            ps.setString(3, "%" + name + "%");
            ps.setInt(4, 5 * (pageNum - 1));
            ps.setInt(5, 5 * (pageNum - 1));
            rs = ps.executeQuery();
            while (rs.next()) {
                String questID = rs.getString(1);
                String createDate = rs.getString(2);
                String email = rs.getString(3);
                boolean check = rs.getBoolean(4);
                String subject = rs.getString(5);
                String questContent = rs.getString(6);
                String ans1 = rs.getString(7);
                String ans2 = rs.getString(8);
                String ans3 = rs.getString(9);
                String ans4 = rs.getString(10);
                String correctAns = rs.getString(11);
                if (list == null) {
                    list = new ArrayList<>();
                }
                Date date = Date.valueOf(getTRUEDate(createDate));
                list.add(new QuestDTO(questID, date, email, check, subject, questContent, ans1, ans2, ans3, ans4, correctAns));

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

    public SubDTO getSub(String ID) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        SubDTO dto = null;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT subjectID, subjectName, totalQuest, time, status FROM tblSubject WHERE subjectID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                String subjectID = rs.getString(1);
                String subjectName = rs.getString(2);
                int totalQuest = rs.getInt(3);
                int time = rs.getInt(4);
                boolean status = rs.getBoolean(5);
                dto = new SubDTO(subjectID, subjectName, totalQuest, time, status);
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

    public List<SubDTO> getListSub() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<SubDTO> list = null;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT subjectID, subjectName, totalQuest, time, status FROM tblSubject";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String subjectID = rs.getString(1);
                String subjectName = rs.getString(2);
                int totalQuest = rs.getInt(3);
                int time = rs.getInt(4);
                boolean status = rs.getBoolean(5);
                if (list == null) {
                    list = new ArrayList<>();
                }
                list.add(new SubDTO(subjectID, subjectName, totalQuest, time, status));
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

    public QuestDTO getQuest(String ID) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        QuestDTO dto = null;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT createDate, email, status, subjectID, questContent, ans1, ans2, ans3, ans4, correctAns FROM tblQuestion WHERE questID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                String createDate = rs.getString(1);
                String email = rs.getString(2);
                boolean check = rs.getBoolean(3);
                String subject = rs.getString(4);
                String questContent = rs.getString(5);
                String ans1 = rs.getString(6);
                String ans2 = rs.getString(7);
                String ans3 = rs.getString(8);
                String ans4 = rs.getString(9);
                String correctAns = rs.getString(10);
                Date date = Date.valueOf(getTRUEDate(createDate));
                dto = new QuestDTO(ID, date, email, check, subject, questContent, ans1, ans2, ans3, ans4, correctAns);
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

    public void updateQuiztime(String ID) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "UPDATE tblQuestion SET checkTime = ? WHERE questID = ?";
            ps = conn.prepareStatement(sql);
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            ps.setTimestamp(1, timestamp);
            ps.setString(2, ID);
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

    public void deleteQuiztime(String ID) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "UPDATE tblQuestion SET checkTime = ? WHERE questID = ?";
            ps = conn.prepareStatement(sql);
            ps.setTimestamp(1, null);
            ps.setString(2, ID);
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

    public boolean checkQuizTime(String ID) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = true;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT checkTime, subjectID FROM tblQuestion WHERE questID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Timestamp time = rs.getTimestamp(1);
                String subID = rs.getString(2);
                SubDTO sub = getSub(subID);
                if (time != null) {
                    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                    long t = time.getTime();
                    long m = sub.getTime() * 60 * 1000;
                    Timestamp targetDeliveryStamp = new Timestamp(t + m);
                    if (targetDeliveryStamp.compareTo(timestamp) >= 0) {
                        check = false;
                    }
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
        return check;
    }

    public boolean checkQuest(String ID, String quest) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = true;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT questID, questContent FROM tblQuestion";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String questID = rs.getString(1);
                String questContent = rs.getString(2);
                if (questContent.equalsIgnoreCase(quest) && !questID.equals(ID)) {
                    check = false;
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
        return check;
    }

    public boolean checkQuest(String quest) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = true;
        try {
            conn = DBUtil.getCon();
            String sql = "SELECT questContent FROM tblQuestion";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String questContent = rs.getString(1);
                if (questContent.equalsIgnoreCase(quest)) {
                    check = false;
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
        return check;
    }

    public void updateQuest(QuestDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "UPDATE tblQuestion SET questContent = ?, subjectID = ?, ans1 = ?, ans2 = ?, ans3 = ?, ans4 = ?, correctAns = ? WHERE questID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getQuestContent());
            ps.setString(2, dto.getSubject());
            ps.setString(3, dto.getAns1());
            ps.setString(4, dto.getAns2());
            ps.setString(5, dto.getAns3());
            ps.setString(6, dto.getAns4());
            ps.setString(7, dto.getCorrectAns());
            ps.setString(8, dto.getQuestID());
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

    public void updateSub(SubDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "UPDATE tblSubject SET subjectName = ?, totalQuest = ?, time = ? WHERE subjectID = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getSubjectName());
            ps.setInt(2, dto.getTotalQuest());
            ps.setInt(3, dto.getTime());
            ps.setString(4, dto.getSubjectID());
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

    public String createQuest(QuestDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String id = "";
        try {
            conn = DBUtil.getCon();
            String sql = "INSERT INTO tblQuestion (questContent, subjectID, ans1, ans2, ans3, ans4, correctAns, createDate, email, status) VALUES (?,?,?,?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, dto.getQuestContent());
            ps.setString(2, dto.getSubject());
            ps.setString(3, dto.getAns1());
            ps.setString(4, dto.getAns2());
            ps.setString(5, dto.getAns3());
            ps.setString(6, dto.getAns4());
            ps.setString(7, dto.getCorrectAns());
            ps.setDate(8, dto.getCreateDate());
            ps.setString(9, dto.getEmail());
            ps.setBoolean(10, dto.isCheck());
            ps.execute();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getString(1);
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
        return id;
    }

    public void createSub(SubDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "INSERT INTO tblSubject (subjectID, subjectName, totalQuest, time, status) VALUES (?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dto.getSubjectID());
            ps.setString(2, dto.getSubjectName());
            ps.setInt(3, dto.getTotalQuest());
            ps.setInt(4, dto.getTime());
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

    public void savetestDetail(List<QuestDTO> list, String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            for (int i = 0; i < list.size(); i++) {
                QuestDTO dto = getQuest(list.get(i).getQuestID());
                String sql = "INSERT INTO tblTestDetail (testID, questID, correctAns, userAns , questContent, ans1, ans2, ans3, ans4) VALUES (?,?,?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, list.get(i).getQuestID());
                ps.setString(3, list.get(i).getCorrectAns());
                ps.setString(4, list.get(i).getEmail());
                ps.setString(5, dto.getQuestContent());
                ps.setString(6, dto.getAns1());
                ps.setString(7, dto.getAns2());
                ps.setString(8, dto.getAns3());
                ps.setString(9, dto.getAns4());
                ps.executeUpdate();
                deleteQuiztime(list.get(i).getQuestID());
            }
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

    public String saveTest(TestDTO test) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String id = "";
        try {
            conn = DBUtil.getCon();
            String sql = "INSERT INTO tblTest (email, subjectID, totalQuest, totalCorrect, createDate) VALUES (?,?,?,?,?)";
            ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, test.getEmail());
            ps.setString(2, test.getSubject());
            ps.setInt(3, test.getTotalQuest());
            ps.setInt(4, test.getTotalCorrect());
            ps.setDate(5, test.getCreateDate());
            ps.execute();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getString(1);
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
        return id;
    }

    public void deleteQuest(QuestDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "UPDATE tblQuestion SET status = ? WHERE questID = ?";
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, dto.isCheck());
            ps.setString(2, dto.getQuestID());
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

    public void deleteSub(SubDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getCon();
            String sql = "UPDATE tblSubject SET status = ? WHERE subjectID = ?";
            ps = conn.prepareStatement(sql);
            ps.setBoolean(1, dto.isStatus());
            ps.setString(2, dto.getSubjectID());
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
