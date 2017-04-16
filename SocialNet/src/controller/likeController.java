package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HomeDAO;

/**
 * Servlet implementation class likeController
 */
@WebServlet("/likeController")
public class likeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		//out.println("Liked");
		int pid=Integer.parseInt(request.getParameter("id"));
		int post=Integer.parseInt(request.getParameter("post"));
		
		HomeDAO homedao=new HomeDAO();
		homedao.addLike(pid, post);
		//RequestDispatcher rd = getServletContext().getRequestDispatcher("/home.jsp");
		System.out.println("redirected from like to home");
		//rd.forward(request, response);
		HttpSession session = request.getSession();

		response.sendRedirect("homeController?id="+session.getAttribute("UID"));
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
