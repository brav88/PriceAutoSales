/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.model.pckg;

/**
 *
 * @author Samuel
 */
public class Car {
    public String Brand = "";
    public String Model= "";
    public int Year = 0;    
    public String Color= "";
    public String Engine= "";
    public String FuelType= "";
    public int Mileage = 0;
    public String Photo= "";
    
    public Car(String _Brand,
               String _Model,
               int _Year,   
               String _Color,
               String _Engine,
               String _FuelType,
               int _Mileage,
               String _Photo)
    {
        this.Brand = _Brand;
        this.Model = _Model;
        this.Year = _Year;
        this.Color = _Color;
        this.Engine = _Engine;
        this.FuelType = _FuelType;
        this.Mileage = _Mileage;
        this.Photo = _Photo;
    }
}
