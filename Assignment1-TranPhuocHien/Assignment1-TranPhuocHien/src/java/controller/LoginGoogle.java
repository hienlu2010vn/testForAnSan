/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.GoogleDTO;
import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import until.GoogleUntil;

/**
 *
 * @author hienl
 */
public class LoginGoogle extends HttpServlet {
    
    private final static String SUCCESS = "/portlets/userHomePage.jsp";
    private final static String ERROR = "/portlets/login.jsp";
    private final static Logger log = Logger.getLogger(LoginGoogle.class);

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
            
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
            } else {
                HttpSession session = request.getSession();
                String accessToken = GoogleUntil.getToken(code);
                GoogleDTO googleDTO = GoogleUntil.getUserInfo(accessToken);
                String[] name = googleDTO.getEmail().split("@");
                String userName = name[0];
                UserDTO user = new UserDTO(googleDTO.getId(), userName, "", "US", googleDTO.getEmail(), "", "", true);
                UserDAO dao = new UserDAO();
                if (!dao.checkLoginGoogle(googleDTO.getId())) {
                    dao.newUserGoogle(user);
                }
                session.setAttribute("LOGIN_USER", user);
                url = SUCCESS;
            }
            
        } catch (Exception e) {
            log.error(e);
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
