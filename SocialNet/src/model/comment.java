package model;

public class comment {
	public String comment;
	public int u_id;
	public int post_id;
	//public String fname;
	public String getComment() {  
	    return comment;  
	}
	
	public void setComment(String comment) {  
	    this.comment = comment;  
	}  
	public int getID() {  
	    return u_id;  
	}
	public void setID(int p_id) {  
	     this.u_id=p_id;  
	}
	public int getPost_ID() {  
	    return post_id;  
	}
	public void setPost_ID(int id) {  
	     this.post_id=id;  
	}
}
