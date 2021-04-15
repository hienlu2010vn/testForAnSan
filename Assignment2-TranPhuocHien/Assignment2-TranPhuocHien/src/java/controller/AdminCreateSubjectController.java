/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestDAO;
import dto.ErrorDTO;
import dto.SubDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author hienl
 */
public class AdminCreateSubjectController extends HttpServlet {

    private final static String SUCCESS = "SubjectCreatePageController";
    private final static String SUCCESSOK = "SubjectController";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(AdminCreateSubjectController.class);

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
            Controller con = new Controller();
            QuestDAO dao = new QuestDAO();
            String subjectID = request.getParameter("subjectID");
            String subjectName = request.getParameter("subjectName");
            String totalQuest = request.getParameter("totalQuest");
            String time = request.getParameter("time");
            int total = 0;
            int ti = 0;
            if (subjectID.length() > 10) {
                check = false;
                error.setLine1("ID Length < 10");
            }
            if (!con.checkID(subjectID)) {
                check = false;
                error.setLine1("try other ID again");
            }
            if (dao.getSub(subjectID) != null) {
                check = false;
                error.setLine1("Duplicate ID");
            }
            if (subjectName.length() > 50) {
                check = false;
                error.setLine2("Name Length < 50");
            }
            if (!con.checkString(subjectName)) {
                check = false;
                error.setLine2("try other Name");
            }
            if (!con.checkInt(totalQuest) || "".equals(totalQuest.trim())) {
                error.setLine3("total must be number and bigger than 0");
                check = false;
            } else {
                total = Integer.parseInt(totalQuest);
            }
            if (!con.checkInt(time) || "".equals(time.trim())) {
                error.setLine4("time must be number and bigger than 0");
                check = false;
            } else {
                ti = Integer.parseInt(time);
            }
            if (check) {
                SubDTO dto = new SubDTO(subjectID, subjectName, total, ti, true);
                dao.createSub(dto);
                error.setLine1("create success");
                url = SUCCESSOK;
            } else {
                url = SUCCESS;
            }
            request.setAttribute("ERROR", error);
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
