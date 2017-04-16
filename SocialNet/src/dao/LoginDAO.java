package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginDAO {
	
	private ResultSet rs;
    private boolean indicator=false;
//	@SuppressWarnings("unused")
	public boolean loginCheck(String email, String password){
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		Statement st= (Statement) con.createStatement();
		rs = st.executeQuery("SELECT email,password from users WHERE email='" + email + "' AND password='" + password + "'");
		if(rs.next()){
			indicator=true;
		}
		else{
			indicator=false;
		}
 
 } catch (Exception e){}
	
	return indicator;

	}
}
