/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ItemDAO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.Date;
import java.util.Collections;
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
public class DeleteSelectedController extends HttpServlet {

    private final static String SUCCESS = "SearchController";
    private final static String ERROR = "/portlets/error.html";
    private final static Logger log = Logger.getLogger(DeleteSelectedController.class);

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
            UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
            if (user != null) {
                if (!user.getRoleID().equals("US")) {
                    ItemDAO item = new ItemDAO();
                    long millis = System.currentTimeMillis();
                    Date updateDate = new Date(millis);
                    List<String> itemID = Collections.list(request.getParameterNames());
                    for (int i = 0; i < itemID.size(); i++) {
                        if (!itemID.get(i).equals("itemID") && !itemID.get(i).equals("pageNum") && !itemID.get(i).equals("name") && !itemID.get(i).equals("priceMax")
                                && !itemID.get(i).equals("priceMin") && !itemID.get(i).equals("category") && !itemID.get(i).equals("btnAction")) {
                            String update = "itemID = " + itemID.get(i) + " have been removed";
                            item.recordHistory(update, updateDate, user.getUserID(), itemID.get(i));
                            item.deleteItem(itemID.get(i), false);
                        }
                    }
                    url = SUCCESS;
                }
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
