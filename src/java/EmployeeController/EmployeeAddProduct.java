/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EmployeeController;

import Dal.BrandDAO;
import Dal.CategoryDAO;
import Dal.ImageDAO;
import Dal.ProductDAO;
import Dal.ProductDetailsDAO;
import Dal.SubCategoryDAO;
import Helpers.UploadFileHelper;
import Models.Brands;
import Models.Category;
import Models.ProductDetails;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
@WebServlet(name = "EmployeeAddProduct", urlPatterns = {"/EmployeeAddProduct"})
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
	maxFileSize = 1024 * 1024 * 50, // 50 MB
	maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class EmployeeAddProduct extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "C:/Users/huypham/Desktop/FPTU/Major5/SWP391/Branches/main/ShoeStore2/ShoeStore2/web/img/shoes/";

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
        CategoryDAO cDao = new CategoryDAO();
        BrandDAO bDao = new BrandDAO();
        SubCategoryDAO scDao = new SubCategoryDAO();
        ArrayList<Category> categoryList = cDao.getAllCategories();
        ArrayList<Brands> brandList = bDao.getListBrands();
        request.setAttribute("scDao", scDao);
        request.setAttribute("categories", categoryList);
        request.setAttribute("brands", brandList);
        
        request.getRequestDispatcher("/screens-employee/Employee_AddProduct.jsp").forward(request, response);
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
        String pname = request.getParameter("pname");
        String subcate = request.getParameter("subcate");
        String brand = request.getParameter("brand");
        String description = request.getParameter("description");
        String iprice = request.getParameter("iprice");
        String uprice = request.getParameter("uprice");
        ProductDAO pDao = new ProductDAO();
        ImageDAO iDao = new ImageDAO();
        int pid = pDao.addProduct(pname, subcate, brand, description, Double.parseDouble(iprice), Double.parseDouble(uprice));
        Gson gson = new Gson();
        ProductDetailsDAO pdDao = new ProductDetailsDAO();
        ArrayList<ProductDetails> pds = pdDao.getProductDetails(pid);
        JsonArray pdsJson = gson.toJsonTree(pds).getAsJsonArray();
        request.setAttribute("pdsJ", pdsJson);
        List<String> photos = UploadFileHelper.uploadFile(UPLOAD_DIR, request, "images");
        for (String p : photos) {
            if (photos != null) {
                iDao.addImage(pid + "", p);
            }
        }
        
//if(ServletFileUpload.isMultipartContent(request)){
//            try {
//                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
//                for (FileItem item:multiparts){
//                    if(!item.isFormField()){
//                        String name = new File(item.getName()).getName();
//                        item.write(new File(UPLOAD_DIR + File.separator + name));
//                        iDao.addImage(pid + "", name);
//                        }
//                }
//            } catch (Exception e) {
//                
//            }
//        }

        
        response.sendRedirect("EmployeeManageProducts");
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
