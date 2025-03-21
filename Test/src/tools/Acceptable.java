    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

/**
 *
 * @author PC
 */
public interface Acceptable {
    public final String CUS_ID_VALID = "^[CGKcgk]\\d{4}$";
    public final String NAME_VALID = "^\\D{2,25}$";
    public final String PHONE_VALID = "^(03[2-9]|05[6|8|9]|07[0-9]|08[1-9]|09[0-9])\\d{7}$";
    public final String EMAIL_VALID = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
    public final String MENU_ID_VALID = "^.{5}$";
    public final String DATE_EVENT = "^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\\d{4}$";
    public final String NUM_OF_TABLE = "^[1-9]\\d*$";
    public final String ORDER_ID = "^[1-9]\\d*$";
    public static boolean isValid(String data, String pattern) {
        return data.matches(pattern);
    }
}
