package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LoginBean;
import model.sendEmail;

/**
 * Servlet implementation class signUpController
 * created by Manish 
 * started on 11-11-2016
 */
@WebServlet(description = "inserts user data into database", urlPatterns = { "/signUp" })
public class signUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String gender = request.getParameter("gender");
		String bday = request.getParameter("bday");
		String email = request.getParameter("register_email");
		String password = request.getParameter("resister_password");
		String mob_no = request.getParameter("mob_no");
		
		LoginBean bean = new LoginBean();
	    bean.setEmail(email);  
	    bean.setPassword(password);  
	    request.setAttribute("bean",bean);
	    
	    RequestDispatcher rd;
	    
	    //String new_usr_email[]={email};
	    
	    //String content = "<!DOCTYPE html><html><head></head><body><center><h1 style='color:red;'>BUMpy</h1>"
			//	+ "<h3>Click the link below to activate your BUMpy account</h3>"
				//+ "<a href=\"http://localhost:8080/BUMpy/activate?q=" + email +"\">Click here to activate your account now</a><br /><br /></center></body></html>";
		
	    System.out.println("DATE : " + bday);
	    int rs = 10;
		PrintWriter Writer = response.getWriter();
		ResultSet res;
	    try{
	    Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		Statement st= con.createStatement();
		rs = st.executeUpdate("INSERT into users(firstName,lastName,dob,sex,email,password,mob) values('"+fname+"','"+lname+"','"+bday+"','"+gender+"','"+email+"','"+password+"','"+ mob_no +"')");
		} catch (Exception e){
			
			Writer.println("error : "+ e.getMessage() );}
		
		if(rs==1){
		/*	try {
				//sendEmail.sendEmailTo(new_usr_email,"BUMpy - Activate account",content);
			} catch (MessagingException e1) {
				System.out.println("error : " + e1.getMessage());
			}*/
	
		rd = request.getRequestDispatcher("checkYourEmailSignUp.html");
		rd.forward(request, response);
		}else{
			//System.out.println("6");
			rd = request.getRequestDispatcher("signup-error.html");
			rd.forward(request, response);
		}		    
		
		
	}

}
