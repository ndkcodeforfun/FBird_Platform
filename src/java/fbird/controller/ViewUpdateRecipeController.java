/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fbird.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import fbird.optionalshopproductitem.OptionalshopproductitemDAO;
import fbird.optionalshopproductitem.OptionalshopproductitemDTO;
import fbird.recipe.RecipeDAO;
import fbird.recipe.RecipeDTO;
import java.util.List;
import fbird.typeofbird.TypeOfBirdDAO;
import fbird.typeofbird.TypeOfBirdDTO;



/**
 *
 * @author Admin
 */
public class ViewUpdateRecipeController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "updateRecipe.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            int shop_id = Integer.parseInt(request.getParameter("shop_id"));
            int recipeID = Integer.parseInt(request.getParameter("recipe_id"));
            OptionalshopproductitemDAO dao = new OptionalshopproductitemDAO();
            TypeOfBirdDAO daoType = new TypeOfBirdDAO();
            RecipeDAO recipeDao = new RecipeDAO();
            List<OptionalshopproductitemDTO> list = dao.getListOptionalAdd(shop_id);
            List<TypeOfBirdDTO> listType = daoType.getTypeOfBird();
            List<RecipeDTO> listRecipe = recipeDao.getRecipeShop(recipeID);
            if(!list.isEmpty()){
                url = SUCCESS;
                request.setAttribute("LIST_OPTIONAL", list);
                request.setAttribute("LIST_TYPE", listType);
                request.setAttribute("LIST_RECIPE", listRecipe);
                request.setAttribute("recipe_id", recipeID);
                
            }
        }catch(Exception e){
            log("Error at ViewRecipeController : " + e.toString());
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
