package model;

import java.util.ArrayList;
public class homeFeeds {
public String Name;
public int post_id;
public String Content;
public int no_of_likes;
public ArrayList<profile> myprofile= new ArrayList<profile>();
public ArrayList<getComments> comments=new ArrayList<getComments>();
public int no_of_comment;

public homeFeeds(String Name,String Content,int id,int no_of_like ,ArrayList<profile> myprofile,ArrayList<getComments> comments,int no_of_comment ){
	this.Name=Name;
	this.Content=Content;
	this.post_id=id;
	this.no_of_likes=no_of_like;
	this.myprofile=myprofile;
	this.no_of_comment=no_of_comment;
	this.comments=comments;
	
}

}
