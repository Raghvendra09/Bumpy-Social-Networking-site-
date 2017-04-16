package controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class changePasswordController
 */
@WebServlet(description = "changes user password when he clicks on", urlPatterns = { "/changePassword" })
public class changePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static String Email; 
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email_client = request.getParameter("q");
	    Email = email_client;
		RequestDispatcher rd = request.getRequestDispatcher("reset_password.html");
		
		rd.forward(request, response);				
	}
	
	public final static String usr_rec_Email = Email;

}
