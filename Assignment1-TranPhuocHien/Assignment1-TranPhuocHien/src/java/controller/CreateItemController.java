/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ItemDAO;
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
public class CreateItemController extends HttpServlet {

    private final static String SUCCESS = "/portlets/itemCreatePage.jsp";
    private final static String ERROR = "/portlets/error.html";
    private final static Logger log = Logger.getLogger(CreateItemController.class);

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
                if (!user.getRoleID().equals("US")) {
                    String itemID = request.getParameter("itemID");
                    String itemName = request.getParameter("itemName");
                    String quantity = request.getParameter("quantity");
                    String price = request.getParameter("price");
                    String category = request.getParameter("category");
                    String img = request.getParameter("img");
                    String des = request.getParameter("des");
                    int quant = 0;
                    float pri = 0;
                    if (!valid.checkInt(quantity) || "".equals(quantity.trim())) {
                        error.setLine3("this must be number and bigger than 0");
                        check = false;
                    } else {
                        quant = Integer.parseInt(quantity);
                    }
                    if (!valid.checkFloat(price) || "".equals(price.trim())) {
                        error.setLine4("this must be number and bigger than 0");
                        check = false;
                    } else {
                        pri = Float.parseFloat(price);
                    }
                    if (!valid.checkID(itemID)) {
                        error.setLine1("please try other ID");
                        check = false;
                    }
                    if ("".equals(itemID)) {
                        error.setLine1("this can be empty");
                        check = false;
                    }
                    if (!valid.checkString(itemName) || itemName.length() > 50) {
                        error.setLine2("please try other name");
                        check = false;
                    }
                    if ("".equals(itemName)) {
                        error.setLine2("this can be empty");
                        check = false;
                    }
                    if ("".equals(category)) {
                        error.setLine6("this can be empty");
                        check = false;
                    }
                    if (img == null) {
                        error.setLine7("please select a image");
                        check = false;
                    } else {
                        request.setAttribute("IMG", img);
                    }
                    if (!valid.checkString(des) || des.length() > 200) {
                        error.setLine5("no special character");
                        check = false;
                    }
                    if ("".equals(des)) {
                        error.setLine5("this can be empty");
                        check = false;
                    }
                    if (check) {
                        long millis = System.currentTimeMillis();
                        Date createDate = new Date(millis);
                        ItemDAO dao = new ItemDAO();
                        ItemDTO dto = new ItemDTO(itemID, itemName, quant, pri, dao.getIDFromCate(category), img, des, createDate, true);
                        if (dao.getItem(itemID) == null) {
                            if (!dao.newItem(dto)) {
                                error.setLine6("something when wrong");
                            } else {
                                error.setLine6("add success");
                                String update = "New Item Added itemID = " + itemID;
                                dao.recordHistory(update, createDate, user.getUserID(), itemID);
                            }
                        } else {
                            error.setLine1("duplicate ID");
                        }

                    }
                    request.setAttribute("ERROR", error);
                    ItemDAO item = new ItemDAO();
                    List<String> listCate = item.getListCategory();
                    request.setAttribute("LIST_CATEGORY", listCate);
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
