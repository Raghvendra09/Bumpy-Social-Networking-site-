package dao;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.Statement;
//import java.util.Date;

public class StatusDao {
	private int rs;
    private String indicator="";
    Connection con=null;
	//	 ResultSet rst=null;
		 Statement stmt=null;
    public String addStatus(String status, int id){
    	try{
    		System.out.println("in dao");
    		System.out.println("in dao"+status+" "+id);
    		Class.forName("com.mysql.jdbc.Driver");
    	 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
    		 stmt= (Statement) con.createStatement();
    	int	rs = stmt.executeUpdate("INSERT INTO posts (text,posterId) VALUES('"+status+"','"+id+"')");
    		if(rs>0){
    			indicator="Status Updated";
    			System.out.println("true");
    		}
    		else{
    			indicator= "Status Not Updated. Try Again!" ;
    			System.out.println("false");
    		}
     
     } catch (Exception e){}
    	
    	return indicator;
    }

}
