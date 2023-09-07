/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fbird.recipe;

/**
 *
 * @author louis
 */
public class RecipeDTO {

    private int recipe_id;
    private int shop_id;
    private String title_recipe;
    private Double total_price;
    private String recipe_image1;
    private String recipe_image2;
    private String recipe_image3;
    private String recipe_image4;
    private int recipeProductID;
    private int typeOfBirdID;
    private String typeOfBirdName;
    private int optionalShopProductItemID;
    private String nameProductOptional;
    private int quantity;
    private int shopProductItemID;
    private String nameProduct;
    private Boolean status;
    private String category;
    private String image_1;
    private String image_2;
    private String image_3;
    private String image_4;
    private String description;
    private double price;

    private String title, name, product_image;
    private int shop_product_item_id;
    
    public RecipeDTO(String title, String name, String product_image, int quantity, int shop_product_item_id, int shop_id) {
        this.title = title;
        this.name = name;
        this.product_image = product_image;
        this.quantity = quantity;
        this.shop_product_item_id = shop_product_item_id;
        this.shop_id = shop_id;
    }
    
    public RecipeDTO(int optionalShopProductItemID, int quantity) {
        this.optionalShopProductItemID = optionalShopProductItemID;
        this.quantity = quantity;
    }
    
    
    
    public RecipeDTO() {
    }

    public RecipeDTO(int recipe_id, int shop_id, String title_recipe, Double total_price, String image_1) {
        this.recipe_id = recipe_id;
        this.shop_id = shop_id;
        this.title_recipe = title_recipe;
        this.total_price = total_price;

        this.image_1 = image_1;
    }

    public RecipeDTO(int recipe_id, int shop_id, String title_recipe, Double total_price, int recipeProductID, int optionalShopProductItemID, String nameProductOptional, int quantity, int shopProductItemID, String nameProduct, Boolean status, String image_1, String image_2, String image_3, String image_4, String description) {
        this.recipe_id = recipe_id;
        this.shop_id = shop_id;
        this.title_recipe = title_recipe;
        this.total_price = total_price;
        this.recipeProductID = recipeProductID;
        this.optionalShopProductItemID = optionalShopProductItemID;
        this.nameProductOptional = nameProductOptional;
        this.quantity = quantity;
        this.shopProductItemID = shopProductItemID;
        this.nameProduct = nameProduct;
        this.status = status;
        this.image_1 = image_1;
        this.image_2 = image_2;
        this.image_3 = image_3;
        this.image_4 = image_4;
        this.description = description;
    }

    public RecipeDTO(int recipe_id, int shop_id, String title_recipe, Double total_price, int recipeProductID, String typeOfBirdName, String nameProductOptional, int quantity, String description) {
        this.recipe_id = recipe_id;
        this.shop_id = shop_id;
        this.title_recipe = title_recipe;
        this.total_price = total_price;
        this.recipeProductID = recipeProductID;
        this.typeOfBirdName = typeOfBirdName;
        this.nameProductOptional = nameProductOptional;
        this.quantity = quantity;
        this.description = description;
    }
    
    

    public RecipeDTO(int recipe_id, int shop_id, String title_recipe, Double total_price, int recipeProductID, String typeOfBirdName, int optionalShopProductItemID, String nameProductOptional, int quantity, int shopProductItemID, String nameProduct, Boolean status, String category, String image_1, String image_2, String image_3, String image_4, String description, double price) {
        this.recipe_id = recipe_id;
        this.shop_id = shop_id;
        this.title_recipe = title_recipe;
        this.total_price = total_price;
        this.recipeProductID = recipeProductID;
        this.typeOfBirdName = typeOfBirdName;
        this.optionalShopProductItemID = optionalShopProductItemID;
        this.nameProductOptional = nameProductOptional;
        this.quantity = quantity;
        this.shopProductItemID = shopProductItemID;
        this.nameProduct = nameProduct;
        this.status = status;
        this.category = category;
        this.image_1 = image_1;
        this.image_2 = image_2;
        this.image_3 = image_3;
        this.image_4 = image_4;
        this.description = description;
        this.price = price;
    }
    public RecipeDTO(int recipe_id, int shop_id, String title_recipe, Double total_price, String recipe_image1, String recipe_image2, String recipe_image3, String recipe_image4, int recipeProductID, String typeOfBirdName, int optionalShopProductItemID, String nameProductOptional, int quantity, int shopProductItemID, String nameProduct, Boolean status, String category, String image_1, String image_2, String image_3, String image_4, String description, double price) {
        this.recipe_id = recipe_id;
        this.shop_id = shop_id;
        this.title_recipe = title_recipe;
        this.total_price = total_price;
        this.recipe_image1 = recipe_image1;
        this.recipe_image2 = recipe_image2;
        this.recipe_image3 = recipe_image3;
        this.recipe_image4 = recipe_image4;
        this.recipeProductID = recipeProductID;
        this.typeOfBirdName = typeOfBirdName;
        this.optionalShopProductItemID = optionalShopProductItemID;
        this.nameProductOptional = nameProductOptional;
        this.quantity = quantity;
        this.shopProductItemID = shopProductItemID;
        this.nameProduct = nameProduct;
        this.status = status;
        this.category = category;
        this.image_1 = image_1;
        this.image_2 = image_2;
        this.image_3 = image_3;
        this.image_4 = image_4;
        this.description = description;
        this.price = price;
    }

    public RecipeDTO(int recipe_id,String title_recipe) {
        this.recipe_id = recipe_id;
        this.title_recipe = title_recipe;
    }

    public RecipeDTO(int shop_id, String title_recipe, Double total_price, int typeOfBirdID, String description) {
        this.shop_id = shop_id;
        this.title_recipe = title_recipe;
        this.total_price = total_price;
        this.typeOfBirdID = typeOfBirdID;
        this.description = description;
    }

    public RecipeDTO(String title_recipe, Double total_price) {
        this.title_recipe = title_recipe;
        this.total_price = total_price;
    }

    public RecipeDTO(int recipe_id, String title_recipe, Double total_price) {
        this.recipe_id = recipe_id;
        this.title_recipe = title_recipe;
        this.total_price = total_price;
    }

    public RecipeDTO(int recipe_id, int shop_id, String title_recipe, Double total_price, int recipeProductID, int typeOfBirdID, int optionalShopProductItemID, int quantity, String description) {
        this.recipe_id = recipe_id;
        this.shop_id = shop_id;
        this.title_recipe = title_recipe;
        this.total_price = total_price;
        this.recipeProductID = recipeProductID;
        this.typeOfBirdID = typeOfBirdID;
        this.optionalShopProductItemID = optionalShopProductItemID;
        this.quantity = quantity;
        this.description = description;
    }
    
    
    


    public int getRecipe_id() {
        return recipe_id;
    }

    public void setRecipe_id(int recipe_id) {
        this.recipe_id = recipe_id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getTitle_recipe() {
        return title_recipe;
    }

    public void setTitle_recipe(String title_recipe) {
        this.title_recipe = title_recipe;
    }

    public Double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(Double total_price) {
        this.total_price = total_price;
    }

    public String getImage_1() {
        return image_1;
    }

    public void setImage_1(String image_1) {
        this.image_1 = image_1;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getRecipeProductID() {
        return recipeProductID;
    }

    public void setRecipeProductID(int recipeProductID) {
        this.recipeProductID = recipeProductID;
    }

    public int getOptionalShopProductItemID() {
        return optionalShopProductItemID;
    }

    public void setOptionalShopProductItemID(int optionalShopProductItemID) {
        this.optionalShopProductItemID = optionalShopProductItemID;
    }

    public String getNameProductOptional() {
        return nameProductOptional;
    }

    public void setNameProductOptional(String nameProductOptional) {
        this.nameProductOptional = nameProductOptional;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getShopProductItemID() {
        return shopProductItemID;
    }

    public void setShopProductItemID(int shopProductItemID) {
        this.shopProductItemID = shopProductItemID;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getImage_2() {
        return image_2;
    }

    public void setImage_2(String image_2) {
        this.image_2 = image_2;
    }

    public String getImage_3() {
        return image_3;
    }

    public void setImage_3(String image_3) {
        this.image_3 = image_3;
    }

    public String getImage_4() {
        return image_4;
    }

    public void setImage_4(String image_4) {
        this.image_4 = image_4;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getTypeOfBirdName() {
        return typeOfBirdName;
    }

    public void setTypeOfBirdName(String typeOfBirdName) {
        this.typeOfBirdName = typeOfBirdName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
        public String getRecipe_image1() {
        return recipe_image1;
    }

    public void setRecipe_image1(String recipe_image1) {
        this.recipe_image1 = recipe_image1;
    }

    public String getRecipe_image2() {
        return recipe_image2;
    }

    public void setRecipe_image2(String recipe_image2) {
        this.recipe_image2 = recipe_image2;
    }

    public String getRecipe_image3() {
        return recipe_image3;
    }

    public void setRecipe_image3(String recipe_image3) {
        this.recipe_image3 = recipe_image3;
    }

    public String getRecipe_image4() {
        return recipe_image4;
    }

    public void setRecipe_image4(String recipe_image4) {
        this.recipe_image4 = recipe_image4;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public int getShop_product_item_id() {
        return shop_product_item_id;
    }

    public void setShop_product_item_id(int shop_product_item_id) {
        this.shop_product_item_id = shop_product_item_id;
    }

    public int getTypeOfBirdID() {
        return typeOfBirdID;
    }

    public void setTypeOfBirdID(int typeOfBirdID) {
        this.typeOfBirdID = typeOfBirdID;
    }
    
    


}
