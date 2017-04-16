package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HomeDAO;
import dao.ProfileDAO;
import model.homeFeeds;
import model.myprofile;

/**
 * Servlet implementation class profileController
 */
@WebServlet("/profileController")
public class profileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HomeDAO homedao=new HomeDAO();
		@SuppressWarnings("unchecked")
		String idd=request.getParameter("id");
		int id=Integer.parseInt(request.getParameter("id"));
		ArrayList<homeFeeds> array=homedao.myStatus(id);
		System.out.println("In Controller");
		ProfileDAO profile=new ProfileDAO();
		ArrayList<myprofile> myprofile=new ArrayList<myprofile>();
		 myprofile= profile.getProfile(id);
		 System.out.println("In"+myprofile.size());
		 System.out.println("In"+myprofile.get(0).getFname());
		 PrintWriter writer = response.getWriter();
		
		//System.out.println(array.get(0).Content);
		//System.out.println(array.get(1).Content);
		request.setAttribute("feedlist", array);
		request.setAttribute("myprofile", myprofile);
		System.out.println("id is" + id);
		request.setAttribute("profile",id);
		System.out.println("id is" + id);	
		HttpSession session = request.getSession();
		Object sessionid=session.getAttribute("UID");
		String Url="/profile.jsp?id1="+idd;
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher(Url);
		System.out.println("redirectedw");
		rd.forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
