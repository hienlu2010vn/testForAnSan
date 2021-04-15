/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ItemDAO;
import dto.CartDTO;
import dto.ErrorDTO;
import dto.ItemDTO;
import dto.UserDTO;
import java.io.IOException;
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
public class UpdateQuantityController extends HttpServlet {

    private final static String SUCCESS = "/portlets/shoping.jsp";
    private final static String ERROR = "/portlets/error.html";
    private final static Logger log = Logger.getLogger(UpdateQuantityController.class);

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
        ValidController valid = new ValidController();
        ErrorDTO error = new ErrorDTO("", "", "", "", "", "", "");
        boolean check = true;
        try {
            HttpSession ss = request.getSession();
            UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
            if (user != null) {
                if (!user.getRoleID().equals("AD")) {
                    String quantity = request.getParameter("quantity");
                    String itemID = request.getParameter("itemID");
                    int quant = 0;
                    if (!valid.checkFloat(quantity) || "".equals(quantity.trim())) {
                        error.setLine1("this must be number and bigger than 0");
                        check = false;
                    } else {
                        quant = Integer.parseInt(quantity);
                    }
                    //update
                    ItemDAO idao = new ItemDAO();
                    ItemDTO item = idao.getItem(itemID);
                    if (quant > item.getQuantity()) {
                        error.setLine1("your input quantity is bigger than our available quantity");
                        check = false;
                    }
                    //update
                    if (check) {
                        CartDTO cart = (CartDTO) ss.getAttribute("CART");
                        if (cart != null) {
                            for (int i = 0; i < cart.getListItem().size(); i++) {
                                if (cart.getListItem().get(i).getItemID().equals(itemID)) {
                                    cart.getListItem().get(i).setQuantity(quant);
                                }
                            }
                            float total = 0;
                            for (int i = 0; i < cart.getListItem().size(); i++) {
                                total += cart.getListItem().get(i).getPrice() * cart.getListItem().get(i).getQuantity();
                            }
                            total = (float) Math.floor(total * 10) / 10;
                            cart.setTotalPrice(total);
                            ss.setAttribute("CART", cart);
                            url = SUCCESS;
                        }
                    } else {
                        request.setAttribute("ERROR", error);
                        url = SUCCESS;
                    }
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
