/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Moqsadur Rahman
 */
public class ChangePreference {

    private final Connection dbconnection;
    private final Statement statement;

    public ChangePreference() throws SQLException, ClassNotFoundException {
        System.out.println("before");

        Class.forName("com.mysql.jdbc.Driver");
        dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotice", "root", "1234");
        statement = dbconnection.createStatement();

        System.out.println("after");
    }

    public void changeIt(String studentId, String attribute, String value) {
        try {
            statement.execute("UPDATE `enotice`.`category` SET `" + attribute + "`=" + value + " WHERE `user_id`=" + studentId + ";");
        } catch (Exception e) {
            System.out.println("Exception in changeIt()");
            e.printStackTrace();
        }
    }
}
