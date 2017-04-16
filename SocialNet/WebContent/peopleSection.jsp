<%@page import="java.util.*" %>
<style>

table{

border : 1px solid black;
width : 100%;

}


tr,th,td{

border:1px solid black;
text-align: center;
padding:10px;
margin:10px;
}

</style>
<aside class="right-side">

        <ul class="breadcrumb">
<li class="active">Home</li>
</ul>
                <!-- Main content -->
                <section class="content">

                    <!-- Small boxes (Stat box) -->
				
                </section><!-- /.content -->

    </section>

        <section class="content">
        
        <table>
        
        <tr><th>Sr No.</th><th>Name</th></tr>
       
        
        
        <%

    	try{
    	
    	ArrayList<model.peopleList> plist = (ArrayList<model.peopleList>) request.getAttribute("peopleList");
    	 
    	int a,d=0;
    	String b,c;
    	 
    	for(model.peopleList s : plist) { %>
        <tr><td><%= ++d %></td><td><a href="profileController?id=<%= s.getUID() %>"><%= s.getFirstName() + " " + s.getLastName() %></a></td></tr>
            
        <%}	
    	}catch(Exception e){out.print("Error : " + e.getLocalizedMessage());}
    	%>

        
        </table>
       
       
        
        
        
        <script>
$(document).ready(function(){
    $('.tab-content').slimScroll({
        height: '300px'
    });
});
$(document).ready(function(){
    $('#coursList').slimScroll({
        height: '250px'
    });
});
</script>
<style>
.tab-content {
   padding:15px;
}
.box .box-body .fc-widget-header {
    background: none;
}
.popover{
    max-width:450px;   
}
</style>


    <footer class="edusec-main-footer">
      <div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
        <div class="pull-right hidden-xs">
          <!--b>Version</b> 3.0 -->
        </div>
        <strong>Copyright © 2016 <a>BUMpy</a>.</strong> All rights reserved.
      </div>
    </footer>

</aside>



    </div>
