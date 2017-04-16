<%@ page import="model.homeFeeds" %>
<%@ page import="model.profile" %>
<%@ page import="model.getComments" %>
<%@ page import="java.util.*" %>
<%@ include file="common_frame.jsp"%>

<%@ include file="menu_frame.jsp"%>	
        <aside class="right-side">

	     
		 
<% 
//session id goes here.
//int session_id=3;
Object profile_id;
profile_id=(Object) request.getAttribute("profile");
HttpSession session1 = request.getSession();
Object session_id=session1.getAttribute("UID");

%>
 <section class="content">



<div class="col-xs-12" style="padding-top: 10px;">
   <div class="box">
      <div class="box-body table-responsive">
	<div class="msg-of-day-index">
	<div id="w0">	    <style>
.glyphicon-remove-circle {
  color : #C9302C;
}
.glyphicon-ok-circle {
  color : #449D44;
}
</style>


<form action="message.jsp">
                        <h1>Send New Message </h1><br>
                        
                        <input type="textarea" name="message" placeholder="Enter your message" /><br>
                        <button type="send">SEND</button>
            </form>
</div>
	</div>
      </div>
   </div>
</div>
    </section>