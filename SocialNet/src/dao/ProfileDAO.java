package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.myprofile;

public class ProfileDAO {
	
    Connection con=null;
    ResultSet rs=null;
    Statement st=null;
    String indicator=null;
    ArrayList<myprofile> resultList = new ArrayList<myprofile>();

public ArrayList<myprofile> getProfile(int u_id){
	try{
	Class.forName("com.mysql.jdbc.Driver");
	 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
	 st= (Statement) con.createStatement();
	rs = st.executeQuery("SELECT firstName,lastName,dob,sex,email,mob FROM users WHERE u_id='"+u_id+"'");
	System.out.println("profile ");
	while(rs.next()){
		System.out.println("profile "+rs.getString("firstName"));
		resultList.add(new myprofile(rs.getString("firstName"),rs.getString("lastName"),rs.getString("sex"),rs.getString("dob"),rs.getString("email"),rs.getString("mob")));
		System.out.println("profiless "+rs.getString("firstName"));
	}
	} catch (Exception e){}
return resultList;
}	

public String addfriend(int pid,int uid){
	try{
		Class.forName("com.mysql.jdbc.Driver");
	 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		 st= (Statement) con.createStatement();
	int	rs = st.executeUpdate("INSERT INTO friends (p_id,f_id) VALUES('"+pid+"','"+uid+"')");
		if(rs>0){
			indicator="Friend Request Sent";
			System.out.println("true");
		
		}
		else{
			indicator= "Friend Request not sent" ;
			System.out.println("false");
		}
 
 } catch (Exception e){}	
	return indicator;
}
}
