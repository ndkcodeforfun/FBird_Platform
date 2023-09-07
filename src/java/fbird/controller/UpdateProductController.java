/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fbird.controller;

import fbird.optionalshopproductitem.OptionalshopproductitemDAO;
import fbird.optionalshopproductitem.OptionalshopproductitemDTO;
import fbird.product.ProductDAO;
import fbird.product.ProductDTO;
import fbird.user.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author tuan3
 */
@WebServlet(name = "UpdateProductController", urlPatterns = {"/UpdateProductController"})
public class UpdateProductController extends HttpServlet {

    private static final String ERROR = "tatCaSanPham.jsp";
    private static final String SUCCESS = "ViewProductDetailInShopDashboardController?shop_product_item_id=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int productShopItemID = Integer.parseInt(request.getParameter("shopProductItemID"));
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            int shopID = loginUser.getShop_id();
            String productName = request.getParameter("productName");
            //int inventory = Integer.parseInt(request.getParameter("inventory"));
            int typeOfBirdID = Integer.parseInt(request.getParameter("typeOfBird"));
            int typeProductID = Integer.parseInt(request.getParameter("typeProduct"));
//            priceProduct = request.getParameter("priceOfProduct");
            String description = request.getParameter("description");
            byte status = 1;

            Date date = new Date();
            ProductDAO dao = new ProductDAO();
            ProductDTO product = new ProductDTO(productShopItemID, shopID, typeProductID, typeOfBirdID, productName, description, date, status);
            boolean checkUpdate = dao.checkUpdate(product);
            if (checkUpdate) {
                OptionalshopproductitemDAO optionalDao = new OptionalshopproductitemDAO();
                List<OptionalshopproductitemDTO> listOptional = new ArrayList<>();
                double priceOption1;
                double priceOption2;
                double priceOption3;
                double priceOption4;
                double priceOption5;
                String option1 = request.getParameter("option1");
                if (option1 != null) {
                    int optional_id_1 = Integer.parseInt(request.getParameter("optional_id1"));
                    String price1 = request.getParameter("priceOption1");
                    int inventory1 = Integer.parseInt(request.getParameter("inventory1"));

                    if (!option1.equals("") && !price1.equals("")) {
                        priceOption1 = Double.parseDouble(price1);
                        listOptional.add(new OptionalshopproductitemDTO(productShopItemID, optional_id_1, option1, priceOption1, inventory1));
                    }
                }
                String option2 = request.getParameter("option2");
                if (option2 != null) {
                    int optional_id_2 = Integer.parseInt(request.getParameter("optional_id2"));
                    String price2 = request.getParameter("priceOption2");
                    int inventory2 = Integer.parseInt(request.getParameter("inventory2"));

                    if (!option2.equals("") && !price2.equals("")) {
                        priceOption2 = Double.parseDouble(price2);
                        listOptional.add(new OptionalshopproductitemDTO(productShopItemID,optional_id_2, option2, priceOption2, inventory2));
                    }
                }
                String option3 = request.getParameter("option3");
                if (option3 != null) {
                    int optional_id_3 = Integer.parseInt(request.getParameter("optional_id3"));
                    String price3 = request.getParameter("priceOption3");
                    int inventory3 = Integer.parseInt(request.getParameter("inventory3"));

                    if (!option3.equals("") && !price3.equals("")) {
                        priceOption3 = Double.parseDouble(price3);
                        listOptional.add(new OptionalshopproductitemDTO(productShopItemID,optional_id_3, option3, priceOption3, inventory3));
                    }
                }
                String option4 = request.getParameter("option4");
                if (option4 != null) {
                    int optional_id_4 = Integer.parseInt(request.getParameter("optional_id4"));
                    String price4 = request.getParameter("priceOption4");
                    int inventory4 = Integer.parseInt(request.getParameter("inventory4"));

                    if (!option4.equals("") && !price4.equals("")) {
                        priceOption4 = Double.parseDouble(price4);
                        listOptional.add(new OptionalshopproductitemDTO(productShopItemID,optional_id_4, option4, priceOption4, inventory4));
                    }
                }
                String option5 = request.getParameter("option5");
                if (option5 != null) {
                    int optional_id_5 = Integer.parseInt(request.getParameter("optional_id5"));
                    String price5 = request.getParameter("priceOption5");
                    int inventory5 = Integer.parseInt(request.getParameter("inventory5"));

                    if (!option5.equals("") && !price5.equals("")) {
                        priceOption5 = Double.parseDouble(price5);
                        listOptional.add(new OptionalshopproductitemDTO(productShopItemID,optional_id_5, option5, priceOption5, inventory5));
                    }
                }
                boolean checkOptional = optionalDao.updateOptional(listOptional);
                if (checkOptional == true) {
                    request.setAttribute("msg", "Cập nhật thành công");

                    url = SUCCESS + productShopItemID;
                }else{
                    request.setAttribute("msg", "Cập nhật thất bại");

                    url = SUCCESS + productShopItemID;
                }
            }
        } catch (Exception e) {
            log("Error at UpdateProductController :" + e.toString());
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
