/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.QuestDAO;
import dto.ErrorDTO;
import dto.QuestDTO;
import dto.SubDTO;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author hienl
 */
public class AdminSearchController extends HttpServlet {

    private final static String SUCCESS = "adminSearch.jsp";
    private final static String ERROR = "ErrorController";
    private final static Logger LOG = Logger.getLogger(AdminSearchController.class);

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
        ErrorDTO error = new ErrorDTO();
        try {
            String category = request.getParameter("category");
            String name = request.getParameter("name");
            String pageNum = request.getParameter("pageNum");
            String check = request.getParameter("check");
            String gogo = request.getParameter("gogo");
            int page;
            if (pageNum == null) {
                page = 1;
            } else {
                page = Integer.parseInt(pageNum);
            }
            QuestDAO quest = new QuestDAO();
            List<SubDTO> listSub = quest.getListSub();
            request.setAttribute("LIST_CATEGORY", listSub);

            if (category == null) {
                category = "";
            }
            if (name == null) {
                name = "";
            }
            if (check == null) {
                check = "";
            }
            List<QuestDTO> list;
            int totalPage;
            if (gogo != null) {
                switch (gogo) {
                    case "go1":
                        category = "";
                        check = "";
                        break;
                    case "go2":
                        category = "";
                        name = "";
                        break;
                    case "go3":
                        name = "";
                        check = "";
                        break;
                    default:
                        break;
                }
            }
            totalPage = quest.getTotalQuest(category, check, name);
            if (page > totalPage) {
                page = totalPage;
            }
            list = quest.getListQuest(category, page, check, name);
            if (list != null) {
                Map<String, String> mapwa = new HashMap<>();
                for (int i = 0; i < list.size(); i++) {
                    SubDTO sub = quest.getSub(list.get(i).getSubject());
                    mapwa.put(sub.getSubjectID(), sub.getSubjectName());
                }
                request.setAttribute("WAWAWA", mapwa);
                request.setAttribute("LIST", list);
                request.setAttribute("TOTAL_PAGE", totalPage);
                request.setAttribute("PAGE_NUM", page);
            } else {
                error.setLine3("No question match to your request!");
                request.setAttribute("ERROR", error);
            }
            request.setAttribute("ERROR", error);
            url = SUCCESS;
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
