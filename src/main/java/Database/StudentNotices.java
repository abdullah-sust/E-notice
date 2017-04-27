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
import java.util.HashMap;

/**
 *
 * @author Moqsadur Rahman
 */
public class StudentNotices {

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
    public static int positionArray[] = new int[500];
    public static HashMap<String, Integer> myMap = new HashMap<String, Integer>();
    public static int preference[] = new int[20];
    public static String categoryStore[] = new String[20];

    //for marquee
    public static int marqueeNoOfNotices;
    public static String marqueeTitleArray[] = new String[5];
    public static String marqueeDescriptionArray[] = new String[5];
    public static String marqueeDateArray[] = new String[5];
    public static String marqueeFileNameArray[] = new String[5];
    public static String marqueeCategoryArray[] = new String[5];

    public StudentNotices() throws SQLException, ClassNotFoundException {
        System.out.println("before");
        Class.forName("com.mysql.jdbc.Driver");
        dbconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotice", "root", "1234");
        statement = dbconnection.createStatement();
        System.out.println("after");
    }

    static {
        myMap.put("Event", 0);
        myMap.put("Hall", 1);
        myMap.put("IICT", 2);
        myMap.put("Library", 3);
        myMap.put("Medical", 4);
        myMap.put("Registry Office", 5);
        myMap.put("Result", 6);
        myMap.put("Scholarship", 7);
        myMap.put("Society", 8);
        myMap.put("Sports", 9);
        myMap.put("Vacation", 10);
        myMap.put("Others", 11);

        categoryStore[0] = "Event";
        categoryStore[1] = "Hall";
        categoryStore[2] = "IICT";
        categoryStore[3] = "Library";
        categoryStore[4] = "Medical";
        categoryStore[5] = "Registry Office";
        categoryStore[6] = "Result";
        categoryStore[7] = "Scholarship";
        categoryStore[8] = "Society";
        categoryStore[9] = "Sports";
        categoryStore[10] = "Vacation";
        categoryStore[11] = "Others";
    }

    public void allNotices(String category, String studentId, String search) {
        try {

            preference(studentId);

            System.out.println(category + " " + studentId);

            resultSet = statement.executeQuery("SELECT * FROM enotice.notice ORDER BY date DESC;");

            noOfNotices = 0;

            search = search.toLowerCase();
            search = search.replaceAll(" ", "");

            System.out.println("Priniting StudentNotice Array.........");

            while (resultSet.next()) {
                if (resultSet.getString("category").equals(category) || category.equals("All")) {

                    System.out.println(resultSet.getString("category") + "_________________" + myMap.get(resultSet.getString("category")));

                    if (preference[myMap.get(resultSet.getString("category"))] == 1) {

                        String title = resultSet.getString("title");
                        title = title.toLowerCase().replaceAll(" ", "");

                        if (title.contains(search)) {
                            System.out.println(resultSet.getString("category") + "*************" + myMap.get(resultSet.getString("category")));
                            titleArray[noOfNotices] = resultSet.getString("title");
                            descriptionArray[noOfNotices] = resultSet.getString("description");
                            importancyArray[noOfNotices] = resultSet.getString("importancy");
                            dateArray[noOfNotices] = resultSet.getString("date");
                            fileNameArray[noOfNotices] = resultSet.getString("filename");
                            categoryArray[noOfNotices] = resultSet.getString("category");

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
            }

            System.out.println("StudentNotice Array Printing is completed.........");

            marqueeNotices();

        } catch (Exception e) {
            System.out.println("Exception in allNotices() of Notices");
            e.printStackTrace();
        }

    }

    private void marqueeNotices() {
        try {

            System.out.println("In marqueeNotices() of StudentNottices");

            resultSet = statement.executeQuery("SELECT * FROM enotice.notice ORDER BY importancy DESC, date DESC;");
            marqueeNoOfNotices = 0;

            while (resultSet.next() || (marqueeNoOfNotices < 5)) {
                if (preference[myMap.get(resultSet.getString("category"))] == 1) {
                    marqueeTitleArray[marqueeNoOfNotices] = resultSet.getString("title");
                    marqueeDescriptionArray[marqueeNoOfNotices] = resultSet.getString("description");
                    marqueeDateArray[marqueeNoOfNotices] = resultSet.getString("date");
                    marqueeFileNameArray[marqueeNoOfNotices] = resultSet.getString("filename");
                    marqueeCategoryArray[marqueeNoOfNotices] = resultSet.getString("category");

                    ++marqueeNoOfNotices;
                }
            }
        } catch (Exception e) {
            System.out.println("Exception in marqueNotices() of Notices");
            e.printStackTrace();

        }
    }

    private void preference(String studentId) {
        try {
            resultSet = statement.executeQuery("SELECT * FROM enotice.category where user_id = " + studentId + ";");
            System.out.println("------------------------------PREFERENCE---------------------------------------------\n");
            while (resultSet.next()) {
                for (int i = 0; i < 12; ++i) {
                    preference[i] = Integer.parseInt(resultSet.getString(categoryStore[i]));
                    System.out.println("i : " + preference[i]);
                }
            }
        } catch (Exception e) {
            System.out.println("Exception in prefernce()");
            e.printStackTrace();
        }
    }
}
