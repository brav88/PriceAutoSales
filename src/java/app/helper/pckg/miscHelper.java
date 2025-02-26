/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.helper.pckg;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author Samuel
 */
public class miscHelper {

    public ArrayList<Integer> getAnios() {
        ArrayList<Integer> anios = new ArrayList<>();
        int currentYear = LocalDate.now().getYear() + 2;
        for (int i = 0; i < 50; i++) {
            anios.add(currentYear - i);
        }
        return anios;
    }
}
