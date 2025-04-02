package SQL;

import java.sql.Connection;
import java.sql.DriverManager;

public class KetNoi {
	public static Connection cn;
    public void ketnoi() throws Exception {
       try {
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           System.out.println("OK Drive");
           String url ="jdbc:sqlserver://LAPTOP-2B6EIEVV:1433;databaseName=QLMyPham;user=sa; password=123";
           cn = DriverManager.getConnection(url);
           System.out.println("OK");
       } catch (Exception e) {
           e.printStackTrace();
       }
              
   }
}
