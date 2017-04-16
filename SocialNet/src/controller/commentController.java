package controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Status;
import model.comment;

/**
 * Servlet implementation class commentController
 */
@WebServlet("/commentController")
public class commentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 response.setContentType("text/html");
		 PrintWriter out = response.getWriter();
		 String my_status=request.getParameter("val");
		 String my_id=request.getParameter("id");
		 int id=Integer.parseInt(my_id);
		 String post_id=request.getParameter("post");
		 int p_id=Integer.parseInt(post_id);
		 //out.println("in servlet");
		 //out.println(my_status);
		 //out.println(my_id);
		// Date date= new Date();
		 comment newcomment = new comment();
		// status.setDate(date);
		 newcomment.setID(id);
		 newcomment.setPost_ID(p_id);
		 newcomment.setComment(my_status);
		 dao.HomeDAO commentDao = new dao.HomeDAO();
		 String results=commentDao.addComment(newcomment.getComment(),newcomment.getID(),newcomment.getPost_ID());
				 out.println(results);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
