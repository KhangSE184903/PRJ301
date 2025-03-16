/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import java.util.Scanner;


/**
 *
 * @author PC
 */
public class Inputter {
    public static Scanner sc = new Scanner(System.in);
    public static int getAnInteger(String inpMsg, String errMsg){
        while(true){
            System.out.println(inpMsg);
            try {
                int number = Integer.parseInt(sc.nextLine());
                return number;
            } catch (Exception e) {
                System.out.println(errMsg);
            }
        } 
    }
    
    public static int getAnInteger(String inpMsg, String errMsg
                                    , int lowerBound, int upperBound){
        while(true){
            System.out.println(inpMsg);
                if(lowerBound > upperBound){
                int tmp = lowerBound;
                lowerBound = upperBound;
                upperBound = tmp;
            }
            try {
                int number = Integer.parseInt(sc.nextLine());
                if(number < lowerBound || number > upperBound){
                    throw new Exception();
                }
                return number;
            } catch (Exception e) {
                System.out.println(errMsg);
            }
        }
    }
    
    public static double getADouble(String inpMsg, String errMsg){
        while(true){
            System.out.println(inpMsg);
            try {
                double number = Double.parseDouble(sc.nextLine());
                return number;
            } catch (Exception e) {
                System.out.println(errMsg);
            }
        }
    }
    
    public static double getADouble(String inpMsg, String errMsg
                                    , double lowerBound, double upperBound){
        while(true){
            System.out.println(inpMsg);
                if(lowerBound > upperBound){
                double tmp = lowerBound;
                lowerBound = upperBound;
                upperBound = tmp;
            }
            try {
                double number = Double.parseDouble(sc.nextLine());
                if(number < lowerBound || number > upperBound){
                    throw new Exception();
                }
                
                return number;
            } catch (Exception e) {
                System.out.println(errMsg);
            }
        }
    }
    
    
    public static String getString(String inpMsg, String errMsg){
        while(true){
            System.out.println(inpMsg);
            try {
                String str = sc.nextLine();
                if(str.isEmpty()){
                    throw new Exception();
                }
                return str;
            } catch (Exception e) {
                System.out.println(errMsg);
            }
        }
    }
    public static String getString(String inpMsg, String errMsg,
                                    String regex){
        while(true){
            System.out.println(inpMsg);
            try {
                String str = sc.nextLine();
                if(str.isEmpty() || !str.matches(regex)){
                    throw new Exception();
                }
                return str;
            } catch (Exception e) {
                System.out.println(errMsg);
            }
        }
    }
}
