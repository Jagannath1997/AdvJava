package dao;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
    public static Connection getConn()throws Exception{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","library","library");
    }
}
