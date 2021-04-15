/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.QuestDTO;
import dto.QuizDTO;
import dto.StudentQuizDTO;
import java.io.IOException;
import java.util.HashMap;
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
public class ToTestController extends HttpServlet {

    private final static String SUCCESS = "testPage.jsp";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(ToTestController.class);

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
            String page = request.getParameter("page");
            String questID = request.getParameter("questID");
            String ans = request.getParameter("ans");
            int pageNow;
            if (page != null) {
                pageNow = Integer.parseInt(page);
            } else {
                pageNow = 1;
            }
            request.setAttribute("page", pageNow);
            HttpSession ss = request.getSession();
            QuizDTO quiz = (QuizDTO) ss.getAttribute("QUIZ");
            if (quiz != null) {
                List<QuestDTO> list = quiz.getQuestList();
                QuestDTO quizDetail = list.get(pageNow - 1);
                ss.setAttribute("QUIZ_DETAIL", quizDetail);
            }
            if (ans != null && questID != null) {
                StudentQuizDTO student = (StudentQuizDTO) ss.getAttribute("STUDENT");
                if (student != null) {
                    HashMap<String, String> list;
                    if (student.getAnswer() != null) {
                        list = student.getAnswer();
                        list.put(questID, ans);
                    } else {
                        list = new HashMap<>();
                        list.put(questID, ans);
                    }
                    student.setAnswer(list);
                    ss.setAttribute("STUDENT", student);
                }
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
