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
 * @author Moqsad
 */
public class LoginCheck {

    private final Connection dbconnection;
    private final Statement statement;
    private ResultSet resultSet = null;
    private String id;

    public LoginCheck() throws SQLException, ClassNotFoundException {
        System.out.println("before");
        Class.forName("com.mysql.jdbc.Driver");
        dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotice", "root", "1234");
        statement = dbconnection.createStatement();

        System.out.println("after");
    }

    public String authenticate(String userNameOrMail, String password) {
        try {
            resultSet = statement.executeQuery("select password, account_type, id from enotice.user where username = '" + userNameOrMail + "';");

            String sPass = "", sAcc = "";
            while (resultSet.next()) {
                sPass = resultSet.getString("password");
                sAcc = resultSet.getString("account_type");
                id = resultSet.getString("id");
            }

            System.out.println("sPass: " + sPass + " : " + "sAcc: " + sAcc);

            if (sPass.equals(password)) {
                return sAcc;
            } else {
                resultSet = statement.executeQuery("select password, account_type, id from enotice.user where mail = '" + userNameOrMail + "';");

                sPass = "";
                sAcc = "";
                while (resultSet.next()) {
                    sPass = resultSet.getString("password");
                    sAcc = resultSet.getString("account_type");
                    id = resultSet.getString("id");
                }

                if (sPass.equals(password)) {
                    return sAcc;
                }
            }

        } catch (Exception e) {
            System.out.println("------------In loginCheck------------");
            e.printStackTrace();
        }
        return "0";
    }

    public String getId() {
        System.out.println("id: " + id + "___________\n");
        return id;
    }

    public static void main(String args[]) {
        try {
            LoginCheck loginCheck = new LoginCheck();
            System.out.println(loginCheck.authenticate("moqsad", "11111"));
        } catch (Exception e) {
            System.out.println("Error in main() of LoginCheck");
            e.printStackTrace();
        }
    }
}
