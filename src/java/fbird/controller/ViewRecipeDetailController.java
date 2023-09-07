/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fbird.controller;


import fbird.feedback.FeedbackDAO;
import fbird.feedback.FeedbackDTO;
import fbird.product.ProductDAO;
import fbird.product.ProductDTO;
import fbird.recipe.RecipeDAO;
import fbird.recipe.RecipeDTO;
import fbird.shop.ShopDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


/**
 *
 * @author tuan3
 */
public class ViewRecipeDetailController extends HttpServlet {
    
    private static final String ERROR = "recipeDetail.jsp";
    private static final String SUCCESS = "recipeDetail.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            int recipeID = Integer.parseInt(request.getParameter("recipeID"));
            ProductDAO daoproduct = new ProductDAO();              
            FeedbackDAO daofeedback = new FeedbackDAO();
            RecipeDAO dao = new RecipeDAO();
            List<RecipeDTO> rec = dao.getRecipeDetail(recipeID);
            ShopDTO shopRecipe = dao.getShopRecipe(recipeID);
            List<RecipeDTO> listRecipeProduct = dao.getRecipeProduct(recipeID);
//             List<FeedbackDTO> AllFeedback = daofeedback.getAllFeedback(shop_id);
            List<ProductDTO> AllProduct = daoproduct.getProductHomePage();
            if(!rec.isEmpty()){
                url = SUCCESS;
                request.setAttribute("SHOP_RECIPE", shopRecipe);
                request.setAttribute("RECIPE_DETAIL", rec);
                request.setAttribute("RECIPE_PRODUCT", listRecipeProduct);
//                request.setAttribute("LIST_ShopProductItemId", ShopProductItemId);
//                request.setAttribute("LIST_AllFeedback", AllFeedback);
                request.setAttribute("LIST_PRODUCT", AllProduct);
            }
        }catch(Exception e){
            log("Error at ViewRecipeDetailController:" + e.toString());
        }finally{
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
