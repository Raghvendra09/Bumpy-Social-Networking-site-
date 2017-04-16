<%@ page import="model.getComments" %>
<%@ page import="model.friends" %>
<%@ page import="java.util.*" %>
<%@ include file="common_frame.jsp"%>

<%@ include file="menu_frame.jsp"%>	
      <aside class="right-side">
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
<script>
function accept1(pid,uid){
	//alert(pid);
	//alert(uid);
	 window.location="acceptFriendController?id="+pid+"&uid="+uid+"&status=Accepted";
	
}
function reject1(pid,uid){
	//alert(pid);
	//alert(uid);
	 window.location="acceptFriendController?id="+pid+"&uid="+uid+"";
	
}

function hello(){
	alert("hello");

}


</script>
<%
ArrayList<friends> list1 = new ArrayList<friends>();
//storing passed value from jsp
list1 = (ArrayList<friends>) request.getAttribute("friendlist");

%>

<!-- Code start here -->
<table class="table table-striped table-bordered">
<% 
for(int i=0;i<list1.size();i++){
%>
<tr>
<td><% out.println(list1.get(i).Name); %></td>
<td><input type="button" value="Accept" onclick="accept1('<%=list1.get(i).pid %>','<%=list1.get(i).fid %>')" >
<input type="button" value="Reject" onclick="reject1('<%=list1.get(i).pid %>','<%=list1.get(i).fid %>')" >
</td>
</tr>
<%
}
%>
</table>
</div>
	</div>
      </div>
   </div>
</div>
    </section>
     <footer class="edusec-main-footer">
      <div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
        <div class="pull-right hidden-xs">
          <!--b>Version</b> 3.0 -->
        </div>
        <strong>Copyright © 2016 <a >Web-Tech</a>.</strong> All rights reserved.
      </div>
    </footer>

</aside>
    
