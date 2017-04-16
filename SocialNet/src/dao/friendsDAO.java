package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.friends;
import model.myprofile;

public class friendsDAO {
	Connection con=null;
    ResultSet rs=null;
    Statement st=null;
    String indicator=null;
    ArrayList<friends> resultList = new ArrayList<friends>();

public ArrayList<friends> getFriends(int p_id){
	try{
	Class.forName("com.mysql.jdbc.Driver");
	 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
	 st= (Statement) con.createStatement();
	rs = st.executeQuery("select p_id,f_id,firstName,lastName from friends,users where p_id='"+p_id+"' and f_id=u_id and status='pending'");
	System.out.println("profile ");
	while(rs.next()){
		//System.out.println("profile "+rs.getString("firstName"));
		String Name=rs.getString("firstName")+rs.getString("lastName");
		resultList.add(new friends(rs.getInt("p_id"),rs.getInt("f_id"),Name));
		//System.out.println("profiless "+rs.getString("firstName"));
	}
	} catch (Exception e){}
return resultList;
}	

public ArrayList<friends> myFriends(int p_id){
	try{
	Class.forName("com.mysql.jdbc.Driver");
	 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
	 st= (Statement) con.createStatement();
	rs = st.executeQuery("select p_id,f_id,firstName,lastName from friends,users where p_id='"+p_id+"' and f_id=u_id and status='Accepted'");
	System.out.println("profile ");
	while(rs.next()){
		//System.out.println("profile "+rs.getString("firstName"));
		String Name=rs.getString("firstName")+rs.getString("lastName");
		resultList.add(new friends(rs.getInt("p_id"),rs.getInt("f_id"),Name));
		//System.out.println("profiless "+rs.getString("firstName"));
	}
	} catch (Exception e){}
return resultList;
}	


public String acceptFriend(int pid,int fid,String status){
	try{
		Class.forName("com.mysql.jdbc.Driver");
	 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		 st= (Statement) con.createStatement();
	int	rs = st.executeUpdate("update friends set status='"+status+"' WHERE p_id='"+pid+"' and f_id='"+fid+"'");
		if(rs>0){
			indicator="Accepted";
			System.out.println("true");
		}
		else{
			indicator= " Try Again!" ;
			System.out.println("false");
		}
 
 } catch (Exception e){}
return indicator;
}	

}
