package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class NameDAO {


	public ResultSet rs;
    public String name="";
    public String email="";
    public String temp1="";
    public String temp2="";
    public String user_id="";
//	@SuppressWarnings("unused")
    
	public String getUsername(String EMAIL){
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		Statement st= (Statement) con.createStatement();
		rs = st.executeQuery("SELECT u_id,firstName,lastName from users WHERE email='" + EMAIL + "'");
		//System.out.println("SELECT firstName,lastName from users WHERE email='" + EMAIL + "'");
		if(rs.next()){
			temp1=rs.getString("firstName");
			temp2=rs.getString("lastName");
			name = temp1 +  " " +temp2;
			this.email=EMAIL;
			this.user_id= rs.getString("u_id");
			//System.out.println("NAME : " + name);
			return name;
		}
		else{
			name="Unknown";
			return name;
		}
 
 } catch (Exception e){}
	
	return name;

	}
	

	public String getEmail(){

		return this.email;
	
	}
	
	
	public String getUserId(){

		return this.user_id;
	
	}

}
