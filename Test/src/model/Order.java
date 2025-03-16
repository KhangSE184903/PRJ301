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
public class Order {
    private String orderId;
    private String customerId;
    private String menuId;
    private String eventDate;
    private int numberOfTable;
    private double totalCost;

    public Order() {
    }

    public Order(String orderId, String customerId, String menuId, String eventDate, int numberOfTable, double totalCost) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.menuId = menuId;
        this.eventDate = eventDate;
        this.numberOfTable = numberOfTable;
        this.totalCost = totalCost;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public int getNumberOfTable() {
        return numberOfTable;
    }

    public void setNumberOfTable(int numberOfTable) {
        this.numberOfTable = numberOfTable;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    @Override
    public String toString() {
        return String.format("%-2s | %-14s | %-10s | %-12s | %10.0f | %-4d | %10.0f", 
                orderId, eventDate, customerId, menuId, totalCost / numberOfTable, numberOfTable, totalCost);
    }
    
}
