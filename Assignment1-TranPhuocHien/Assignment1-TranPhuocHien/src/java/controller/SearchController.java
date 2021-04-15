/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ItemDAO;
import dto.ErrorDTO;
import dto.ItemDTO;
import dto.SearchDTO;
import dto.UserDTO;
import java.io.IOException;
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
public class SearchController extends HttpServlet {

    private final static String AD = "/portlets/adminSearch.jsp";
    private final static String US = "/portlets/userSearch.jsp";
    private final static String GE = "/portlets/search.jsp";
    private final static String ERROR = "/portlets/error.html";
    private final static Logger log = Logger.getLogger(SearchController.class);

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
        boolean check = true;
        ErrorDTO error = new ErrorDTO("", "", "", "", "", "", "");
        try {

            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            if (user == null) {
                url = GE;
            } else {
                String role = user.getRoleID();
                if (role.equals("AD")) {
                    url = AD;
                } else if (role.equals("US")) {
                    url = US;
                }
            }

            String priceMax = request.getParameter("priceMax");
            String priceMin = request.getParameter("priceMin");
            String category = request.getParameter("category");
            String name = request.getParameter("name");
            String pageNum = request.getParameter("pageNum");
            int page;
            if (pageNum == null) {
                page = 1;
            } else {
                page = Integer.parseInt(pageNum);
            }
            ItemDAO item = new ItemDAO();
            SearchDTO get = item.getMinMax();
            float max = get.getPriceMax();
            float min = get.getPriceMin();
            List<String> listCate = item.getListCategory();
            request.setAttribute("LIST_CATEGORY", listCate);
            if (priceMax != null) {
                if (!valid.checkFloat(priceMax) && !"".equals(priceMax.trim())) {
                    error.setLine1("this must be number and bigger than 0");
                    check = false;
                } else if (valid.checkFloat(priceMax)) {
                    max = Float.parseFloat(priceMax);
                }
            }
            if (priceMin != null) {
                if (!valid.checkFloat(priceMin) && !"".equals(priceMin.trim())) {
                    error.setLine2("this must be number and bigger than 0");
                    check = false;
                } else if (valid.checkFloat(priceMin)) {
                    min = Float.parseFloat(priceMin);
                }
            }
            if (min > max) {
                error.setLine1("maximum price must bigger than minimum price");
                check = false;
            }
            if (check) {
                if (category == null) {
                    category = "";
                }
                if (name == null) {
                    name = "";
                }
                List<ItemDTO> list = null;
                int totalPage = 1;
                SearchDTO dto = new SearchDTO(max, min, category, name);
                if (url.equals(GE) || url.equals(US)) {
                    totalPage = item.getTotalPage(dto);
                    list = item.getListItem(dto, page);
                } else if (url.equals(AD)) {
                    totalPage = item.getTotalPageAdmin(dto);
                    list = item.getListItemAdmin(dto, page);
                }

                if (list != null) {
                    request.setAttribute("LIST", list);
                    request.setAttribute("TOTAL_PAGE", totalPage);
                    request.setAttribute("PAGE_NUM", page);
                } else {
                    error.setLine3("No item match to your request!");
                    request.setAttribute("ERROR", error);
                }
            } else {
                request.setAttribute("ERROR", error);
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
