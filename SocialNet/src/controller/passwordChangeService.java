package controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class passwordChangeService
 */
@WebServlet(description = "inserts changed password in database", urlPatterns = { "/passwordChangeService" })
public class passwordChangeService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = changePasswordController.usr_rec_Email;
		String password = request.getParameter("new_password");

		int rs = 10;

		boolean indicator = false;
		
		try{
			System.out.println("2");
			System.out.println("email : " + email);
			System.out.println("password : " + password);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bumpy","root","");
			Statement st= (Statement) con.createStatement();
			System.out.println("3");
			rs = st.executeUpdate("UPDATE users SET password='"+password+"' WHERE users.email='" + email + "'");
			System.out.println("4");
			if(rs==1){
				indicator=true;
			}
			else{
				indicator=false;
			}
     
     } catch (Exception e){}
		
     if(indicator){
    	
    	 RequestDispatcher rd=request.getRequestDispatcher("main.jsp");  
         rd.forward(request, response);  
        
     }  
        else{  
            RequestDispatcher rd=request.getRequestDispatcher("some-error-in-changing password.html");  
            rd.forward(request, response);  
        }  
     
     System.out.println("indi : " + indicator);
		
	}
	

}
