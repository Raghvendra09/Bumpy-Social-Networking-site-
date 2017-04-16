package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.peopleList;

public class SearchDAO {
	
	private ResultSet rs;
    private peopleList p;
//	@SuppressWarnings("unused")
	public ArrayList<model.peopleList> getUsersRelatedTo(String query){
		ArrayList<model.peopleList> pl = new ArrayList<>();
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		Statement st= (Statement) con.createStatement();
		
		rs = st.executeQuery("SELECT u_id, firstName, lastName from users WHERE firstName LIKE '%" + query +  "%' or lastName LIKE '%" + query +  "%'");
		
		while(rs.next()){
			
			p = new model.peopleList(Integer.parseInt(rs.getString("u_id")), (rs.getString("firstName")), (rs.getString("lastName")));
			
			pl.add(new model.peopleList(Integer.parseInt(rs.getString("u_id")), (rs.getString("firstName")), (rs.getString("lastName"))));
		
		}
		
		//System.out.println("Added : " + pl.size());
		
		
		
		
 } catch (Exception e){System.out.println("Error searchDAO : " + e.getMessage());}
	
	//return null;
	return pl;
	}
	
	
}
