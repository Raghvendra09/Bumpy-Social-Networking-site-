package controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class activateAccountController
 */
@WebServlet(description = "activates account", urlPatterns = { "/activate" })
public class activateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String email = request.getParameter("q");
		
		int rs = 10;

		boolean indicator = false;
		
		System.out.println("email : " + email);
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
			Statement st= (Statement) con.createStatement();
			
			rs = st.executeUpdate("UPDATE users SET activated='1' WHERE email='" + email + "'");
			
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

