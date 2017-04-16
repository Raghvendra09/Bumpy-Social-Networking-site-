<%@ include file="common_frame.jsp"%>
<%@ page import="model.homeFeeds" %>
<%@ page import="model.profile" %>
<%@ page import="model.myprofile" %>
<%@ page import="model.getComments" %>
<%@ page import="java.util.*" %>
<%@ include file="menu_frame.jsp"%>	
        <aside class="right-side">

<% int f_id=Integer.parseInt(request.getParameter("id1")); %>
   <section class="content">
<% 
//session id goes here.
//int session_id=3;
//Object profile_id;
HttpSession session1 = request.getSession();
Object profile_id=session1.getAttribute("UID");

%>


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
<!-- code fsor right hand side goes here -->
<div class="col-xs-12 col-lg-12">
  <div class="box-success box view-item col-xs-12 col-lg-12">
    <div class="stu-master-form">
    <form id="stu-master-form" action="#" method="post">
<input type="hidden" name="_csrf" value="NHBnY0dyWktnPD8oLyEJHQxdBCkjNmonZ0hXAHEzKxplIg0GMUEbBQ==">    
  
    <div class="box box-solid box-info col-xs-12 col-lg-12 no-padding">
      <div class="box-header with-border">
         <h4 class="box-title"><i class="fa fa-info-circle"></i>Personal Details</h4>
      </div>
    <div class="box-body">

  <%
  ArrayList<myprofile> list1 = new ArrayList<myprofile>();
//storing passed value from jsp
list1 = (ArrayList<myprofile>) request.getAttribute("myprofile");
 
%>

<script>
//ajax for comment
function sendFriend(p_id,u_id)  
{
//	var v=document.getElementById(n).value;  
//alert(p_id);
//alert(u_id);
//alert(v);

var url="addFriendController?id="+p_id+"&uid="+u_id;  
//alert("2"); 
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
	
request.onreadystatechange=getFriend;  
//alert("3");
request.open("GET",url,true);  
//alert("4");
request.send(); 
//alert("5");
}catch(e){alert("Unable to connect to server");}  
}  
function getFriend(){  
	
	if(request.readyState==4){  
	var val1=request.responseText;  
	alert(val1);
	//redirect();
	//document.getElementById(id).value=val1;  
	//desc(id);
	}  
	}
</script>
   
   <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
     <div class="col-xs-12 col-sm-4 col-lg-4">
  <div class="form-group field-stuinfo-stu_first_name">
<label class="control-label" for="stuinfo-stu_first_name">First Name</label><input type="text" id="stuinfo-stu_first_name" class="form-control" name="firstname" value="<% out.println(list1.get(0).getFname()); %>" readonly><div class="help-block"></div>
</div>    </div>
    <div class="col-xs-12 col-sm-4 col-lg-4">
  <div class="form-group field-stuinfo-stu_last_name ">
<label class="control-label" for="stuinfo-stu_last_name">Last Name</label><input type="text" id="stuinfo-stu_last_name" class="form-control" name="lastname" value="<% out.println(list1.get(0).getLname());%>" readonly><div class="help-block"></div>
</div>    </div>
    <div class="col-xs-12 col-sm-4 col-lg-4">
  <div class="form-group field-stuinfo-stu_mobile_no">
<label class="control-label" for="stuinfo-stu_mobile_no">Mobile No</label><input type="text" id="stuinfo-stu_mobile_no" class="form-control" name="s_mob_no" maxlength="10" value="<% out.println(list1.get(0).getMob());%>" readonly><div class="help-block"></div>
</div>    </div>
<div class="col-xs-12 col-sm-4 col-lg-4">
  <div class="form-group field-stuinfo-stu_gender">
<label class="control-label" for="stuinfo-stu_gender">Gender</label><input type="text" id="stuinfo-stu_mother_name" class="form-control" name="gender" value="<% out.println(list1.get(0).getGender());%>" readonly><div class="help-block"></div>
</div>    </div>
<div class="col-xs-12 col-sm-4 col-lg-4">
  <div class="form-group field-stuinfo-stu_gender">
<label class="control-label" for="stuinfo-stu_gender">Date of Birth</label><input type="text" id="stuinfo-stu_mother_name" class="form-control" name="gender" value="<% out.println(list1.get(0).getDob());%>" readonly><div class="help-block"></div>
</div>    </div>

<div class="col-xs-12 col-sm-4 col-lg-4">
  <div class="form-group field-stuinfo-stu_email_id">
<label class="control-label" for="stuinfo-stu_email_id">Email</label><input type="text" id="stuinfo-stu_email_id" class="form-control" name="guardian_email" maxlength="60" value="<% out.println(list1.get(0).getEmail());%>" readonly><div class="help-block"></div>
</div>    </div>
 
<div>
<input type="button" value="Add Friend" onclick="sendFriend('<%=profile_id %>','<%=f_id %>')">
</div>
   </div>
 </div>
<div class="col-xs-12" style="padding-top: 10px;">
<div class="box">
      <div class="box-body table-responsive">
	<!-- timeline goes here -->
	
	
<script>
//ajax for comment
function sendComment(n,p_id,postid)  
{
	var v=document.getElementById(n).value;  
//alert(p_id);
//alert(postid);
//alert(v);

var url="commentController?val="+v+"&id="+p_id+"&post="+postid;  
//alert("2"); 
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
	
request.onreadystatechange=getcomment;  
//alert("3");
request.open("GET",url,true);  
//alert("4");
request.send(); 
//alert("5");
}catch(e){alert("Unable to connect to server");}  
}  
function getcomment(){  
	
	if(request.readyState==4){  
	var val1=request.responseText;  
	alert(val1);
	redirect();
	//document.getElementById(id).value=val1;  
	//desc(id);
	}  
	}

//ajax for comment ends here
//ajax for add status goes here
function sendinfo(n,idd)  
{  
var v=document.getElementById(n).value;  
 //alert(v);
 var id1=idd;
var url="UpdateStatus?val="+v+"&id="+id1;  
//alert("2"); 
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
	
request.onreadystatechange=getInfo;  
//alert("3");
request.open("GET",url,true);  
//alert("4");
request.send(); 
//alert("5");
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
	
if(request.readyState==4){  
var val1=request.responseText;  
alert(val1);
redirect();
//document.getElementById(id).value=val1;  
//desc(id);
}  
}  


function sendInfo()  
{  
 var id=3;
var url="homeController?id="+id;  
//alert("2"); 
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
	
request.onreadystatechange=getinfo;  
//alert("3");
request.open("GET",url,true);  
//alert("4");
request.send(); 
//alert("5");
}catch(e){alert("Unable to connect to server");}  
}

function redirect(){
	
	 window.location="profileController?id="+<%=profile_id %>;
}

  
function getinfo(){  
	
if(request.readyState==4){  
var val1=request.responseText;  
//alert(val1);
//document.getElementById(id).value=val1;  
//desc(id);
}  
}
function hello(){
	
	alert("hello");
}

//window.onload=redirect();
</script>
    <div class="col-xs-12">
  <div class="col-lg-4 col-sm-4 col-xs-12 no-padding"><h3 class="box-title"><i class="fa fa-plus"></i> ADD Status</h3></div>
  
</div>
<div class="col-xs-12 col-lg-12">
  <div class="box-success box view-item col-xs-12 col-lg-12">

<span>Add status</span>
<br>
<br>
<textarea id="status" class="form-control" required name="add_status" maxlength="200" placeholder="Whats on your mind ?"></textarea>
<br>
<div class="col-xs-4 left-padding">
	<input type="button" class="btn btn-block btn-success btn-group-sm" size="small" onclick="sendinfo('status','<%=profile_id %>')" value="Post">	</div>
   </div>

</div>
<br><br>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<!-- Table start here -->

<%

ArrayList<homeFeeds> list = new ArrayList<homeFeeds>();
//storing passed value from jsp
list = (ArrayList<homeFeeds>) request.getAttribute("feedlist");
//out.print(list.size());
int p_id=3;
for(int i = 0; i < list.size(); i++) {
//out.print(list.size());
//category = list.get(i);


%>
<div>
<table class="table table-striped table-bordered"><thead>
<tr><th> <%  out.println(list.get(i).Name); %></th></tr>
<tbody>
 
<tr>
<td> <% out.println(list.get(i).Content); %></td>
</tr>
<tr>
<table class="table table-striped table-bordered">
<tr>
<td>
<% int post_id=list.get(i).post_id; %>
<a href="likeController?id=<%= p_id %>&post=<%=post_id %>" >Likes :</a> <% out.println(list.get(i).no_of_likes); %></td>
<td>Comments : <%out.println(list.get(i).no_of_comment); %></td>
</tr>
</table>

</tr>
<table class="table table-striped table-bordered">
<tr><td>Likes By : <a href="#"> <% 

ArrayList<profile> name= list.get(i).myprofile;
for(int j=0;j<name.size();j++){
out.println(name.get(j).Name+"  "); 

}

%></a>  </td></tr>
</table>
<table class="table table-striped table-bordered">
<tr><td>
<input type="textarea" id="<%=list.get(i).post_id %>" placeholder="write your comment here">
<input type="button" value="Post" onclick="sendComment('<%=list.get(i).post_id %>','<%=profile_id %>','<%=list.get(i).post_id %>')" >
</td></tr>
</table>

<table class="table table-striped table-bordered">
<%

ArrayList<getComments> name1= list.get(i).comments;
for(int j=0;j<name1.size();j++){

%>
<tr><td><a href="#"> <% out.println(name1.get(j).fname +" : ");%></a> <% out.println(name1.get(j).comment );%> </td></tr>
<%
}
%>
</table>

</tbody>
</table>
</div>
<br>
<br>

<%

}
%>
<br>
<!-- table end here -->
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
        <strong>Copyright © 2016 <a >Web Tech</a>.</strong> All rights reserved.
      </div>
    </footer>

</aside>


	
      </div>
    <script src="js/yii_002.js"></script>
<script src="js/jquery_002.js"></script>
<script type="text/javascript">jQuery(document).ready(function () {
$("a.toggle-column").on("click", function(e) {
    e.preventDefault();
    $.post($(this).attr("href"), function(data) {
        var pjaxId = $(e.target).closest(".grid-view").parent().attr("id");
        $.pjax.reload({container:"#" + pjaxId});
    });
    return false;
});
jQuery('#w1').yiiGridView({"filterUrl":"/CMS/index.php?r=dashboard%2Fmsg-of-day%2Findex","filterSelector":"#w1-filters input, #w1-filters select"});
jQuery(document).pjax("#w0 a", "#w0", {"push":false,"replace":false,"timeout":1000,"scrollTo":false});
jQuery(document).on('submit', "#w0 form[data-pjax]", function (event) {jQuery.pjax.submit(event, '#w0', {"push":false,"replace":false,"timeout":1000,"scrollTo":false});});
});</script>    
    
    </body></html>
