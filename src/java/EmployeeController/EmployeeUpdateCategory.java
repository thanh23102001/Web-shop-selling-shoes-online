/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EmployeeController;

import Dal.SubCategoryDAO;
import Helpers.UploadFileHelper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "EmployeeUpdateCategory", urlPatterns = {"/EmployeeUpdateCategory"})
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
	maxFileSize = 1024 * 1024 * 50, // 50 MB
	maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class EmployeeUpdateCategory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "C:/Users/huypham/Desktop/FPTU/Major5/SWP391/Branches/main/ShoeStore2/ShoeStore2/web/img/category/";

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
        //request.getRequestDispatcher("/screens-employee/Employee_EditCategory.jsp").forward(request, response);
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
        //processRequest(request, response);
        String subname = request.getParameter("subname");
        String description = request.getParameter("description");
        String stt = request.getParameter("status");
        String subid = request.getParameter("subid");
        String logo = request.getParameter("logo");
        String cateid = request.getParameter("cateId");
        request.setAttribute("subname", subname);
        request.setAttribute("description", description);
        request.setAttribute("status", stt);
        request.setAttribute("subid", subid);
        request.setAttribute("logo", logo);
        request.setAttribute("cateid", cateid);
        request.getRequestDispatcher("/screens-employee/Employee_EditCategory.jsp").forward(request, response);
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
        //processRequest(request, response);
        SubCategoryDAO SDao = new SubCategoryDAO();
        String name = request.getParameter("name");
        String des = request.getParameter("des");
        String status = request.getParameter("stt");
        String id = request.getParameter("id");
        String cateid = request.getParameter("cateId");
        List<String> photos = UploadFileHelper.uploadFile(UPLOAD_DIR, request, "images");
        SDao.updateSubCate(name,  photos.get(0), des, id);
        
        response.sendRedirect("EmployeeManageSubcategory?cateId=" + cateid);
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
