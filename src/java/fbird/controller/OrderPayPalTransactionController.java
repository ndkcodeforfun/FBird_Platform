/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fbird.controller;

import fbird.order.OrderDAO;
import fbird.order.OrderDTO;
import fbird.user.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Louis Kien
 */
public class OrderPayPalTransactionController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
            StringBuilder jsonData = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonData.append(line);
            }
            JSONObject jsonRes = new JSONObject(jsonData.toString());
            JSONArray allElement = jsonRes.getJSONArray("allElement");
            JSONArray allShopId = jsonRes.getJSONArray("allShopId");
            int shippingPrice = Integer.parseInt(jsonRes.getString("shippingOptionSelect"));
            int delivery_method_id;
            if (shippingPrice == 12000) {
                delivery_method_id = 3;
            } else if (shippingPrice == 20000) {
                delivery_method_id = 2;
            } else {
                delivery_method_id = 1;
            }
            String order_address = jsonRes.getString("presentAddress");
            String order_phone = jsonRes.getString("presentPhone");
            double total_price_order = jsonRes.getDouble("totalPrice");
            String paypal_transaction_id = jsonRes.getString("paypalTransactionID");

            List<OrderDTO> listOrder = new ArrayList<>();
            List<OrderDTO> shop_id_list = new ArrayList<>();

            for (int i = 0; i < allShopId.length(); i++) {
                JSONArray shopIdArray = allShopId.getJSONArray(i);
                int shop_id = shopIdArray.getInt(0);
                shop_id_list.add(new OrderDTO(shop_id));
            }
            for (int i = 0; i < allElement.length(); i++) {
                JSONArray elementArray = allElement.getJSONArray(i);
                String title = elementArray.getString(0);
                String name = elementArray.getString(1);
                String img = elementArray.getString(2);
                double price = elementArray.getDouble(3);
                int quantity = elementArray.getInt(4);
                listOrder.add(new OrderDTO(title, name, img, quantity, price));
            }

            OrderDAO dao = new OrderDAO();
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            int customer_id = loginUser.getCustomer_id();
            dao.createOrder(customer_id, delivery_method_id, order_address, total_price_order, order_phone, paypal_transaction_id, shop_id_list.get(0).getShop_id());
            int temp = 1;
            for (int i = 1; i < shop_id_list.size(); i++) {
                int id = shop_id_list.get(i).getShop_id();
                boolean matchId = false;
                for (int j = 0; j < temp; j++) {
                    if (shop_id_list.get(j).getShop_id() == id) {
                        matchId = true;
                    }
                }
                if (matchId == false) {
                    dao.createOrder(customer_id, delivery_method_id, order_address, total_price_order, order_phone, paypal_transaction_id, id);
                }
                temp++;
            }
            List<OrderDTO> list_customer_order_id = dao.getCustomerOrderID(customer_id, paypal_transaction_id);
            for (OrderDTO id : list_customer_order_id) {
                List<OrderDTO> getListProperty = dao.getAllProductProperties(listOrder, id.getOrder_id(), id.getShop_id());
                dao.setTotalPricePerOrder(getListProperty, id.getOrder_id(), shippingPrice);
                dao.addOrderProduct(getListProperty);
                dao.subtractQuantityInInventory(getListProperty);
                dao.deleteCartItem(getListProperty, customer_id);
            }
        } catch (Exception e) {
            log("ERROR at OrderPayPalTransactionController: " + e.toString());
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
