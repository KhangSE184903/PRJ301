/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class Menu {
    public static ArrayList<String> optionList = new ArrayList<>();
    public String title;
    
    public Menu(String title){
        this.title = title;
    }
    
    public void addNewOption(String newOption){
        optionList.add(newOption);
    }
    
    public void print(){
        int count = 1;
        System.out.println("_______" + title + "_______");
        for (String op : optionList) {
            System.out.println("" + count + "," + op);
            count ++;
        }
    }
    
    public int getChoice(){
        int choice = Inputter.getAnInteger("Input your choice", "Your choice must between 1 and " + optionList.size(), 1, optionList.size());
        return choice;
    }
}
