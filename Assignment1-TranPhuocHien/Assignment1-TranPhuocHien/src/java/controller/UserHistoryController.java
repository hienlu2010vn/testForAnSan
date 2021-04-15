/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import dto.CartDTO;
import dto.ErrorDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.Date;
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
public class UserHistoryController extends HttpServlet {

    private final static String SUCCESS = "/portlets/shopingHistory.jsp";
    private final static String ERROR = "/portlets/error.html";
    private final static Logger log = Logger.getLogger(UserHistoryController.class);

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
        ErrorDTO error = new ErrorDTO("", "", "", "", "", "", "");
        boolean check = true;
        try {
            ValidController valid = new ValidController();
            HttpSession ss = request.getSession();
            UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
            if (user != null) {
                if (!user.getRoleID().equals("AD")) {
                    String pageNum = request.getParameter("pageNum");
                    String searchDate = request.getParameter("searchDate");
                    int page;
                    if (pageNum == null) {
                        page = 1;
                    } else {
                        page = Integer.parseInt(pageNum);
                    }
                    Date search = null;
                    if (searchDate != null && !"".equals(searchDate)) {
                        if (!valid.checkDate(searchDate) || "".equals(searchDate.trim())) {
                            check = false;
                            error.setLine1("input dat must follow [yyyy-MM-dd] and must be the day in past");
                        } else if (valid.checkDate(searchDate)) {
                            search = Date.valueOf(searchDate);
                        }
                    }
                    if (check) {
                        OrderDAO dao = new OrderDAO();
                        List<CartDTO> list = dao.getListOrder(user.getUserID(), page, search);
                        if (list != null) {
                            int totalPage = 1;
                            totalPage = dao.getTotalOrder(user.getUserID(), search);
                            request.setAttribute("LIST", list);
                            request.setAttribute("TOTAL_PAGE", totalPage);
                            request.setAttribute("PAGE_NUM", page);
                        } else {
                            error.setLine2("No item match to your request!");
                        }
                    }
                    request.setAttribute("ERROR", error);
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
