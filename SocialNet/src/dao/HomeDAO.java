package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.comment;
import model.getComments;
import model.homeFeeds;
import model.profile;

public class HomeDAO {
	String indicator="";
    ArrayList<homeFeeds> resultList = new ArrayList<homeFeeds>();
    Connection con=null;
    ResultSet rs=null;
    ResultSet rst=null;
    ResultSet rst1=null;
    Statement st=null;
    Statement stm=null;
    Statement stm1=null;
    ResultSet rst4=null;
    Statement stm4=null;
    
    public ArrayList<homeFeeds> myStatus(int u_id){

    	try{
    		Class.forName("com.mysql.jdbc.Driver");
    		 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
    		 st= (Statement) con.createStatement();
    		rs = st.executeQuery("SELECT text,p_id,firstName from posts,users where posterId='"+u_id+"' and posterId=u_id");
    		
    		while(rs.next()){
    			int p_id=rs.getInt("p_id");
    			int countlike=0;
    			stm4= (Statement) con.createStatement();
        		rst4 = stm4.executeQuery("SELECT count(postid)as likess from post_likes where postId='"+p_id+"' group by postId");
        	while(rst4.next()){
        		countlike=rst4.getInt("likess");
        	}
        		
    			
    			ArrayList<profile> myprofile = new ArrayList<profile>();
    			ArrayList<getComments> comments = new ArrayList<getComments>();
    			
    			System.out.println(p_id);
    			stm=(Statement) con.createStatement();
    			rst = stm.executeQuery("select firstName,u_id from users,post_likes where personId=u_id and postId='"+p_id+"'");
    			int count=0;
    			while(rst.next()){
    				//code to get comment and its count
    				//code to get all the name likes
    				System.out.println("In the while loop");
    				myprofile.add (new profile(rst.getString("firstName"),rst.getInt("u_id")));
    			
    			System.out.println(rst.getString("firstName"));
    			System.out.println("And"+rst.getString("u_id"));
    			
    			}
    			
    			System.out.println("list size is :" +myprofile.size());
    			//code to get coment and count stat here
    			stm1=(Statement) con.createStatement();
    			rst1 = stm1.executeQuery("select firstName,u_id,text from users,comments where personId=u_id and postId='"+p_id+"'");
    			
    			while(rst1.next()){
    				
    				comments.add (new getComments(rst1.getString("text"),rst1.getInt("u_id"),rst1.getString("firstName")));
    				count++;
    			
    			}
    			
    			
    			resultList.add(new homeFeeds(rs.getString("firstName"),rs.getString("text"),rs.getInt("p_id"),countlike,myprofile,comments,count));
    		}

     
     } catch (Exception e){}
    	return resultList;    

    }
    
    
    public ArrayList<homeFeeds> getStatus(){

	try{
		Class.forName("com.mysql.jdbc.Driver");
		 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		 st= (Statement) con.createStatement();
		rs = st.executeQuery("SELECT text,p_id,firstName from posts,users where  posterId=u_id");
	
		while(rs.next()){
			int p_id=rs.getInt("p_id");
			int countlike=0;
			stm4= (Statement) con.createStatement();
    		rst4 = stm4.executeQuery("SELECT count(postid)as likess from post_likes where postId='"+p_id+"' group by postId");
    	while(rst4.next()){
    		countlike=rst4.getInt("likess");
    	}
			
			
			ArrayList<profile> myprofile = new ArrayList<profile>();
			ArrayList<getComments> comments = new ArrayList<getComments>();
		//	int p_id=rs.getInt("p_id");
			System.out.println(p_id);
			stm=(Statement) con.createStatement();
			rst = stm.executeQuery("select firstName,u_id from users,post_likes where personId=u_id and postId='"+p_id+"'");
			int count=0;
			while(rst.next()){
				//code to get comment and its count
				//code to get all the name likes
				System.out.println("In the while loop");
				myprofile.add (new profile(rst.getString("firstName"),rst.getInt("u_id")));
			
			System.out.println(rst.getString("firstName"));
			System.out.println("And"+rst.getString("u_id"));
			
			}
			
			System.out.println("list size is :" +myprofile.size());
			//code to get coment and count stat here
			stm1=(Statement) con.createStatement();
			rst1 = stm1.executeQuery("select firstName,u_id,text from users,comments where personId=u_id and postId='"+p_id+"'");
			
			while(rst1.next()){
				
				comments.add (new getComments(rst1.getString("text"),rst1.getInt("u_id"),rst1.getString("firstName")));
				count++;
			
			}
			
			
			resultList.add(new homeFeeds(rs.getString("firstName"),rs.getString("text"),rs.getInt("p_id"),countlike,myprofile,comments,count));
		}

 
 } catch (Exception e){}
	return resultList;    

}
public void addLike(int pid, int postid){
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		 st= (Statement) con.createStatement();
	int	rs = st.executeUpdate("INSERT INTO post_likes (personID,postId) VALUES('"+pid+"','"+postid+"')");
		if(rs>0){
			indicator="Status Updated";
			System.out.println("true");
		}
		else{
			indicator= "Status Not Updated. Try Again!" ;
			System.out.println("false");
		}
 
 } catch (Exception e){}
}

public String addComment(String text,int id,int p_id){
	try{
		System.out.println("in dao");
		//System.out.println("in dao"+status+" "+id);
		Class.forName("com.mysql.jdbc.Driver");
	 con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnet","root","");
		 st= (Statement) con.createStatement();
	int	rs = st.executeUpdate("INSERT INTO comments (text,personId,postId) VALUES('"+text+"','"+id+"','"+p_id+"')");
		if(rs>0){
			indicator="Nice Job ! Commented";
			System.out.println("true");
		}
		else{
			indicator= "Failed to comment. Try Again!" ;
			System.out.println("false");
		}
 
 } catch (Exception e){}
	
	return indicator;
	

}

public String getName(){
	
	return "manish singla";
	
}

}
