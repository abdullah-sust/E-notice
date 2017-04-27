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
public class Delete {

    private final Connection dbconnection;
    private final Statement statement;
    private ResultSet resultSet = null;
    private String uploader_id;
    private static int noticeId = 19;

    public Delete() throws SQLException, ClassNotFoundException {
        System.out.println("before");
        
        Class.forName("com.mysql.jdbc.Driver");
        dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotice", "root", "1234");
        statement = dbconnection.createStatement();

        System.out.println("after");
    }
    
    public void deleteIt(String id)
    {
        try
        {
            System.out.println("In deleteIt()");
            System.out.println("Id : " + id);
            System.out.println("before Delete()");
            statement.execute("DELETE FROM `enotice`.`notice` WHERE `id`=" + id + ";");
            System.out.println("after Delete()");
        }
        catch(Exception e)
        {
            System.out.println("Exception in deleteIt()");
            e.printStackTrace();
        }
    }
}
