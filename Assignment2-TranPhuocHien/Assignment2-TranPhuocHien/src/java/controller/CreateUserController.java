/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.ErrorDTO;
import dto.UserDTO;
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
public class CreateUserController extends HttpServlet {

    private final static String SUCCESS = "CreateUserPageController";
    private final static String SUCCESSOK = "LoginPageController";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(CreateUserController.class);

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
            String email = request.getParameter("email");
            String userName = request.getParameter("userName");
            String userPass = request.getParameter("userPass");
            String rePass = request.getParameter("rePass");
            Controller con = new Controller();
            ErrorDTO error = new ErrorDTO("", "", "", "", "", "", "");
            UserDAO dao = new UserDAO();
            boolean check = true;
            if (userName.length() > 30) {
                check = false;
                error.setLine2("max length is 30");
            }
            if (!con.checkString(userName)) {
                check = false;
                error.setLine2("English only");
            }
            if ("".equals(userName.trim())) {
                check = false;
                error.setLine2("userName can't null");
            }
            if (!con.checkEmail(email)) {
                check = false;
                error.setLine1("try other email");
            }
            if ("".equals(email.trim())) {
                check = false;
                error.setLine1("email can't null");
            }
            if (!dao.getNameFromID(email).equals("")) {
                check = false;
                error.setLine1("email have been used");
            }
            if (!con.checkString(userPass)) {
                check = false;
                error.setLine3("try other password");
            }
            if (userPass.length() > 20) {
                check = false;
                error.setLine3("max length is 20");
            }
            if ("".equals(userPass.trim())) {
                check = false;
                error.setLine3("password can't null");
            }
            if ("".equals(rePass.trim())) {
                check = false;
                error.setLine4("re password can't null");
            }
            if (!userPass.equals(rePass)) {
                check = false;
                error.setLine3("re password is not match");
            }
            if (check) {
                String pass = con.getSHA(userPass);
                UserDTO user = new UserDTO(email, userName, pass, "US", true);
                dao.newUser(user);
                error.setLine5("OK");
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
