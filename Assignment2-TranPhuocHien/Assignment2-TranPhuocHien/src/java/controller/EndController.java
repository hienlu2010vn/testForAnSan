/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestDAO;
import dto.ErrorDTO;
import dto.QuestDTO;
import dto.QuizDTO;
import dto.StudentQuizDTO;
import dto.TestDTO;
import java.io.IOException;
import java.sql.Date;
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
public class EndController extends HttpServlet {

    private final static String SUCCESS = "HomeController";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(EndController.class);

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
            HttpSession ss = request.getSession();
            QuizDTO quiz = (QuizDTO) ss.getAttribute("QUIZ");
            if (quiz != null) {
                List<QuestDTO> list = quiz.getQuestList();
                int total = 0;
                StudentQuizDTO student = (StudentQuizDTO) ss.getAttribute("STUDENT");
                if (student != null) {
                    String email = student.getEmail();
                    HashMap<String, String> ans = student.getAnswer();
                    if (ans != null) {
                        for (int i = 0; i < list.size(); i++) {
                            if (ans.containsKey(list.get(i).getQuestID())) {
                                list.get(i).setEmail(ans.get(list.get(i).getQuestID()));
                                if (ans.get(list.get(i).getQuestID()).equals(list.get(i).getCorrectAns())) {
                                    total++;
                                }
                            }
                        }
                    }
                    String subject = quiz.getSubject();
                    long millis = System.currentTimeMillis();
                    Date createDate = new Date(millis);
                    TestDTO test = new TestDTO("", email, createDate, list.size(), total, subject);
                    QuestDAO dao = new QuestDAO();
                    String id = dao.saveTest(test);
                    dao.savetestDetail(list, id);
                    ss.removeAttribute("STUDENT");
                    ss.removeAttribute("QUIZ");
                    error.setLine1("Result: " + total + "/" + list.size());
                    float size = (float) list.size() / 2;
                    float to = total;
                    if (to < size) {
                        error.setLine2("FAIL");
                    } else {
                        error.setLine2("PASS");
                    }
                    error.setLine3("<a href=\"HistoryDetailController?testID=" + id + "\">Detail</a>");
                    request.setAttribute("ERROR", error);
                    url = SUCCESS;
                }
            }
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
