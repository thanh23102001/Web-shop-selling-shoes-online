/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminController;

import Dal.BrandDAO;
import Dal.ProductDAO;
import Dal.ProductDetailsDAO;
import Dal.SubCategoryDAO;
import Models.Product;
import Models.ProductDTO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.apache.commons.lang3.math.NumberUtils.toInt;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "AdminViewProducts", urlPatterns = {"/AdminViewProducts"})
public class AdminViewProducts extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        ProductDAO pDao = new ProductDAO();
        List<Product> productsList = pDao.getListProducts();
                request.setAttribute("brands", pDao.getBrand());
        request.setAttribute("categories", pDao.getSubCategory());
        request.setAttribute("ls", productsList);
        request.getRequestDispatcher("/screens-admin/Admin_ViewProducts.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if (action != null) {
//            int id = Integer.parseInt(request.getParameter("id"));
//            fetchDetails(request, response, id);
//            return;
//        }
//        ProductDAO dao = new ProductDAO();
//        ProductDTO res = dao.getListProductsPaging(null, null, 10, 1);
//        request.setAttribute("brands", dao.getBrand());
//        request.setAttribute("categories", dao.getCategory());
//        request.setAttribute("ls", res.data);
//        request.setAttribute("current", 1);
//        request.setAttribute("pageNum", res.total);
        processRequest(request, response);
    }

//    private void fetchDetails(HttpServletRequest request, HttpServletResponse response, int id) throws IOException {
//        ProductDAO dao = new ProductDAO();
//
//        Gson gson = new Gson();
//        String result = gson.toJson(dao.getProductDetail(id));
//        PrintWriter out = response.getWriter();
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        out.print(result);
//        out.flush();
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        Integer page = toInt(request.getParameter("page"));
//        if (page == null) {
//            page = 1;
//        }
//
        ProductDAO pDao = new ProductDAO();
        
//

//        request.setAttribute("brands", dao.getBrand());
//        request.setAttribute("categories", dao.getCategory());
        
//        if(request.getParameter("cate")==null || request.getParameter("brand")==null){
//            request.setAttribute("ls", pDao.getListProducts());
//        } else {
            String cate = request.getParameter("cate");
            String brand = request.getParameter("brand");
            
            List<Product> res = pDao.getListProducts(cate, brand);
            request.setAttribute("ls", res);
//        }
        
//        request.setAttribute("current", page);
//        request.setAttribute("pageNum", res.total);
        request.setAttribute("brands", pDao.getBrand());
        request.setAttribute("categories", pDao.getSubCategory());
        request.setAttribute("scate", cate);
        request.setAttribute("sbrand", brand);
        
        request.getRequestDispatcher("/screens-admin/Admin_ViewProducts.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

//    private Integer toInt(String a) {
//        if (a == "" || a == null) {
//            return null;
//        }
//        try {
//            return Integer.parseInt(a);
//        } catch (Exception e) {
//        }
//        return null;
//    }
}
