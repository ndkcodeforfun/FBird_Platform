/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.recipe;

import fbird.product.ProductDTO;
import fbird.recipe.RecipeDTO;
import fbird.shop.ShopDTO;
import fbird.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RecipeDAO {

    private static final String ADD_RECIPE = "INSERT INTO [recipe] VALUES (?,?,?,?,?)";
    private static final String UPDATE_RECIPE_OPTION = "UPDATE recipe_product SET optional_shop_product_item_id=?, quantity=? WHERE recipe_id=? AND recipe_product_id=?";
    private static final String UPDATE_RECIPE = "UPDATE [recipe] SET type_of_bird_id=?,title_recipe=?,description=?,total_price=? WHERE recipe_id=?";
    private static final String VIEW_RECIPE_SHOP = "SELECT * FROM recipe WHERE shop_id=?";
    private static final String GET_RECIPE_SHOP = "select s.recipe_product_id, s.recipe_id, o.name, s.quantity, b.type_of_bird_name, r.shop_id, r.title_recipe, r.description, r.total_price FROM recipe r JOIN recipe_product s ON r.recipe_id = s.recipe_id JOIN type_of_bird b ON r.type_of_bird_id = b.type_of_bird_id JOIN optional_shop_product_item o ON s.optional_shop_product_item_id = o.optional_shop_product_item_id WHERE r.recipe_id=?";
    private static final String ADD_RECIPE_PRODUCT = "INSERT INTO [recipe_product] VALUES (?,?,?)";
    private static final String GET_ID = "SELECT TOP 1 * FROM recipe ORDER BY recipe.recipe_id DESC;";
    private static final String FIND_ID = "SELECT o.optional_shop_product_item_id  FROM shop_product_item s JOIN optional_shop_product_item o ON s.shop_product_item_id = o.shop_product_item_id WHERE s.title like ? AND o.[name] like ?";
    private static final String VIEW_RECIPE_HOMEPAGE = "SELECT recipe.title_recipe,recipe.recipe_id, recipe.shop_id, recipe.total_price, recipe_image.image_1 FROM recipe JOIN recipe_image ON recipe.recipe_id = recipe_image.recipe_id";
    private static final String VIEW_RECIPE_DETAIL = "SELECT r.recipe_id, t.type_of_bird_name, r.shop_id, r.title_recipe, r.[description], r.total_price, reimg.image_1 , reimg.image_2 , reimg.image_3 , reimg.image_4 , p.recipe_product_id, p.optional_shop_product_item_id, op.[name], p.quantity, new.*\n"
            + "FROM recipe r\n"
            + "LEFT JOIN recipe_image reimg ON r.recipe_id = reimg.recipe_id\n"
            + "LEFT JOIN recipe_product p ON r.recipe_id = p.recipe_id\n"
            + "LEFT JOIN type_of_bird t ON r.type_of_bird_id = t.type_of_bird_id\n"
            + "LEFT JOIN optional_shop_product_item op ON op.optional_shop_product_item_id = p.optional_shop_product_item_id\n"
            + "LEFT JOIN (\n"
            + "    SELECT s.shop_product_item_id, s.shop_id, t.type_of_bird_name, s.title, s.[status], p.category_name, i.image_1 as recipe_image_1, i.image_2 as recipe_image_2, i.image_3 as recipe_image_3, i.image_4 as recipe_image_4, o.optional_shop_product_item_id, o.[name], o.price\n"
            + "    FROM shop_product_item s\n"
            + "    JOIN product_category p ON s.category_id = p.category_id\n"
            + "    LEFT JOIN type_of_bird t ON s.type_of_bird_id = t.type_of_bird_id\n"
            + "    LEFT JOIN product_image i ON s.shop_product_item_id = i.shop_product_item_id\n"
            + "    JOIN optional_shop_product_item o ON s.shop_product_item_id = o.shop_product_item_id\n"
            + "    WHERE o.optional_shop_product_item_id IN (SELECT recipe_product.optional_shop_product_item_id FROM recipe_product)\n"
            + ") new ON op.optional_shop_product_item_id = new.optional_shop_product_item_id\n"
            + "WHERE r.recipe_id = ?";
    private static final String VIEW_SHOP_RECIPE = "SELECT s.shop_name, s.avatar FROM recipe r\n"
            + "LEFT JOIN shop_owner s ON s.shop_id = r.shop_id\n"
            + "WHERE r.recipe_id = ?";
    private static final String VIEW_RECIPE="select recipe_id, title_recipe from recipe Where shop_id = ?";

    private static final String GET_RECIPE_PRODUCT = "SELECT title, name, quantity, image_1, shop_product_item.shop_product_item_id,shop_product_item.shop_id FROM recipe_product JOIN optional_shop_product_item ON optional_shop_product_item.optional_shop_product_item_id = recipe_product.optional_shop_product_item_id JOIN shop_product_item ON optional_shop_product_item.shop_product_item_id = shop_product_item.shop_product_item_id JOIN product_image ON shop_product_item.shop_product_item_id = product_image.shop_product_item_id JOIN shop_owner ON shop_product_item.shop_id = shop_owner.shop_id WHERE recipe_id = ?";
    private static final String GET_RECIPE_PRODUCT_TO_ADD = "SELECT quantity, optional_shop_product_item.optional_shop_product_item_id FROM recipe_product JOIN optional_shop_product_item ON optional_shop_product_item.optional_shop_product_item_id = recipe_product.optional_shop_product_item_id JOIN shop_product_item ON optional_shop_product_item.shop_product_item_id = shop_product_item.shop_product_item_id JOIN product_image ON shop_product_item.shop_product_item_id = product_image.shop_product_item_id JOIN shop_owner ON shop_product_item.shop_id = shop_owner.shop_id WHERE recipe_product.recipe_id = ?";
    private static final String ADD_TO_CART = "INSERT cart_item(quantity, customer_id, optional_shop_product_item_id) VALUES (?,?,?)";
    private static final String ADD_TO_CART_QUANTITY = "UPDATE cart_item SET quantity = quantity + ? WHERE cart_item_id = (SELECT cart_item_id FROM cart_item WHERE customer_id = ? AND optional_shop_product_item_id = ?)";
    private static final String LIST_PRODUCT_ID = "SELECT optional_shop_product_item_id FROM cart_item WHERE customer_id = ?";
    

    public List<RecipeDTO> getRecipeHomePage() throws SQLException {
        List<RecipeDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_RECIPE_HOMEPAGE);
                rs = ptm.executeQuery();
                while (rs.next()) {

                    String title_recipe = rs.getString("title_recipe");
                    String image_1 = rs.getString("image_1");

                    int recipe_id = rs.getInt("recipe_id");
                    int shop_id = rs.getInt("shop_id");

                    Double total_price = rs.getDouble("total_price");

                    list.add(new RecipeDTO(recipe_id, shop_id, title_recipe, total_price, image_1));
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

    public List<RecipeDTO> getRecipeDetail(int recipeID) throws SQLException {
        List<RecipeDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_RECIPE_DETAIL);
                ptm.setInt(1, recipeID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String typeOfBirdName = rs.getString(2);
                    int shopID = rs.getInt(3);
                    String titleRecipe = rs.getString(4);
                    String description = rs.getString(5);
                    Double total = rs.getDouble(6);
                    String recipeImage_1 = rs.getString(7);
                    String recipeImage_2 = rs.getString(8);
                    String recipeImage_3 = rs.getString(9);
                    String recipeImage_4 = rs.getString(10);
                    int recipeProductID = rs.getInt(11);
                    int optionalShopProductItemID = rs.getInt(12);
                    String nameProductOptional = rs.getString(13);
                    int quantity = rs.getInt(14);
                    int shopProductItemID = rs.getInt(15);
                    String nameProduct = rs.getString("title");
                    Boolean status = rs.getBoolean("status");
                    String categoryName = rs.getString("category_name");
                    String image_1 = rs.getString("image_1");
                    String image_2 = rs.getString("image_2");
                    String image_3 = rs.getString("image_3");
                    String image_4 = rs.getString("image_4");
                    double priceProduct = rs.getDouble("price");
                    list.add(new RecipeDTO(recipeID, shopID, titleRecipe, total, recipeImage_1, recipeImage_2, recipeImage_3, recipeImage_4, recipeProductID, typeOfBirdName, optionalShopProductItemID, nameProductOptional, quantity, shopProductItemID, nameProduct, status, categoryName, image_1, image_2, image_3, image_4, description, priceProduct));
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

    public ShopDTO getShopRecipe(int recipeID) throws SQLException {
        ShopDTO shop = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_SHOP_RECIPE);
                ptm.setInt(1, recipeID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String shopName = rs.getString("shop_name");
                    String avatar = rs.getString("avatar");
                    shop = new ShopDTO(shopName, avatar);
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
        return shop;
    }

    public List<RecipeDTO> getRecipeProduct(int recipeID) throws SQLException {
        List<RecipeDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_RECIPE_PRODUCT);
                ptm.setInt(1, recipeID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String title = rs.getString("title");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    String product_image = rs.getString("image_1");
                    int shop_product_item_id = rs.getInt("shop_product_item_id");
                    int shop_id = rs.getInt("shop_id");
                    list.add(new RecipeDTO(title, name, product_image, quantity, shop_product_item_id, shop_id));
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
    
    public List<RecipeDTO> getRecipe(int shop_id) throws SQLException {
        List<RecipeDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_RECIPE);
                ptm.setInt(1, shop_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int recipe_id = Integer.parseInt(rs.getString("recipe_id"));
                    String title_recipe = rs.getString("title_recipe");
                   
                    list.add(new RecipeDTO(recipe_id,title_recipe));
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
    
    public List<RecipeDTO> getRecipeProductToAdd(int recipe_id) throws SQLException {
        List<RecipeDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_RECIPE_PRODUCT_TO_ADD);
                ptm.setInt(1, recipe_id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int optional_shop_product_item_id = rs.getInt("optional_shop_product_item_id");
                    int quantity = rs.getInt("quantity");
                    list.add(new RecipeDTO(optional_shop_product_item_id, quantity));
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
    
    public boolean addToCart(List<RecipeDTO> listRecipeProduct, int customer_id, List<Integer> listProductId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (RecipeDTO rp : listRecipeProduct) {
                    ptm = conn.prepareStatement(ADD_TO_CART);
                    for(Integer id: listProductId){
                        if(rp.getOptionalShopProductItemID() == id.intValue()){
                            ptm = conn.prepareStatement(ADD_TO_CART_QUANTITY);
                            break;
                        }
                    }
                    ptm.setInt(1, rp.getQuantity());
                    ptm.setInt(2, customer_id);
                    ptm.setInt(3, rp.getOptionalShopProductItemID());
                    
                    check = ptm.executeUpdate() > 0 ? true : false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<Integer> getCartItemId(int customer_id) throws SQLException {
        List<Integer> listID = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_PRODUCT_ID);
                ptm.setInt(1, customer_id);
                rs = ptm.executeQuery();
                while(rs.next()){
                    int optional_shop_product_item_id = rs.getInt("optional_shop_product_item_id");
                    listID.add(optional_shop_product_item_id);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null){
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listID;
    }

    public boolean addRicepe(RecipeDTO recipe) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(ADD_RECIPE);
                ptm.setInt(1, recipe.getTypeOfBirdID());
                ptm.setInt(2, recipe.getShop_id());
                ptm.setString(3, recipe.getTitle_recipe());
                ptm.setString(4, recipe.getDescription());
                ptm.setDouble(5, recipe.getTotal_price());
                check = ptm.executeUpdate() > 0? true:false;
            }
        }finally{
            if(ptm != null){
                ptm.close();
            }
            if(conn != null){
                conn.close();
            }
        }
            return check;
    }

    public int getID() throws SQLException {
        int recipeID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    recipeID = rs.getInt("recipe_id");
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
        return recipeID;
    }

    public int findOptionalProductID(String optionName, String productName) throws SQLException {
        int ID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FIND_ID);
                ptm.setString(1, productName);
                ptm.setString(2, optionName);
                rs = ptm.executeQuery();
                if(rs.next()){
                    ID = rs.getInt(1);
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
        return ID;
    }

    public boolean addProductRecipe(int recipeID, int optionalShopProductItemID, int inventory) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(ADD_RECIPE_PRODUCT);
                ptm.setInt(1, recipeID);
                ptm.setInt(2, optionalShopProductItemID);
                ptm.setInt(3, inventory);
                check = ptm.executeUpdate() > 0? true:false;
            }
        }finally{
            if(ptm != null){
                ptm.close();
            }
            if(conn != null){
                conn.close();
            }
        }
            return check;
    }

    public List<RecipeDTO> getListRecipe(int shopID) throws SQLException {
        List<RecipeDTO> list = new ArrayList();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_RECIPE_SHOP);
                ptm.setInt(1, shopID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int recipe_id = rs.getInt("recipe_id");
                    String title = rs.getString("title_recipe");
                    double price = rs.getDouble("total_price");
                    list.add(new RecipeDTO(recipe_id, title, price));
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

    public List<RecipeDTO> getRecipeShop(int recipeID) throws SQLException {
        List<RecipeDTO> recipe = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_RECIPE_SHOP);
                ptm.setInt(1, recipeID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int recipe_product_id = rs.getInt("recipe_product_id");
                    String optionalShopProductItemName = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    String typeOfBirdName = rs.getString("type_of_bird_name");
                    int shop_id = rs.getInt("shop_id");
                    String title = rs.getString("title_recipe");
                    String description = rs.getString("description");
                    double price = rs.getDouble("total_price");
                    recipe.add(new RecipeDTO(recipeID, shop_id, title, price, recipe_product_id, typeOfBirdName, optionalShopProductItemName, quantity, description));
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
        return recipe;
    }

    public boolean updateRecipe(RecipeDTO recipe, int recipe_ID) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE_RECIPE);
                ptm.setInt(1, recipe.getTypeOfBirdID());
                ptm.setString(2, recipe.getTitle_recipe());
                ptm.setString(3, recipe.getDescription());
                ptm.setDouble(4, recipe.getTotal_price());
                ptm.setInt(5, recipe_ID);
                check = ptm.executeUpdate() > 0? true:false;
            }
        }finally{
            if(ptm != null){
                ptm.close();
            }
            if(conn != null){
                conn.close();
            }
        }
            return check;
    }

    public boolean updateOption(int recipeProductID, int recipe_ID, int optionalShopProductItemID, int inventory) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE_RECIPE_OPTION);
                ptm.setInt(1, optionalShopProductItemID);
                ptm.setInt(2, inventory);
                ptm.setInt(3, recipe_ID);
                ptm.setInt(4, recipeProductID);
                check = ptm.executeUpdate() > 0? true:false;
            }
        }finally{
            if(ptm != null){
                ptm.close();
            }
            if(conn != null){
                conn.close();
            }
        }
            return check;
    }

}
