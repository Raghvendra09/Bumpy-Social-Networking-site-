package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NameDAO;
import model.LoginBean;


/**
 * Servlet implementation class loginController
 */
@WebServlet(description = "does server side login validation", urlPatterns = { "/loginChecker" })
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public loginController() {

    }

	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 response.setContentType("text/html");
		 PrintWriter out = response.getWriter();
		 String Email=request.getParameter("login_email");  
	     String password=request.getParameter("login_password"); 
	     LoginBean bean = new LoginBean();
	     bean.setEmail(Email);  
	     bean.setPassword(password);  
	     request.setAttribute("bean",bean);
	     dao.LoginDAO loginDAO = new dao.LoginDAO();
	     dao.NameDAO nameDAO= new NameDAO();
	     
	    if(loginDAO.loginCheck(bean.getEmail(), bean.getPassword())){  
	    		HttpSession session = request.getSession();
	    		session.setAttribute("NAME", nameDAO.getUsername(Email));
	    		session.setAttribute("EMAIL", nameDAO.getEmail());
	    		session.setAttribute("UID", nameDAO.getUserId());
	    		//out.println("Successful login : " + Email);
	    		
	    		//out.println("Session email : " + session.getAttribute("NAME"));
	    		//out.println("NameDAO username : " + nameDAO.getUsername(Email));
	    		//out.println("session.getId() : " + session.getId());
	            //RequestDispatcher rd=request.getRequestDispatcher("login-success.jsp");  
	    		//RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
	    		//rd.forward(request, response);
	    		response.sendRedirect("homeController");
	        }  
	        else{  
	            RequestDispatcher rd=request.getRequestDispatcher("login-error.html");  
	            rd.forward(request, response);  
	        }  
		
	}

}
