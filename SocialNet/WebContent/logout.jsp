<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

if(session.getAttribute("NAME").equals(null)
		&& session.getAttribute("EMAIL").equals(null)
			&& session.getAttribute("UID").equals(null)){
	
	response.sendRedirect("bumpy_home.jsp");
	
}else{
	
	
	session.removeAttribute("NAME");
	session.removeAttribute("EMAIL");
	session.removeAttribute("UID");
	response.sendRedirect("bumpy_home.jsp");
}
			


%>