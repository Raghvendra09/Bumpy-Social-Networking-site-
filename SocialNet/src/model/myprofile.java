package model;
public class myprofile {

	public String fname;
	private String lname;
	private String mob;
	private String gender;
	private String dob;
	private String email;
	
	public myprofile(String fname,String lname,String gender, String dob, String email,String mob){
		this.fname=fname;
		this.lname=lname;
		this.gender=gender;
		this.dob=dob;
		this.email=email;
		this.mob=mob;
		
	}
	public String getFname(){
		return this.fname;
	}
	public String getLname(){
		return this.lname;
	}
	public String getGender(){
		return this.gender;
	}
	public String getDob(){
		return this.dob;
	}
	public String getMob(){
		return this.mob;
	}
	public String getEmail(){
		return this.email;
	}
}
