
<%

//include_once("php_includes/check_login_status.php");

//if($_SESSION['userType'] == 'admin'){
   // $img = 'img/profile/admin/'.$_SESSION['userid'] . '.jpg';
  //  $img = 'img/profile/admin/admin.png';
//}else if($_SESSION['userType'] == 'student'){
  //  $img = 'img/profile/student/'.$_SESSION['userid'] . '.jpg';
//}else if($_SESSION['userType'] == 'faculty'){
  //  $img = 'img/profile/faculty/'.$_SESSION['userid'] . '.jpg';
//}


//?>


Object sessionid=session.getAttribute("UID");
%>
<!--button><a href='logout.php'>Logout</a></button-->


    <div class="wrapper row-offcanvas row-offcanvas-left">

           <aside class="left-side sidebar-offcanvas">

    <section class="sidebar">

                    <div class="user-panel">
                <div class="col-md-offset-2">
                    <img src="image/no-photo.png" class="img-circle" alt="User Image">
                </div>
                <div class="col-md-offset-2">
                   <br> <p style="color:white;"> Welcome, <% out.println(session.getAttribute("NAME")); %></p>
                </div>
            </div>
        
        <ul class="sidebar-menu">
            <li>
                <a href="#" class="navbar-link">
                    <i class="fa fa-angle-down"></i> <span class="text-info">Menu</span>
                </a>
            </li>
		    <!--li><a href="Master Configuration.htm"><i class="fa fa-cogs"></i> <span>Configuration</span></a></li>
		    <li><a href="Dashboard Modules.htm"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li-->
		    <li><a href="homeController"><i class="fa fa-graduation-cap"></i> <span>Home</span></a></li>
		    <!--li><a href="homeCOntroller"><i class="fa fa-users"></i> <span>Student</span></a></li>
		    <li><a href="Employee Module.htm"><i class="fa fa-user"></i> <span>Employee</span></a></li-->
		    <li><a href="profileController?id=<%=sessionid %>"><i class="fa fa-money"></i> <span>Profile</span></a></li>
		    <li><a href="myFriendController?id=<%=sessionid %>"><i class="fa fa-user-secret"></i> <span>Friends</span></a></li>
		    
		    <li><a href="messageController?id=<%=sessionid %>"><i class="fa fa-user-secret"></i> <span>Messages</span></a></li>
		    <li><a href="friendController?id=<%=sessionid %>"><i class="fa fa-user-secret"></i> <span>Friend Requests</span></a></li>

	        </ul>

	<!-- sidebar-menu. -- End -->

    </section>

</aside>

       

    