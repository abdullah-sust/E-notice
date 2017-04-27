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
public class Notices {

    private final Connection dbconnection;
    private final Statement statement;
    private ResultSet resultSet = null;
    public static int noOfNotices;
    public static String uploaderIdArray[] = new String[500];
    public static String titleArray[] = new String[500];
    public static String descriptionArray[] = new String[500];
    public static String importancyArray[] = new String[500];
    public static String dateArray[] = new String[500];
    public static String fileNameArray[] = new String[500];
    public static String categoryArray[] = new String[500];

    //for marquee
    public static int marqueeNoOfNotices;
    public static String marqueeTitleArray[] = new String[5];
    public static String marqueeDescriptionArray[] = new String[5];
    public static String marqueeDateArray[] = new String[5];
    public static String marqueeFileNameArray[] = new String[5];
    public static String marqueeCategoryArray[] = new String[5];

    public Notices() throws SQLException, ClassNotFoundException {
        System.out.println("before");
        Class.forName("com.mysql.jdbc.Driver");
        dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotice", "root", "1234");
        statement = dbconnection.createStatement();

        System.out.println("after");
    }

    public void allNotices(String category, String search) {
        try {
            resultSet = statement.executeQuery("SELECT * FROM enotice.notice ORDER BY date DESC;");

            noOfNotices = 0;

            search = search.toLowerCase();
            search = search.replaceAll(" ", "");
            
            System.out.println(">>>>>>>>>>>>>>>>>>" + search + "<<<<<<<<<<<<<<<<<<");
            
            System.out.println("Priniting Notice Array.........");

            while (resultSet.next()) {
                if (resultSet.getString("category").equals(category) || category.equals("All")) {
                    
                    String title = resultSet.getString("title");
                    title = title.toLowerCase().replaceAll(" ", "");
                    
                    System.out.println(">>>>>>>>>>>>>>>>>>-------" + title + "-------<<<<<<<<<<<<<<<<<<");
                    
                    if (title.contains(search)) {
                        uploaderIdArray[noOfNotices] = resultSet.getString("uploader_id");
                        titleArray[noOfNotices] = resultSet.getString("title");
                        descriptionArray[noOfNotices] = resultSet.getString("description");
                        importancyArray[noOfNotices] = resultSet.getString("importancy");
                        dateArray[noOfNotices] = resultSet.getString("date");
                        fileNameArray[noOfNotices] = resultSet.getString("filename");
                        categoryArray[noOfNotices] = resultSet.getString("category");

                        System.out.println("Uploader Id : " + uploaderIdArray[noOfNotices]);
                        System.out.println("Title : " + titleArray[noOfNotices]);
                        System.out.println("Description : " + descriptionArray[noOfNotices]);
                        System.out.println("Importancy : " + importancyArray[noOfNotices]);
                        System.out.println("Date : " + dateArray[noOfNotices]);
                        System.out.println("File : " + fileNameArray[noOfNotices]);
                        System.out.println("Category : " + categoryArray[noOfNotices]);

                        ++noOfNotices;
                    }
                }
            }

            System.out.println("Notice Array Printing is completed.........");

            marqueeNotices();

        } catch (Exception e) {
            System.out.println("Exception in allNotices() of Notices");
            e.printStackTrace();
        }

    }

    private void marqueeNotices() {
        try {

            System.out.println("In marqueeNotices()");

            resultSet = statement.executeQuery("SELECT * FROM enotice.notice ORDER BY importancy DESC, date DESC limit 5;");
            marqueeNoOfNotices = 0;

            while (resultSet.next()) {

                marqueeTitleArray[marqueeNoOfNotices] = resultSet.getString("title");
                marqueeDescriptionArray[marqueeNoOfNotices] = resultSet.getString("description");
                marqueeDateArray[marqueeNoOfNotices] = resultSet.getString("date");
                marqueeFileNameArray[marqueeNoOfNotices] = resultSet.getString("filename");
                marqueeCategoryArray[marqueeNoOfNotices] = resultSet.getString("category");

                ++marqueeNoOfNotices;
            }
        } catch (Exception e) {
            System.out.println("Exception in marqueNotices() of Notices");
            e.printStackTrace();

        }
    }
}
