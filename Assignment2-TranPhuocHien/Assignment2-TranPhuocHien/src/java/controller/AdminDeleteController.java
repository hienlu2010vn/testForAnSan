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
public class AdminDeleteController extends HttpServlet {

    private final static String SUCCESS = "AdminSearchController";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(AdminDeleteController.class);

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
            boolean check = true;
            String questID = request.getParameter("questID");
            QuestDAO dao = new QuestDAO();
            QuestDTO dto = dao.getQuest(questID);
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
                String update = "questID = " + questID + " have been ";
                if (dto.isCheck()) {
                    dto.setCheck(false);
                    dao.deleteQuest(dto);
                    error.setLine1("Delete success");
                    update += "deleted";
                } else {
                    dto.setCheck(true);
                    dao.deleteQuest(dto);
                    error.setLine1("Restore success");
                    update += "restored";
                }
                long millis = System.currentTimeMillis();
                Date updateDate = new Date(millis);
                UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
                if (user != null) {
                    HistoryDAO his = new HistoryDAO();
                    his.recordHistory(update, updateDate, user.getEmail(), questID);
                }
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
