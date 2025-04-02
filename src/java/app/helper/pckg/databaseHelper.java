/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.helper.pckg;

import app.model.pckg.Car;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Samuel
 */
public class databaseHelper {

    Connection conn;

    public databaseHelper() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/PriceAutoSales", "root", "Admin$1234");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(databaseHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
    }

    public ResultSet validateLogin(String email, String pwd) throws SQLException {
        try {
            Statement statement = conn.createStatement();
            String sql = "SELECT * FROM users WHERE email = '" + email + "' AND pwd = '" + pwd + "'";
            ResultSet resultset = statement.executeQuery(sql);
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getTable(String table) throws SQLException {
        try {
            Statement statement = conn.createStatement();
            String sql = "SELECT * FROM " + table;
            return statement.executeQuery(sql);
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getTableWithCriteria(String table, String where) throws SQLException {
        try {
            Statement statement = conn.createStatement();
            String sql = "SELECT * FROM " + table + " " + where;
            return statement.executeQuery(sql);
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public boolean saveCar(Car car, int owner_id) throws SQLException {
        try {
            //otra forma
            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO cars (brand, model, man_year, color, cc_engine, fuelType, mileage, photo, owner_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");

            predStatement.setString(1, car.Brand);
            predStatement.setString(2, car.Model);
            predStatement.setInt(3, car.Year);
            predStatement.setString(4, car.Color);
            predStatement.setString(5, car.Engine);
            predStatement.setString(6, car.FuelType);
            predStatement.setInt(7, car.Mileage);
            predStatement.setString(8, car.Photo);
            predStatement.setInt(9, owner_id);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean updateCar(int carId, Car car) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE cars SET man_year = ?, color = ?, cc_engine = ?, fuelType = ?, mileage = ? WHERE id = ?;");

            predStatement.setInt(1, car.Year);
            predStatement.setString(2, car.Color);
            predStatement.setString(3, car.Engine);
            predStatement.setString(4, car.FuelType);
            predStatement.setInt(5, car.Mileage);
            predStatement.setInt(6, carId);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean deleteCar(int carId, int owner_id) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("DELETE FROM cars WHERE id = ? AND owner_id = ?;");

            predStatement.setInt(1, carId);
            predStatement.setInt(2, owner_id);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public ResultSet getCar(int car_id) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM cars INNER JOIN users ON cars.owner_id = users.id WHERE cars.id = ?;");

            predStatement.setInt(1, car_id);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return null;
        }
    }
    
     public void saveNotification(String email, String action, String description) throws SQLException {
        try {
            //otra forma
            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO notifications (email, action, description, creation_date, status) VALUES (?, ?, ?, ?, ?);");

            String today = LocalDateTime.now().toString();  
            
            predStatement.setString(1, email);
            predStatement.setString(2, action);
            predStatement.setString(3, description);
            predStatement.setString(4, today);
            predStatement.setInt(5, 1);     

            predStatement.executeUpdate();           
        } catch (SQLException ex) {            
        }
    }
}