/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HistoryDAO;
import dao.QuestDAO;
import dto.ErrorDTO;
import dto.QuestDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author hienl
 */
public class AdminUpdateController extends HttpServlet {

    private final static String SUCCESS = "AdminSearchController";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(AdminUpdateController.class);

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ErrorDTO error = new ErrorDTO();
        try {
            String questID = request.getParameter("questID");
            String questContent = request.getParameter("questContent");
            String category2 = request.getParameter("category2");
            String check1 = request.getParameter("check1");
            String ans1 = request.getParameter("ans1");
            String ans2 = request.getParameter("ans2");
            String ans3 = request.getParameter("ans3");
            String ans4 = request.getParameter("ans4");
            String correctAns;
            Controller con = new Controller();
            boolean check = true;
            QuestDAO dao = new QuestDAO();
            if (questContent.length() > 100 || ans1.length() > 100 || ans2.length() > 100
                    || ans3.length() > 100 || ans4.length() > 100) {
                check = false;
                error.setLine1("Length < 100");
            }
            if (!con.checkString(questContent) || !con.checkString(ans1) || !con.checkString(ans2)
                    || !con.checkString(ans3) || !con.checkString(ans4)) {
                check = false;
                error.setLine1("try again");
            }
            if (questContent.trim().equals("") || ans1.trim().equals("") || ans2.trim().equals("")
                    || ans3.trim().equals("") || ans4.trim().equals("") || check1.trim().equals("") || category2.trim().equals("")) {
                check = false;
                error.setLine1("Please fill all blank");
            }

            if (ans1.equalsIgnoreCase(ans2) || ans1.equalsIgnoreCase(ans3) || ans1.equalsIgnoreCase(ans4)
                    || ans2.equalsIgnoreCase(ans3) || ans2.equalsIgnoreCase(ans4) || ans3.equalsIgnoreCase(ans4)) {
                check = false;
                error.setLine2("Answer cant be simular");
            }

            if (check1.equals("ans1")) {
                correctAns = "ans1";
            } else if (check1.equals("ans2")) {
                correctAns = "ans2";
            } else if (check1.equals("ans3")) {
                correctAns = "ans3";
            } else if (check1.equals("ans4")) {
                correctAns = "ans4";
            } else {
                correctAns = "";
            }
            HttpSession ss = request.getSession();
//            QuizDTO quiz = (QuizDTO) ss.getAttribute("QUIZ");
//            if (quiz != null) {
//                List<QuestDTO> list = quiz.getQuestList();
//                for (int i = 0; i < list.size(); i++) {
//                    if (list.get(i).getQuestID().equals(questID)) {
//                        check = false;
//                        error.setLine1("this quest is being taken by student");
//                    }
//                }
//            }
            if (!dao.checkQuizTime(questID)) {
                check = false;
                error.setLine1("this quest is being taken by student");
            }
            if (check) {
                if (!correctAns.trim().equals("")) {
                    boolean check2 = false;
                    QuestDTO dto = dao.getQuest(questID);
                    QuestDTO quest = new QuestDTO(questID, null, "", true, category2, questContent, ans1, ans2, ans3, ans4, correctAns);
                    String update = "questID = " + questID + " have been updated: ";
                    if (!dto.getSubject().equals(quest.getSubject())) {
                        check2 = true;
                        update += "[subjectID from [" + dto.getSubject() + "] to [" + quest.getSubject() + "]] ";
                    }
                    if (!dto.getQuestContent().equals(quest.getQuestContent())) {
                        check2 = true;
                        update += "[questContent from [" + dto.getQuestContent() + "] to [" + quest.getQuestContent() + "]] ";
                    }
                    if (!dto.getAns1().equals(quest.getAns1())) {
                        check2 = true;
                        update += "[ans1 from [" + dto.getAns1() + "] to [" + quest.getAns1() + "]] ";
                    }
                    if (!dto.getAns2().equals(quest.getAns2())) {
                        check2 = true;
                        update += "[ans2 from [" + dto.getAns2() + "] to [" + quest.getAns2() + "]] ";
                    }
                    if (!dto.getAns3().equals(quest.getAns3())) {
                        check2 = true;
                        update += "[getAns3 from [" + dto.getAns3() + "] to [" + quest.getAns3() + "]] ";
                    }
                    if (!dto.getAns4().equals(quest.getAns4())) {
                        check2 = true;
                        update += "[getAns4 from [" + dto.getAns4() + "] to [" + quest.getAns4() + "]] ";
                    }
                    if (!dto.getCorrectAns().equals(quest.getCorrectAns())) {
                        check2 = true;
                        update += "[getCorrectAns from [" + dto.getCorrectAns() + "] to [" + quest.getCorrectAns() + "]] ";
                    }
                    long millis = System.currentTimeMillis();
                    Date updateDate = new Date(millis);
                    UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
                    if (user != null) {
                        HistoryDAO his = new HistoryDAO();
                        if (check2) {
                            his.recordHistory(update, updateDate, user.getEmail(), questID);
                        }
                    }
                    dao.updateQuest(quest);
                }
                error.setLine1("Update success");
            }
            request.setAttribute("ERROR2", error);
            url = SUCCESS;
        } catch (Exception e) {
            LOG.error(e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
