/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author Moqsad
 */
public class Upload {

    private final Connection dbconnection;
    private final Statement statement;
    private ResultSet resultSet = null;  
    private String uploader_id;
    private static int noticeId = 21;

    public Upload() throws SQLException, ClassNotFoundException {
        System.out.println("before");
        Class.forName("com.mysql.jdbc.Driver");
        dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotice", "root", "1234");
        statement = dbconnection.createStatement();

        System.out.println("after");
    }
    
    public void upload(String uploaderId, String title, String description, String importancy, String category, String fileName)
    {
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String uploadDate = dateFormat.format(date);
        System.out.println(dateFormat.format(date)); //2016/11/16 12:08:43
        System.out.println(title + " " + description + " " + importancy + " " + category + " " + fileName + " " + uploaderId);
        
        try
        {
                 statement.execute("INSERT INTO `enotice`.`notice` "
                         + "(`id`, `uploader_id`, `title`, `description`, `importancy`, `date`, `filename`, `category`) "
                         + "VALUES ('" + noticeId + "', '" + uploaderId + "', '" + title + "', '" + description + "', '" + importancy + "', '"
         
                         + uploadDate + "', '" + fileName + "', '" + category + "');" );   
                 ++noticeId;
                 
        }
        catch(Exception e)
        {
            System.out.println("Exception of upload method of Upload");
            e.printStackTrace();
        }
    }
}
