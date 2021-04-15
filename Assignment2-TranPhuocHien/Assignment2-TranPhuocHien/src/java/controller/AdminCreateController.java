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
public class AdminCreateController extends HttpServlet {

    private final static String SUCCESSOK = "AdminSearchController";
    private final static String SUCCESS = "AdminCreatePageController";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(AdminCreateController.class);

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
            String email = request.getParameter("email");
            String questContent = request.getParameter("questContent");
            String category3 = request.getParameter("category3");
            String check2 = request.getParameter("check2");
            String ans1 = request.getParameter("ans1");
            String ans2 = request.getParameter("ans2");
            String ans3 = request.getParameter("ans3");
            String ans4 = request.getParameter("ans4");
            if (check2 == null) {
                check2 = "";
            }
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
//            if (!dao.checkQuest(questContent)) {
//                check = false;
//                error.setLine3("Duplicate question");
//            }
            if (questContent.trim().equals("") || ans1.trim().equals("") || ans2.trim().equals("")
                    || ans3.trim().equals("") || ans4.trim().equals("") || check2.trim().equals("") || category3.trim().equals("")) {
                check = false;
                error.setLine1("Please fill all blank");
            }

            if (ans1.equalsIgnoreCase(ans2) || ans1.equalsIgnoreCase(ans3) || ans1.equalsIgnoreCase(ans4)
                    || ans2.equalsIgnoreCase(ans3) || ans2.equalsIgnoreCase(ans4) || ans3.equalsIgnoreCase(ans4)) {
                check = false;
                error.setLine2("Answer cant be simular");
            }
            if (check2.equals("ans1")) {
                correctAns = "ans1";
            } else if (check2.equals("ans2")) {
                correctAns = "ans2";
            } else if (check2.equals("ans3")) {
                correctAns = "ans3";
            } else if (check2.equals("ans4")) {
                correctAns = "ans4";
            } else {
                correctAns = "";
            }
            if (check) {
                if (!correctAns.trim().equals("")) {
                    long millis = System.currentTimeMillis();
                    Date createDate = new Date(millis);
                    QuestDTO quest = new QuestDTO("", createDate, email, true, category3, questContent, ans1, ans2, ans3, ans4, correctAns);
                    String id = dao.createQuest(quest);
                    String update = "this questID = " + id + " have been created ";
                    HttpSession ss = request.getSession();
                    UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
                    if (user != null) {
                        HistoryDAO his = new HistoryDAO();
                        his.recordHistory(update, createDate, user.getEmail(), id);
                    }
                }
                error.setLine1("Create success");
                request.setAttribute("ERROR3", error);
                url = SUCCESSOK;

            } else {
                request.setAttribute("ERROR", error);
                url = SUCCESS;
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
