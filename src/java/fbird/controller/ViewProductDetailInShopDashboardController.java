/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fbird.controller;

import fbird.category.CategoryDAO;
import fbird.category.CategoryDTO;
import fbird.product.ProductDAO;
import fbird.product.ProductDTO;
import fbird.typeofbird.TypeOfBirdDAO;
import fbird.typeofbird.TypeOfBirdDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Louis Kien
 */
public class ViewProductDetailInShopDashboardController extends HttpServlet {

    private static final String ERROR = "productDetailForShop.jsp";
    private static final String SUCCESS = "productDetailForShop.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            TypeOfBirdDAO tdao = new TypeOfBirdDAO();
            List<TypeOfBirdDTO> listTypeOfBird = tdao.getTypeOfBird();
            CategoryDAO catedao = new CategoryDAO();
            List<CategoryDTO> listCategory = catedao.getCategory();
            if(listCategory.size()>0 && listTypeOfBird.size()>0){
                request.setAttribute("CATEGORY", listCategory);
                request.setAttribute("TYPE_OF_BIRD", listTypeOfBird);
            }
            int shop_product_item_id = Integer.parseInt(request.getParameter("shop_product_item_id"));
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> detail = dao.getSingleProductDetail(shop_product_item_id);
            if(detail.size() > 0){
                request.setAttribute("PRODUCT_DETAIL",detail);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at ViewProductDetailInShopDashboardController: " + e.toString());
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
