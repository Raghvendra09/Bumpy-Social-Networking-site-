package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmailPasswordBean;
import model.Status;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 response.setContentType("text/html");
		 PrintWriter out = response.getWriter();
		 String my_status=request.getParameter("val");
		 String my_id=request.getParameter("id");
		 int id=Integer.parseInt(my_id);
		 //out.println("in servlet");
		 //out.println(my_status);
		 //out.println(my_id);
		// Date date= new Date();
		 Status status = new Status();
		// status.setDate(date);
		 status.setID(id);
		
		 status.setStatus(my_status);
		 dao.StatusDao statusDao = new dao.StatusDao();
		 String results=statusDao.addStatus(status.getStatus(),status.getID());
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
