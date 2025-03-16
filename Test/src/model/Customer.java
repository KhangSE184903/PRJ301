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
public class Customer {
    private String customerCode;
    private String name;
    private String phone;
    private String email;

    public Customer() {
    }

    public Customer(String customerCode, String name, String phone, String email) {
        this.customerCode = customerCode;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public int position(String name){
        for (int i = name.length() - 1; i >= 0; i--) {
            if(name.charAt(i) == ' '){
                return i;
            }
        }
        return -1;
    }

    @Override
    public String toString() {
        int pos = position(name);
        String fname = name.substring(pos, name.length());
        String lanme = name.substring(0, pos);
        return String.format("%-8s| %-7s, %-15s | %-14s | %-8s", 
                customerCode, name, phone, email);
    }
    
}
