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

/**
 *
 * @author louis
 */
public class MainController extends HttpServlet {

    public static final String WELCOME_PAGE = "ViewProductHomePageController";

    public static final String VIEW_PRICE = "viewPrice";
    public static final String VIEW_PRICE_CONTROLLER = "ViewPriceController";

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String VIEW_REPORTED_PRODUCT = "ViewReportedProduct";
    private static final String VIEW_REPORTED_PRODUCT_CONTROLLER = "ViewReportedProductController";
    private static final String VIEW_CART = "ViewCart";
    private static final String VIEW_CART_CONTROLLER = "ViewCartController";
    private static final String VIEW_SHOP_PRODUCT = "ViewShopProduct";
    private static final String VIEW_SHOP_PRODUCT_CONTROLLER = "ViewShopProductController";
    private static final String VIEW_ODER_ADDRESS = "ViewOderAddress";
    private static final String VIEW_ODER_ADDRESS_CONTROLLER = "ViewAddressController";
    private static final String VIEW_CUSTOMER_ORDER = "ViewCustomerOrder";
    private static final String VIEW_CUSTOMER_ORDER_CONTROLLER = "ViewCustomerOrderController";

    private static final String VIEW_ACCOUNT = "ViewAccount";
    private static final String VIEW_ACCOUNT_CONTROLLER = "ViewAccountController";
    private static final String VIEW_RECIPE_SHOP = "ViewRecipeShop";
    private static final String VIEW_RECIPE_SHOP_CONTROLLER = "ViewRecipeShopController";
    private static final String VIEW_UPDATE_RECIPE = "ViewUpdateRecipe";
    private static final String VIEW_UPDATE_RECIPE_CONTROLLER = "ViewUpdateRecipeController";
    private static final String UPDATE_RECIPE = "Update Recipe";
    private static final String UPDATE_RECIPE_CONTROLLER = "UpdateRecipeController";
    private static final String VIEW_CUSTOMER_ACCOUNT = "ViewCustomerAccount";
    private static final String VIEW_CUSTOMER_ACCOUNT_CONTROLLER = "ViewCustomerAccountController";
    private static final String VIEW_SHOP_ACCOUNT = "ViewShopAccount";
    private static final String VIEW_SHOP_ACCOUNT_CONTROLLER = "ViewShopAccountController";
    private static final String SEARCH_ACCOUNT = "SearchAccount";
    private static final String SEARCH_ACCOUNT_CONTROLLER = "SearchAccountController";
    private static final String VIEW_REPORTED_SHOP = "ViewReportedShop";
    private static final String VIEW_REPORTED_SHOP_CONTROLLER = "ViewReportedShopController";
    private static final String DISABLE_REPORTED_SHOP = "DisableShop";
    private static final String DISABLE_REPORTED_SHOP_CONTROLLER = "DisableReportedShopController";
    private static final String DELETE_REPORTED_SHOP = "DeleteReportedShop";
    private static final String DELETE_REPORTED_SHOP_CONTROLLER = "DeleteReportedShopController";
    private static final String HOMEPAGE = "Homepage";
    private static final String VIEW_HOMEPAGE = "index.jsp";
    private static final String VIEW_PRODUCT_DETAIL = "ViewProductDetail";
    private static final String VIEW_PRODUCT_DETAIL_CONTROLLER = "ViewProductDetailController";
    private static final String VIEW_TYPE_OF_BIRD = "ViewTypeOfBird";
    private static final String VIEW_TYPE_OF_BIRD_CONTROLLER = "SearchTypeOfBirdController";
    private static final String REPORT_PRODUCT = "ReportProduct";
    private static final String REPORT_PRODUCT_CONTROLLER = "ReportProductController";

    private static final String CREATE_PRODUCT = "Create Product";
    private static final String CREATE_PRODUCT_CONTROLLER = "AddProductController";
    private static final String CREATE_RECIPE = "Create Recipe";
    private static final String CREATE_RECIPE_CONTROLLER = "CreateRecipeController";
    private static final String VIEW_CREATE_PRODUCT = "ViewCreateProduct";
    private static final String VIEW_CREATE_PRODUCT_CONTROLLER = "ViewCreateProductController";
    private static final String UPDATE_PRODUCT = "Update Product";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    private static final String VIEW_PRODUCT = "ViewProduct";
    private static final String VIEW_PRODUCT_CONTROLLER = "ViewProductController";
    private static final String LOGIN_SHOP = "LoginShop";
    private static final String LOGIN_SHOP_CONTROLLER = "LoginShopController";
    private static final String VIEW_RECIPE = "ViewRecipe";
    private static final String VIEW_RECIPE_CONTROLLER = "ViewRecipeController";
    private static final String VIEW_RECIPE_DETAIL = "RecipeDetail";
    private static final String VIEW_RECIPE_DETAIL_CONTROLLER = "ViewRecipeDetailController";
    private static final String ADD_TO_CART = "AddToCart";
    private static final String ADD_TO_CART_CONTROLLER = "AddToCartController";
    private static final String DELETE_CART_ITEM = "DeleteCartItem";
    private static final String DELETE_CART_ITEM_CONTROLLER = "DeleteCartItemController";
    private static final String VIEW_PRODUCT_PAGE = "productpage";
    private static final String VIEW_PRODUCT_PAGE_CONTROLLER = "ViewProductPageController";
    private static final String SEARCH = "searchQuerySubmit";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String VIEW_RECIPE_ON_SHOP = "ViewRecipeOnShop";
    private static final String VIEW_RECIPE_ON_SHOP_CONTROLLER = "ViewRecipeOnShopController";
    private static final String ADD_RECIPE = "AddRecipe";
    private static final String ADD_RECIPE_CONTROLLER = "AddRecipeController";
    private static final String VIEW_SHOP_ORDER = "ViewShopOrder";
    private static final String VIEW_SHOP_ORDER_CONTROLLER = "ViewShopOrderController";

    private static final String FOOD_PAGE = "foodpage";
    private static final String VIEW_FOOD_PAGE_CONTROLLER = "ViewFoodPageController";
    private static final String MEDICINE_PAGE = "medicinepage";
    private static final String VIEW_MEDICINE_PAGE_CONTROLLER = "ViewMedicinePageController";
    private static final String VIEW_CUSTOMER_PROFILE = "ViewProfile";
    private static final String VIEW_CUSTOMER_PROFILE_CONTROLLER = "ViewCustomerProfileController";
    private static final String ADD_RECIPE_TO_CART = "AddRecipeToCart";
    private static final String ADD_RECIPE_TO_CART_CONTROLLER = "AddRecipeToCartController";
    private static final String VIEW_PRODUCT_DETAIL_IN_SHOP_DASHBOARD = "ViewProductDetailInShopDashboard";
    private static final String VIEW_PRODUCT_DETAIL_IN_SHOP_DASHBOARD_CONTROLLER = "ViewProductDetailInShopDashboardController";
    private static final String VIEW_SHOP_DASHBOARD = "ViewShopDashboard";
    private static final String VIEW_SHOP_DASHBOARD_CONTROLLER = "ViewShopDashboardController";
    private static final String VIEW_CUSTOMER_ORDER_DETAIL = "ViewCustomerOrderDetail";
    private static final String VIEW_CUSTOMER_ORDER_DETAIL_CONTROLLER = "ViewCustomerOrderDetailController";
    private static final String VIEW_SHOP_ORDER_DETAIL = "ViewShopOrderDetail";
    private static final String VIEW_SHOP_ORDER_DETAIL_CONTROLLER = "ViewShopOrderDetailController";
    private static final String DELETE_PRODUCT = "DeleteProduct";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";
    private static final String DELETE_RECIPE = "DeleteProduct";
    private static final String DELETE_RECIPE_CONTROLLER = "DeleteRecipeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = WELCOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;

            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (VIEW_ACCOUNT.equals(action)) {
                url = VIEW_ACCOUNT_CONTROLLER;
            } else if (VIEW_CUSTOMER_ACCOUNT.equals(action)) {
                url = VIEW_CUSTOMER_ACCOUNT_CONTROLLER;
            } else if (VIEW_SHOP_ACCOUNT.equals(action)) {
                url = VIEW_SHOP_ACCOUNT_CONTROLLER;
            } else if (CREATE_PRODUCT.equals(action)) {
                url = CREATE_PRODUCT_CONTROLLER;
            } else if (CREATE_PRODUCT.equals(action)) {
                url = CREATE_PRODUCT_CONTROLLER;
            } else if (VIEW_PRODUCT.equals(action)) {
                url = VIEW_PRODUCT_CONTROLLER;
            } else if (SEARCH_ACCOUNT.equals(action)) {
                url = SEARCH_ACCOUNT_CONTROLLER;
            } else if (VIEW_REPORTED_SHOP.equals(action)) {
                url = VIEW_REPORTED_SHOP_CONTROLLER;
            } else if (DISABLE_REPORTED_SHOP.equals(action)) {
                url = DISABLE_REPORTED_SHOP_CONTROLLER;
            } else if (DELETE_REPORTED_SHOP.equals(action)) {
                url = DELETE_REPORTED_SHOP_CONTROLLER;

            } else if (HOMEPAGE.equals(action)) {
                url = VIEW_HOMEPAGE;
            } else if (VIEW_PRODUCT_DETAIL.equals(action)) {
                url = VIEW_PRODUCT_DETAIL_CONTROLLER;
            } else if (VIEW_PRICE.equals(action)) {
                url = VIEW_PRICE_CONTROLLER;
            } else if (action == null) {
                url = WELCOME_PAGE;

            } else if (LOGIN_SHOP.equals(action)) {
                url = LOGIN_SHOP_CONTROLLER;
            } else if (VIEW_TYPE_OF_BIRD.equals(action)) {
                url = VIEW_TYPE_OF_BIRD_CONTROLLER;
            } else if (VIEW_REPORTED_PRODUCT.equals(action)) {
                url = VIEW_REPORTED_PRODUCT_CONTROLLER;
            } else if (VIEW_CART.equals(action)) {
                url = VIEW_CART_CONTROLLER;
            } else if (VIEW_RECIPE.equals(action)) {
                url = VIEW_RECIPE_CONTROLLER;
            } else if (VIEW_RECIPE_DETAIL.equals(action)) {
                url = VIEW_RECIPE_DETAIL_CONTROLLER;
            } else if (ADD_TO_CART.equals(action)) {
                url = ADD_TO_CART_CONTROLLER;

            } else if (DELETE_CART_ITEM.equals(action)) {
                url = DELETE_CART_ITEM_CONTROLLER;
            } else if (VIEW_PRODUCT_PAGE.equals(action)) {
                url = VIEW_PRODUCT_PAGE_CONTROLLER;
            } else if (VIEW_SHOP_PRODUCT.equals(action)) {
                url = VIEW_SHOP_PRODUCT_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (VIEW_CREATE_PRODUCT.equals(action)) {
                url = VIEW_CREATE_PRODUCT_CONTROLLER;
            } else if (FOOD_PAGE.equals(action)) {
                url = VIEW_FOOD_PAGE_CONTROLLER;
            } else if (MEDICINE_PAGE.equals(action)) {
                url = VIEW_MEDICINE_PAGE_CONTROLLER;
            } else if (VIEW_CUSTOMER_PROFILE.equals(action)) {
                url = VIEW_CUSTOMER_PROFILE_CONTROLLER;
            } else if (VIEW_ODER_ADDRESS.equals(action)) {
                url = VIEW_ODER_ADDRESS_CONTROLLER;

            } else if (REPORT_PRODUCT.equals(action)) {
                url = REPORT_PRODUCT_CONTROLLER;

            } else if (ADD_RECIPE_TO_CART.equals(action)) {
                url = ADD_RECIPE_TO_CART_CONTROLLER;

            } else if (VIEW_PRODUCT_DETAIL_IN_SHOP_DASHBOARD.equals(action)) {
                url = VIEW_PRODUCT_DETAIL_IN_SHOP_DASHBOARD_CONTROLLER;

            } else if (VIEW_CUSTOMER_ORDER.equals(action)) {
                url = VIEW_CUSTOMER_ORDER_CONTROLLER;

            } else if (UPDATE_PRODUCT.equals(action)) {
                url = UPDATE_PRODUCT_CONTROLLER;
            } else if (VIEW_SHOP_DASHBOARD.equals(action)) {
                url = VIEW_SHOP_DASHBOARD_CONTROLLER;

            } else if (VIEW_SHOP_DASHBOARD.equals(action)) {
                url = VIEW_SHOP_DASHBOARD_CONTROLLER;

            } else if (VIEW_RECIPE_ON_SHOP.equals(action)) {
                url = VIEW_RECIPE_ON_SHOP_CONTROLLER;

            } else if (ADD_RECIPE.equals(action)) {
                url = ADD_RECIPE_CONTROLLER;

            } else if (CREATE_RECIPE.equals(action)) {
                url = CREATE_RECIPE_CONTROLLER;

            } else if (VIEW_CUSTOMER_ORDER_DETAIL.equals(action)) {
                url = VIEW_CUSTOMER_ORDER_DETAIL_CONTROLLER;

            } else if (VIEW_SHOP_ORDER.equals(action)) {
                url = VIEW_SHOP_ORDER_CONTROLLER;

            } else if (VIEW_RECIPE_SHOP.equals(action)) {
                url = VIEW_RECIPE_SHOP_CONTROLLER;

            } else if (VIEW_UPDATE_RECIPE.equals(action)) {
                url = VIEW_UPDATE_RECIPE_CONTROLLER;

            }else if (VIEW_SHOP_ORDER_DETAIL.equals(action)) {
                url = VIEW_SHOP_ORDER_DETAIL_CONTROLLER;

            }else if (DELETE_PRODUCT.equals(action)) {
                url = DELETE_PRODUCT_CONTROLLER;

            }else if (DELETE_RECIPE.equals(action)) {
                url = DELETE_RECIPE_CONTROLLER;

            }else if (UPDATE_RECIPE.equals(action)) {
                url = UPDATE_RECIPE_CONTROLLER;

            }
            else {
                request.setAttribute("ERROR", "Your ACTION is not support");
            }
        } catch (Exception e) {
            log("ERROR at MainController" + e.toString());
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
