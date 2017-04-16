<%
/*include_once("php_includes/check_login_status.php");

//if($_SESSION['userType'] == 'admin'){
   // $img = 'img/profile/admin/'.$_SESSION['userid'] . '.jpg';
  //  $img1 = 'img/profile/admin/admin.png';
//}else if($_SESSION['userType'] == 'student'){
  //  $img1 = 'img/profile/student/'.$_SESSION['userid'] . '.jpg';
//}else if($_SESSION['userType'] == 'faculty'){
  //  $img1 = 'img/profile/faculty/'.$_SESSION['userid'] . '.jpg';
  }*/

%>
<%



 %>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <meta name="Keywords" content="edusec,edusec4,rudra softech,open source development in ahmedabad, college management software,college management system,education management software,school management system,school management software">
<meta name="Description" content="Software development company for open source technology in Ahmedabad. Provide Enterprise solution and quality services.">
<meta property="og:locale" content="en_US">
<meta property="og:title" content="Rudra Softech - Provide Enterprise Solution | Development on open source technology | College Management Software | School Management Software">
<meta property="og:description" content="Core functions like admissions, library management, transport management, students attendance in short entire range of university functions can be well performed by EduSec">
<meta property="og:image" content="http://www.rudrasoftech.com/rudra.png">

        <link rel="shortcut icon" href="http://localhost:8081/CMS/img/rudrasoftech_favicon.png" type="image/x-icon">
        <meta name="csrf-param" content="_csrf">
    <meta name="csrf-token" content="TVMxNURoTUUdBl54LDd6LQ48CUcAPy82fhdWdzAxPiYfKUcGMSo8Jw==">
        <title>BUMpy</title>
          <link href="css/bootstrap.css" rel="stylesheet">

<link href="css/fullcalendar.print.css" rel="stylesheet" media="print">
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/fullcalendar.css" rel="stylesheet">
<link href="css/AdminLTE.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="css/ionicons-2.0.1/css/ionicons.min.css" rel="stylesheet">
<link href="css/bootstrap-multiselect.css" rel="stylesheet">
<link href="css/EdusecCustome.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/yii.js"></script>
<script src="js/AdminLTE/app.js"></script>
<script src="js/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="js/bootstrap-multiselect.js"></script>
<script src="js/custom-delete-confirm.js"></script>
<script src="js/bootbox.js"></script>
<script src="js/bootstrap.file-input.js"></script>
<script src="js/bootstrapx-clickover.js"></script></head>
<script>

function checkSearch(){
	
	var searchBar = document.getElementById("search");
	
	if(searchBar.value == ""){
		
		searchBar.style.borderColor="red";
		searchBar.value = "Empty";
		searchBar.style.color="red";
		return false;
		
	}else{
		
		searchBar.style.borderColor="#ccc";
		searchBar.style.color="black";
		
		window.location="peopleList?search="+searchBar.value;
		
		
	}
	
}

</script>
    <style type="text/css">
    .aaa:hover{
        color:#aaa;
    }
    </style>
    <body class="skin-black">


<header class="header">

<a class="logo" href="home.jsp"><!--img src="img/edusec.png" alt="" height="22px" width="120px;"--><h3>BUMpy</h3></a>

<nav class="navbar navbar-static-top" role="navigation">

<div class="navbar-right">

<ul class="nav navbar-nav">


<li><input type="text" class="form-control" style="margin-top: 8px;" id="search" name="search" placeholder="Search People..." 
onfocus="this.value='';"></li>


<li>

<a href="html.html" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false" title="Main Menu" onclick="checkSearch()">
<i class="fa fa-search"></i>
    </a>
    
</li>




<!-- Notifications: style can be found in dropdown.less -->
<li class="dropdown notifications-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <i class="fa fa-bell-o"></i>
        <span class="label label-warning">0</span>
    </a>
    <ul class="dropdown-menu">

        <li class="header">You have No  notifications</li>
      </ul>
</li>


    <li class="dropdown user user-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="glyphicon glyphicon-user"></i>
            <span><%= session.getAttribute("NAME") %></span>
        </a>
        <ul class="dropdown-menu" style="margin-right:10px">
            <!-- User image -->
            <li class="user-header bg-light-blue">
                <img src="Here comes session id" class="img-circle" alt="User Image">

                <p style="font-size: 18px;">
                    <%= session.getAttribute("NAME") %>
                     </p>
            </li>
            <!-- Menu Body -->
            <li class="user-body" style="display:none">
                <div class="col-xs-6 no-padding">
		    <a class="btn btn-default btn-flat" href="Admin Dashboard.htm" style="font-size:13px">View Profile</a>                </div>
            </li>
            <!-- Menu Footer-->
            <li class="user-footer">
                <div class="pull-left">
		    <a class="btn btn-default btn-flat" href="resetPassword.html" style="font-size:12px">Change Password</a>                </div>
                <div class="pull-right">
                    <a class="btn btn-default btn-flat" href="logout.jsp" style="font-size:12px">Sign out</a>                </div>
            </li>
        </ul>
    </li><!-- User Account: style can be found in dropdown.less -->

</ul>

</div>
</nav>
</header>
