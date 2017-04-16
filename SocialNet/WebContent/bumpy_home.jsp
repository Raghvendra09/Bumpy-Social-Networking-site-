<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">


<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="IIITV Social Network">
    <meta name="author" content="Manish Singla">

    <title>BUMpy</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	
    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">

	<!-- style added by manish -->
	<link rel="stylesheet" href="css/home_style.css" type="text/css">

</head>

<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">BUMpy</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
                  <!--li>
                        <a href="#" data-toggle="modal" data-target="#login">Log In</a>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#register">Sign Up</a>
                    </li-->
                    
                    
                    <%
                   String link="";
                    if(session.getAttribute("NAME") == null
                	&& session.getAttribute("EMAIL") == null
                		&& session.getAttribute("UID") == null){
                		
                	link = "<li><a href='#' data-toggle='modal' data-target='#login'>Log In</a></li>"
                	 + "<li><a href='#' data-toggle='modal' data-target='#register'>Sign Up</a></li>";
                	
                	}else{
                		
                		link = "<li><a href='home.jsp'  class='page-scroll' >"+ session.getAttribute("NAME") + "</a></li>" + 
                			   "<li><a href='logout.jsp'  class='page-scroll' >Log out</a></li>";
                		
                	}

                    
                    out.print(link);
                    
                    %>
                    
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1>Welcome to BUMpy </h1>
                <img style="position:relative;top:50%;left:46%;" src="img/bumpy_logo.png" class="img-responsive" alt="">
                <hr>
                <p style="color:#fff;">IIIT Vadodara's own social network.</p>
            </div>
        </div>
    </header>



        <!--Form Modal for Login Starts-->
        <div class="modal fade" id="login" role="dialog">
            <div class="modal-dialog">
                <!--Modal Content-->
                <div class="container-fluid form-container modal-content">
                    <!--            Modal Header-->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h1 class="modal-title">Login</h1>
                    </div>
                  
                    <!--          Modal Body And  Main Form Container-->
                  
        			      <form method="post" class="modal-body" id="login_area" action="loginChecker" onsubmit="return checkLogin();">
                 
                        <!--Username-->
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <!--<label>Email or Username
                                </label>-->
                                <input type="email" class="form-control required" name="login_email" id="login_email" placeholder="Enter Your email">
                            </div>
                        </div>
                        <!--                Password-->
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <!--<label>Password
                                </label>-->
                                <input type="password" class="form-control required" name="login_password" id="login_password" placeholder="Enter Your Password">
                            </div>
                        </div>

						<div class="form-group row">
                            <div class="col-sm-12">
								<a href="forgot_password.html">Forgot Password ?</a>
                            </div>
                        </div>
						

                        <!--Buttons-->
                        <div class="form-group">
                            <input type="submit" class="btn btn-success" value="Login">
                        </div>

                    </form>
              

                </div>
            </div>
        </div>
        <!--        Form Modal for Login Ends -->

        <!--Form Modal for Registration Starts-->
        <div class="modal fade" id="register" role="dialog">
            <div class="modal-dialog">
                <!--Modal Content-->
                <div class="container-fluid form-container modal-content">
                    <!--            Modal Header-->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h1 class="modal-title">Register</h1>
                    </div>
                    <!--          Modal Body And  Main Form Container-->
					<form method="post" class="modal-body" id="signup_form" onsubmit="return checkSignUp();" action="signUp">
				
                        <!-- Name-->
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label>First Name
                                </label>
                                <input type="text" class="form-control required" name="fname" id="fname" placeholder="Your First Name">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Last Name
                                </label>
                                <input type="text" class="form-control required" name="lname" id="lname" placeholder="Your Last Name">
                            </div>
                        </div>
													
                        <!--Gender-->
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label>Gender
                                </label>
                                <select id="gender" name="gender" class="form-control">
                                    <option disabled selected value="">Choose Your Gender</option>
                                    <option value="m">Male</option>
                                    <option value="f">Female</option>
                                </select>
                            </div>
                        </div>

                        <!--                   Birthday-->
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label>BirthDay
                                </label>
                                <input type="date" class="form-control" name="bday" id="bday" placeholder="mm-dd-yyyy">
                            </div>
                        </div>
                        <!--Email-->
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label>E-mail
                                    
                                </label>
                                <input type="email" class="form-control required" name="register_email" id="register_email" placeholder="Your E-mail">
                            </div>
                        </div>
                        
                        <!-- Password -->
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label>Password
                                </label>
                                <input type="password" class="form-control required" name="resister_password" id="register_password" placeholder="Choose Your Password">
                            </div>
                        </div>
						
						
                        <!-- Confirm Password -->
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label>Confirm Password
                                </label>
                                <input type="password" class="form-control required" name="confirm_password" id="confirm_password" placeholder="Choose Your Password">
                            </div>
                        </div>
						
						
						<!--Mobile no-->
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <label>Mobile Number
                                    
                                </label>
                                <input type="text" class="form-control required" name="mob_no" id="mob_no" placeholder="Your Mobile Number">
                            </div>
                        </div>
                        
		
                        <!--Buttons-->
                        <div class="form-group">
                            <input type="submit" class="btn btn-success" value="Sign Up">
                        </div>
							                		
            		</form>                </div>
            </div>
        </div>
        <!--        Form Modal for Registration Ends-->     

     <!--Footer Starts-->
        <!-- footer id="footer" class="footer">
            <div class="container-fluid">
                <div class="containerItem">
                    <div class="footer-container">
                    <label id="copyright">&copy; 2016 BUMpy</label>
					</div>
                </div>
            </div>

        </footer-->
        <!--        Footer Ends-->     
        <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>
	
	<!-- Js made by manish -->
	<script src="js/home_js.js"></script>
</body>

</html>
    