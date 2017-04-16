package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.sendEmail;

/**
 * Servlet implementation class forgotPasswordController
 */
@WebServlet(description = "takes email id and sends change password link to email id", urlPatterns = { "/forgotPassword" })
public class forgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String recovery_email[] = {request.getParameter("recovery_email")};
		String rec_email = recovery_email[0];
		ResultSet rs;
		boolean indicator = false;
		String content = "<!DOCTYPE html><html><head></head><body><center><h1 style='color:red;'>BUMpy</h1>"
				+ "<h3>Click the link below to change your account passsword</h3>"
				+ "<a href=\"http://localhost:8080/BUMpy/changePassword?q=" + rec_email +"\">Click here to change your account password now</a><br /><br /></center></body></html>";
				
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
			Statement st= (Statement) con.createStatement();
			rs = st.executeQuery("SELECT email from users WHERE email='" + rec_email + "'");
			if(rs.next()){
				indicator=true;
			}
			else{
				indicator=false;
			}
     
     } catch (Exception e){System.out.println("Hello forgotController : " + e.getMessage());}
     if(indicator){
    	 	try {
				sendEmail.sendEmailTo(recovery_email,"BUMpy - Change Password Link",content);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
			System.out.println("error forgot Password : " + e.getMessage());
			}
            RequestDispatcher rd=request.getRequestDispatcher("checkYourEmail.html");  
            rd.forward(request, response);  
        }  
        else{  
            RequestDispatcher rd=request.getRequestDispatcher("incorrect-recovery-email-error.html");  
            rd.forward(request, response);  
        }  

		
	}

}
