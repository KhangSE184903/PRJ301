/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.util.ArrayList;
import model.Customer;
import tools.Acceptable;
import tools.Inputter;

/**
 *
 * @author PC
 */
public class Customers {
    public ArrayList<Customer> cusList = new ArrayList<>();
    
    public Customer searchCustomerByCode (String customerCode){
        Customer cus;
        for (Customer item : cusList) {
            if(item.getCustomerCode().equals(customerCode)){
                return item;
            }
        }
        return null;
    }
    
    public void addNewCustomer(){
        boolean isCheck = false;
        String customerCode = "";
        do {            
            isCheck = false;
            customerCode = Inputter.getString("", "", Acceptable.CUS_ID_VALID);
            Customer temp = searchCustomerByCode(customerCode);
            if (temp == null) isCheck = true;
            else System.out.println("");
        } while (!isCheck);
        
        String name = Inputter.getString("", "", Acceptable.NAME_VALID);
        String phone = Inputter.getString("", "", Acceptable.PHONE_VALID);
        String email = Inputter.getString("", "", Acceptable.EMAIL_VALID);
        Customer customer = new Customer(customerCode, name, phone, email);
        if(customer != null){
            cusList.add(customer);
            System.out.println("");
        }
    }
}
