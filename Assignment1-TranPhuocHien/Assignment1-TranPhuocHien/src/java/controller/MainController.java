/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
public class MainController extends HttpServlet {

    private final static Logger log = Logger.getLogger(MainController.class);

    //any
    private final static String ERROR = "/portlets/error.html";
    private final static String LOGIN_PAGE = "/portlets/login.jsp";
    private final static String LOGIN = "LoginController";
    private final static String LOGOUT = "LogoutController";
    private final static String SEARCH = "SearchController";
    private final static String HOME = "HomeController";
    private final static String ITEM_DETAIL = "ItemDetailController";

    //admin
    private final static String CREATE_ITEM_PAGE = "CreateItemPageController";
    private final static String CREATE_ITEM = "CreateItemController";
    private final static String UPDATE_ADMIN = "UpdateItemController";
    private final static String DELETE_ADMIN = "DeleteItemController";
    private final static String HISTORY_ADMIN = "AdminHistoryController";
    private final static String DELETE_ADMIN2 = "DeleteSelectedController";

    //user
    private final static String ORDER_ITEM = "OrderController";
    private final static String DELETE_ORDER_ITEM = "DeleteOrderController";
    private final static String CONFIRM_ORDER = "ConfirmOrderController";
    private final static String UPDATE_ORDER = "UpdateQuantityController";
    private final static String VIEW_CART = "ViewOrderController";
    private final static String HISTORY_USER = "UserHistoryController";
    private final static String DETAIL_ORDER = "UserHistoryDetailController";

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
            String action = request.getParameter("btnAction");
            if ("LoginPage".equals(action)) {
                url = LOGIN_PAGE;
            } else if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Logout".equals(action)) {
                url = LOGOUT;
            } else if ("Search".equals(action)) {
                url = SEARCH;
            } else if ("OrderItem".equals(action)) {
                url = ORDER_ITEM;
            } else if ("DeleteOrderItem".equals(action)) {
                url = DELETE_ORDER_ITEM;
            } else if ("ConfirmOrder".equals(action)) {
                url = CONFIRM_ORDER;
            } else if ("UpdateOrder".equals(action)) {
                url = UPDATE_ORDER;
            } else if ("CreateItem".equals(action)) {
                url = CREATE_ITEM;
            } else if ("CreateItemPage".equals(action)) {
                url = CREATE_ITEM_PAGE;
            } else if ("HomePage".equals(action)) {
                url = HOME;
            } else if ("ViewOrder".equals(action)) {
                url = VIEW_CART;
            } else if ("Detail".equals(action)) {
                url = ITEM_DETAIL;
            } else if ("UpdateAdmin".equals(action)) {
                url = UPDATE_ADMIN;
            } else if ("DeleteAdmin".equals(action)) {
                url = DELETE_ADMIN;
            } else if ("HistoryUpdate".equals(action)) {
                url = HISTORY_ADMIN;
            } else if ("ShoppingHistory".equals(action)) {
                url = HISTORY_USER;
            } else if ("DetailOrder".equals(action)) {
                url = DETAIL_ORDER;
            } else if ("DeleteAdmin2".equals(action)) {
                url = DELETE_ADMIN2;
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
