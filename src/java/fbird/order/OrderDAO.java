/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.order;

import fbird.cart.CartDAO;
import fbird.customer.CustomerDTO;
import fbird.utils.DBUtils;
import java.util.List;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    private static final String VIEW_ADDRESS = "select street, city, postal_code, phone, home_number from customer_address where customer_id=?";
    private static final String CREATE_ORDER = "INSERT customer_order(customer_id, delivery_method_id, order_address, order_date, status, total_price_order, paypal_transaction_id, order_phone, shop_id) VALUES (?,?,?,?,?,?,?,?,?)";
    private static final String GET_LIST_OPTIONAL_SHOP_PRODUCT_ITEM_ID = "SELECT optional_shop_product_item_id FROM optional_shop_product_item JOIN shop_product_item ON optional_shop_product_item.shop_product_item_id = shop_product_item.shop_product_item_id WHERE name = ? AND title = ? AND price = ? AND shop_id = ?";
    private static final String GET_CUSTOMER_ORDER_ID = "SELECT order_id, shop_id FROM customer_order WHERE paypal_transaction_id = ? AND customer_id = ?";
    private static final String ADD_ORDER_PRODUCT = "INSERT order_item(order_id, optional_shop_product_item_id, sell_price, amount) VALUES (?,?,?,?)";
    private static final String SUBTRACT_QUANTITY_IN_INVENTORY = "UPDATE optional_shop_product_item SET inventory = inventory - ? WHERE optional_shop_product_item_id = ?";
    private static final String GET_CART_ITEM_ID = "SELECT cart_item_id FROM optional_shop_product_item JOIN cart_item ON optional_shop_product_item.optional_shop_product_item_id = cart_item.optional_shop_product_item_id WHERE optional_shop_product_item.optional_shop_product_item_id = ? AND customer_id = ?";
    private static final String VIEW_CUSTOMER_ORDER = "SELECT order_id, name, order_date, status, total_price_order, paypal_transaction_id FROM customer_order JOIN delivery_method ON delivery_method.delivery_method_id = customer_order.delivery_method_id WHERE customer_id = ? AND customer_order.status like ? ORDER BY total_price_order OFFSET ? ROWS FETCH FIRST 10 ROWS ONLY";
    private static final String COUNT_ORDER_PAGE_NUMBER = "SELECT  count(shop_product_item.title)  FROM customer_order JOIN order_item on customer_order.order_id= order_item.order_id JOIN optional_shop_product_item on optional_shop_product_item.optional_shop_product_item_id = order_item.optional_shop_product_item_id JOIN shop_product_item on optional_shop_product_item.shop_product_item_id = shop_product_item.shop_product_item_id JOIN delivery_method on delivery_method.delivery_method_id = customer_order.delivery_method_id WHERE customer_id = ? AND customer_order.status like ? ";
    private static final String SET_TOTAL_PRICE_PER_ORDER = "UPDATE customer_order SET total_price_order = ? WHERE order_id = ?";
    private static final String VIEW_SHOP_ORDER = "SELECT optional_shop_product_item.optional_shop_product_item_id, shop_product_item.title, customer_order.order_id, customer.fullname, sell_price, customer_order.status, customer_order.order_date, delivery_method.name FROM order_item JOIN optional_shop_product_item on optional_shop_product_item.optional_shop_product_item_id = order_item.optional_shop_product_item_id JOIN shop_product_item on shop_product_item.shop_product_item_id = optional_shop_product_item.shop_product_item_id JOIN customer_order on customer_order.order_id = order_item.order_id JOIN customer on customer.customer_id = customer_order.customer_id JOIN delivery_method on customer_order.delivery_method_id = delivery_method.delivery_method_id Where customer_order.shop_id=?  AND customer_order.status like ? order by sell_price OFFSET ? ROWS FETCH FIRST 10 ROWS ONLY";
    private static final String GET_ORDER_DETAIL = "SELECT order_address, amount, order_phone, order_date, total_price_order, image_1, shop_name, title, name, sell_price FROM order_item JOIN customer_order ON customer_order.order_id = order_item.order_id JOIN optional_shop_product_item ON order_item.optional_shop_product_item_id = optional_shop_product_item.optional_shop_product_item_id JOIN shop_product_item ON shop_product_item.shop_product_item_id = optional_shop_product_item.shop_product_item_id JOIN product_image ON shop_product_item.shop_product_item_id = product_image.shop_product_item_id JOIN shop_owner ON shop_product_item.shop_id = shop_owner.shop_id WHERE customer_order.order_id = ?";
    private static final String COUNT_SHOP_ORDER_PAGE_NUMBER = "SELECT count(shop_product_item.title) FROM order_item JOIN optional_shop_product_item on optional_shop_product_item.optional_shop_product_item_id = order_item.optional_shop_product_item_id JOIN shop_product_item on shop_product_item.shop_product_item_id = optional_shop_product_item.shop_product_item_id JOIN customer_order on customer_order.order_id = order_item.order_id JOIN customer on customer.customer_id = customer_order.customer_id JOIN delivery_method on customer_order.delivery_method_id = delivery_method.delivery_method_id Where customer_order.shop_id=?";
    private static final String GET_SHOP_ORDER_DETAIL = "SELECT order_address, amount, order_phone, order_date, title, optional_shop_product_item.name as optional_name, sell_price, fullname, delivery_method.name as dmname, delivery_method.price as shipping_fee FROM order_item JOIN customer_order ON customer_order.order_id = order_item.order_id JOIN optional_shop_product_item ON order_item.optional_shop_product_item_id = optional_shop_product_item.optional_shop_product_item_id JOIN shop_product_item ON shop_product_item.shop_product_item_id = optional_shop_product_item.shop_product_item_id JOIN product_image ON shop_product_item.shop_product_item_id = product_image.shop_product_item_id JOIN shop_owner ON shop_product_item.shop_id = shop_owner.shop_id JOIN customer ON customer.customer_id = customer_order.customer_id JOIN delivery_method ON customer_order.delivery_method_id = delivery_method.delivery_method_id WHERE customer_order.order_id = ? AND optional_shop_product_item.optional_shop_product_item_id = ?";
    
    public List<OrderDTO> getAddress(int customer_id) throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_ADDRESS);
                ptm.setInt(1, customer_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String street = rs.getString("street");
                    String city = rs.getString("city");
                    String postal_code = rs.getString("postal_code");
                    String phone = rs.getString("phone");
                    String home_number = rs.getString("home_number");

                    list.add(new OrderDTO(street, city, postal_code, phone, home_number));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean createOrder(int customer_id, int delivery_method_id, String order_address, double total_price_order, String order_phone, String paypal_transaction_id, int shop_id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_ORDER);
                ptm.setInt(1, customer_id);
                ptm.setInt(2, delivery_method_id);
                ptm.setString(3, order_address);
                ptm.setDate(4, java.sql.Date.valueOf(java.time.LocalDate.now()));
                ptm.setString(5, "Đã thanh toán");
                ptm.setDouble(6, total_price_order);
                ptm.setString(7, paypal_transaction_id);
                ptm.setString(8, order_phone);
                ptm.setInt(9, shop_id);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<OrderDTO> getAllProductProperties(List<OrderDTO> listOrder, int customer_order_id, int shop_id) {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (OrderDTO o : listOrder) {
                    String title = o.getTitle();
                    String name = o.getName();
                    double price = o.getPrice();
                    int quantity = o.getQuantity();
                    double unitPrice = price / (double) quantity;
                    ptm = conn.prepareStatement(GET_LIST_OPTIONAL_SHOP_PRODUCT_ITEM_ID);
                    ptm.setString(1, name);
                    ptm.setString(2, title);
                    ptm.setDouble(3, unitPrice);
                    ptm.setInt(4, shop_id);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        int order_id = customer_order_id;
                        int optional_product_item_id = rs.getInt("optional_shop_product_item_id");
                        double sell_price = unitPrice;
                        int amount = quantity;
                        list.add(new OrderDTO(order_id, optional_product_item_id, sell_price, amount));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
        return list;
    }

    public List<OrderDTO> getCustomerOrderID(int customer_id, String paypal_transaction_id) throws SQLException {
        List<OrderDTO> customer_order_id = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_CUSTOMER_ORDER_ID);
            ptm.setString(1, paypal_transaction_id);
            ptm.setInt(2, customer_id);
            rs = ptm.executeQuery();
            while (rs.next()) {
                customer_order_id.add(new OrderDTO(rs.getInt("order_id"), rs.getInt("shop_id")));
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return customer_order_id;
    }

    public boolean addOrderProduct(List<OrderDTO> listProperty) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (OrderDTO o : listProperty) {
                    ptm = conn.prepareStatement(ADD_ORDER_PRODUCT);
                    int orderid = o.getOrder_id();
                    int optional = o.getOptional_product_item_id();
                    double s = o.getSell_price();
                    int amount = o.getAmount();
                    ptm.setInt(1, o.getOrder_id());
                    ptm.setInt(2, o.getOptional_product_item_id());
                    ptm.setDouble(3, o.getSell_price());
                    ptm.setInt(4, o.getAmount());
                    check = ptm.executeUpdate() > 0 ? true : false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean subtractQuantityInInventory(List<OrderDTO> listProperty) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (OrderDTO o : listProperty) {
                    ptm = conn.prepareStatement(SUBTRACT_QUANTITY_IN_INVENTORY);
                    ptm.setInt(1, o.getAmount());
                    ptm.setInt(2, o.getOptional_product_item_id());
                    check = ptm.executeUpdate() > 0 ? true : false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteCartItem(List<OrderDTO> listProperty, int customer_id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (OrderDTO o : listProperty) {
                    ptm = conn.prepareStatement(GET_CART_ITEM_ID);
                    ptm.setInt(1, o.getOptional_product_item_id());
                    ptm.setInt(2, customer_id);
                    rs = ptm.executeQuery();
                    if (rs.next()) {
                        CartDAO cdao = new CartDAO();
                        check = cdao.deleteCartItem(rs.getInt("cart_item_id"));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace(System.err);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<OrderDTO> getAllCustomerOrder(int customer_id, String statuss, int index) throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_CUSTOMER_ORDER);
                ptm.setInt(1, customer_id);
                ptm.setString(2, "%" + statuss + "%");
                ptm.setInt(3, (index - 1) * 10);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int order_id = rs.getInt("order_id");
                    double total_price_order = rs.getDouble("total_price_order");
                    String status = rs.getString("status");
                    String paypal_transaction_id = rs.getString("paypal_transaction_id");
                    Date order_date = rs.getDate("order_date");
                    String name = rs.getString("name");

                    list.add(new OrderDTO(order_id, total_price_order, status, paypal_transaction_id, order_date, name));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public int getOrderPageNumber(int customer_id, String status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_ORDER_PAGE_NUMBER);
                ptm.setInt(1, customer_id);
                ptm.setString(2, "%" + status + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = 0;
                    countPage = total / 10;
                    if (total % 10 != 0) {
                        countPage++;
                    }
                    return countPage;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return 0;
    }

    public void setTotalPricePerOrder(List<OrderDTO> listOrder, int order_id, int shippingPrice) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                double sum = shippingPrice;
                for (OrderDTO o : listOrder) {
                    double sell_price = o.getSell_price();
                    int amount = o.getAmount();
                    sum = sum + (sell_price * amount);
                }
                ptm = conn.prepareStatement(SET_TOTAL_PRICE_PER_ORDER);
                ptm.setDouble(1, sum);
                ptm.setInt(2, order_id);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
    }

    public List<OrderDTO> getAllShopOrder(int shop_id, String status, int indexPage) throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_SHOP_ORDER);
                ptm.setInt(1, shop_id);
                ptm.setString(2, status);
                ptm.setInt(3, (indexPage - 1) * 10);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int optional_product_item_id = rs.getInt("optional_shop_product_item_id");
                    int order_id = rs.getInt("order_id");
                    String title = rs.getString("title");
                    String fullname = rs.getString("fullname");
                    Double sell_price = rs.getDouble("sell_price");
                    String name = rs.getString("name");
                    String statuss = rs.getString("status");
                    Date order_date = rs.getDate("order_date");

                    list.add(new OrderDTO(optional_product_item_id, order_id, title, name, sell_price, order_date, status, fullname));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public List<OrderDTO> getListOrderProduct(int order_id) throws SQLException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ORDER_DETAIL);
                ptm.setInt(1, order_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String order_address = rs.getString("order_address");
                    String order_phone = rs.getString("order_phone");
                    Date order_date = rs.getDate("order_date");
                    Double total_price_order = rs.getDouble("total_price_order");
                    String image_1 = rs.getString("image_1");
                    String shop_name = rs.getString("shop_name");
                    String title = rs.getString("title");
                    String name = rs.getString("name");
                    Double sell_price = rs.getDouble("sell_price");
                    int amount = rs.getInt("amount");
                    list.add(new OrderDTO(order_address, order_phone, order_date, total_price_order, image_1, shop_name, title, name, sell_price, amount));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public int getShopOrderPageNumber(int shop_id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_SHOP_ORDER_PAGE_NUMBER);
                ptm.setInt(1, shop_id);
                
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = 0;
                    countPage = total / 10;
                    if (total % 10 != 0) {
                        countPage++;
                    }
                    return countPage;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return 0;
    }

    public OrderDTO getShopOrderProduct(int order_id, int optional_shop_product_item_id) throws SQLException {
        OrderDTO product = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SHOP_ORDER_DETAIL);
                ptm.setInt(1, order_id);
                ptm.setInt(2, optional_shop_product_item_id);
                rs = ptm.executeQuery();
                if(rs.next()){
                    String order_address = rs.getString("order_address");
                    String order_phone = rs.getString("order_phone");
                    Date order_date = rs.getDate("order_date");
                    String title = rs.getString("title");
                    String name = rs.getString("optional_name");
                    Double sell_price = rs.getDouble("sell_price");
                    int amount = rs.getInt("amount");
                    String dmname = rs.getString("dmname");
                    String fullname = rs.getString("fullname");
                    double shipping_fee = rs.getDouble("shipping_fee");
                    product = new OrderDTO(order_address, order_phone, order_date, title, name, sell_price, amount, fullname, dmname, shipping_fee);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return product;
    }

}
