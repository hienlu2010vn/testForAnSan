/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ItemDAO;
import dto.CartDTO;
import dto.DetailDTO;
import dto.ErrorDTO;
import dto.ItemDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
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
public class OrderController extends HttpServlet {

    private final static String DETAIL = "ItemDetailController";
    private final static String SUCCESS = "SearchController";
    private final static String ERROR = "/portlets/error.html";
    private final static Logger log = Logger.getLogger(OrderController.class);

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
            String itemID = request.getParameter("itemID");
            String pageNum = request.getParameter("pageNum");
            ItemDAO dao = new ItemDAO();
            ItemDTO dto = dao.getItem(itemID);
            DetailDTO item = new DetailDTO(itemID, dto.getItemName(), 1, dto.getPrice());
            UserDTO user = (UserDTO) ss.getAttribute("LOGIN_USER");
            if (user != null) {
                if (!user.getRoleID().equals("AD")) {
                    //update
                    ItemDAO idao = new ItemDAO();
                    ItemDTO items = idao.getItem(itemID);
                    if (items.getQuantity() <= 0) {
                        ErrorDTO error = new ErrorDTO();
                        error.setLine1("this item is out of stock");
                        request.setAttribute("ERROR3", error);
                        //update
                    } else {
                        CartDTO cart = (CartDTO) ss.getAttribute("CART");
                        if (cart == null) {
                            cart = new CartDTO();
                            List<DetailDTO> list = new ArrayList<>();
                            list.add(item);
                            cart.setUserID(user.getUserID());
                            cart.setListItem(list);
                            float total = 0;
                            for (int i = 0; i < cart.getListItem().size(); i++) {
                                total += cart.getListItem().get(i).getPrice() * cart.getListItem().get(i).getQuantity();
                            }
                            total = (float) Math.floor(total * 10) / 10;
                            cart.setTotalPrice(total);
                            ss.setAttribute("CART", cart);
                        } else {
                            boolean check = true;
                            boolean check2 = true;
                            List<DetailDTO> list = cart.getListItem();
                            for (int i = 0; i < list.size(); i++) {
                                if (list.get(i).getItemID().equals(item.getItemID())) {
                                    //update
                                    if (list.get(i).getQuantity() + 1 > items.getQuantity()) {
                                        ErrorDTO error = new ErrorDTO();
                                        error.setLine1("this item is out of stock");
                                        request.setAttribute("ERROR3", error);
                                        check2 = false;
                                    } else {
                                        list.get(i).setQuantity(list.get(i).getQuantity() + 1);
                                        check = false;
                                    }
                                    //update
                                }
                            }
                            if (check2) {
                                if (check) {
                                    list.add(item);
                                }
                                float total = 0;
                                for (int i = 0; i < cart.getListItem().size(); i++) {
                                    total += cart.getListItem().get(i).getPrice() * cart.getListItem().get(i).getQuantity();
                                }
                                total = (float) Math.floor(total * 10) / 10;
                                cart.setTotalPrice(total);
                                cart.setListItem(list);
                                ss.setAttribute("CART", cart);
                            }
                        }
                    }
                    if (pageNum.equals("0")) {
                        url = DETAIL;
                    } else {
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
