/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ItemDAO;
import dao.OrderDAO;
import dto.CartDTO;
import dto.DetailDTO;
import dto.ErrorDTO;
import dto.ItemDTO;
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
public class ConfirmOrderController extends HttpServlet {

    private final static String SUCCESS = "/portlets/shoping.jsp";
    private final static String ERROR = "/portlets/error.html";
//    private final static String INPUT_INFO = "/portlets/input.html";

    private final static Logger log = Logger.getLogger(ConfirmOrderController.class);

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
            HttpSession ss = request.getSession();
            UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
            ItemDAO idao = new ItemDAO();
            if (user != null) {
                if (!user.getRoleID().equals("AD")) {
//                    if (user.getAddress().equals("") || user.getPhone().equals("") || user.getAddress() == null || user.getPhone() == null) {
//                        url = INPUT_INFO;
//                    } else {
                        CartDTO cart = (CartDTO) ss.getAttribute("CART");
                        if (cart == null) {
                            error.setLine1("your cart is empty");
                            request.setAttribute("ERROR", error);
                            url = SUCCESS;
                        } else {
                            List<DetailDTO> list = cart.getListItem();
                            String er = "Item dont have enough quantity: ";
                            for (int i = 0; i < list.size(); i++) {
                                ItemDTO item = idao.getItem(list.get(i).getItemID());
                                int quan = item.getQuantity();
                                if (quan >= list.get(i).getQuantity()) {
                                    item.setQuantity(quan - list.get(i).getQuantity());
                                } else {
                                    check = false;
                                    er += "[" + list.get(i).getItemName() + "] ";
                                    error.setLine1(er);
                                }
                            }
                            if (check) {
                                for (int i = 0; i < list.size(); i++) {
                                    ItemDTO item = idao.getItem(list.get(i).getItemID());
                                    int quan = item.getQuantity();
                                    item.setQuantity(quan - list.get(i).getQuantity());
                                    item.setCategory(idao.getIDFromCate(item.getCategory()));
                                    idao.updateItem(item);
                                }
                                long millis = System.currentTimeMillis();
                                Date orderDate = new Date(millis);
                                cart.setOrderDate(orderDate);
                                OrderDAO dao = new OrderDAO();
                                int orderID = dao.createOrder(cart);
                                if (orderID > 0) {
                                    dao.createOrderDetail(list, orderID);
                                    ss.setAttribute("CART", null);
                                    error.setLine1("Order Success");
                                    request.setAttribute("ERROR", error);
                                    url = SUCCESS;
                                }
                            } else {
                                request.setAttribute("ERROR", error);
                                url = SUCCESS;
                            }
                        }
//                    }
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
