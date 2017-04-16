package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HomeDAO;
import model.homeFeeds;

/**
 * Servlet implementation class homeController
 */
@WebServlet("/homeController")
public class homeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public homeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//int id=Integer.parseInt(request.getParameter("id"));
		HomeDAO homedao=new HomeDAO();
		@SuppressWarnings("unchecked")
		ArrayList<homeFeeds> array=homedao.getStatus();
		
		PrintWriter writer = response.getWriter();
		
		//System.out.println(array.get(0).Content);
		//System.out.println(array.get(1).Content);
		request.setAttribute("feedlist", array);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
		int feedsize=array.size();
		System.out.println(feedsize);
		System.out.println("redirectedw");
		
		rd.forward(request, response);
		
		
		//request.setAttribute("feedlist", array);
		//request.getRequestDispatcher("/home.jsp").forward(request, response);
		
		//writer.println(name);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
