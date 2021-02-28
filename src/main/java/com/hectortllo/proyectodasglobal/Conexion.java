/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hectortllo.proyectodasglobal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hectortllo
 */
public class Conexion {
    public static Connection conection() {
        Connection con = null;
        try {
            String server = "jdbc:mysql://localhost/dsa_global?";
            String user = "root";
            String password = "root";
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(server, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error: " + e);
        }
        return con;
    }
}
