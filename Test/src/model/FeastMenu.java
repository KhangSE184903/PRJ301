/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author PC
 */
public class FeastMenu {
    private String menuCode;
    private String menuName;
    private double price;
    private String ingredients;

    public FeastMenu() {
    }

    public FeastMenu(String menuCode, String menuName, double price, String ingredients) {
        this.menuCode = menuCode;
        this.menuName = menuName;
        this.price = price;
        this.ingredients = ingredients;
    }

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    @Override
    public String toString() {
        return String.format("%-12s | %-12s | %8.0f | %-12s", 
                menuCode, menuName, price, ingredients);
    }
    
}
