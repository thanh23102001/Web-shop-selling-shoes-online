/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerControllers;

import Dal.BrandDAO;
import Dal.CategoryDAO;
import Dal.ProductDAO;
import Dal.ProductDetailsDAO;
import Models.ProductFilter;
import Models.ProductList;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vietd
 */
@WebServlet(name = "Shop", urlPatterns = {"/Shop"})
public class Shop extends HttpServlet {
    
    protected ProductFilter processRequestFilter(HttpServletRequest request) {
        ProductFilter filter = new ProductFilter();
        String brandId = request.getParameter("brandId");
        String subcategoryId = request.getParameter("subcategoryId");
        String sortBy = request.getParameter("sortBy");
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        String view = request.getParameter("view");
        String page = request.getParameter("page");
        if (view != null) {
            filter.setRecordPerPage(Integer.parseInt(view));
        }
        if (color != null) {
            filter.setColor(color);
        }
        if (size != null) {
            filter.setSize(size);
        }
        if (page != null) {
            filter.setCurrentPage(Integer.parseInt(page));
        }
        if (subcategoryId != null) {
            filter.setSubcategoryId(subcategoryId);
        }
        if (brandId != null) {
            filter.setBrandId(brandId);
        }
        StringBuilder sb = new StringBuilder();
        int numOfAttribute = 0;
        if (color != null) {
            numOfAttribute += 1;
            sb.append(color).append(",");
        }
        if (size != null) {
            numOfAttribute += 1;
            sb.append(size).append(",");
        }
        // check if last and first character is comma
        if (sb.length() > 0) {
            if (sb.charAt(sb.length() - 1) == ',') {
                sb.deleteCharAt(sb.length() - 1);
            }
        }
        if (sortBy != null) {
            if (sortBy.equals("oldest")) {
                filter.setIsAsc(true);
            }
            if (sortBy.equals("priceAsc") || sortBy.equals("priceDesc")) {
                filter.setSortBy("price");
                if (sortBy.equals("priceAsc")) {
                    filter.setIsAsc(true);
                }
            }
        }
        filter.setSpecifiedAttribute(sb.toString());
        filter.setNumOfAttributeFitler(numOfAttribute);
        return filter;
    }

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
        ProductFilter productFilter = processRequestFilter(request);
        ProductList productList = new ProductDAO().getProductListByFilter(productFilter);
        productFilter.setTotalRecord(productList.getCountProduct());
        System.out.println(productList.getProducts().size());
        request.setAttribute("productList", productList);
        request.setAttribute("categories", new CategoryDAO().getAllCategories());
        request.setAttribute("brands", new BrandDAO().getListBrands());
        request.setAttribute("productFilter", productFilter);
        request.setAttribute("sizes", new ProductDetailsDAO().getTypes("size"));
        request.getRequestDispatcher("/Customer-Screen/Shop.jsp").forward(request, response);
        
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
