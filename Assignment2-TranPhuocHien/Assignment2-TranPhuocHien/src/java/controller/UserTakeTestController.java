/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestDAO;
import dto.QuestDTO;
import dto.QuizDTO;
import dto.StudentQuizDTO;
import dto.SubDTO;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
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
public class UserTakeTestController extends HttpServlet {

    private final static String SUCCESS = "ToTestController";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(UserTakeTestController.class);

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
        try {
            HttpSession ss = request.getSession();
            QuizDTO quiz1 = (QuizDTO) ss.getAttribute("QUIZ");
            if (quiz1 == null) {
                QuestDAO quest = new QuestDAO();
                String subject = request.getParameter("category3");
                String email = request.getParameter("email");
                SubDTO dto = quest.getSub(subject);
                int total = dto.getTotalQuest();
                int time = dto.getTime();
                QuizDTO quiz = new QuizDTO();
                List<QuestDTO> list = quest.getListQuiz(subject, total);
                Calendar now = Calendar.getInstance();
                quiz.setStartTime(now.getTime());
                now.add(Calendar.MINUTE, time);
                quiz.setEndTime(now.getTime());
                quiz.setQuestList(list);
                quiz.setSubject(subject);
                StudentQuizDTO student = new StudentQuizDTO(email, null);
                ss.setAttribute("QUIZ", quiz);
                ss.setAttribute("TOTAL_PAGE", total);
                ss.setAttribute("STUDENT", student);
            }
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
