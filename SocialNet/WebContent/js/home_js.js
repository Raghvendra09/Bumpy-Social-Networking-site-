

var email;
var password;
var status1;
var status2;
var status3;
var status4;
var status5;
var status6;
var status7;
var status8;
var status9;
var err;

function checkLogin(){
	
	email = document.getElementById("login_email");
	password = document.getElementById("login_password");
	status1 = false;
	status2 = false;
	err="";
	
	if(email.value == "" || email.value == "Provide email"){
		email.style.borderColor="red";
		err+="Provide email \n";
	}else{
		email.style.borderColor="#ccc";
		status1=true;
	}
	
	if(password.value == "" || password.value == "Provide password"){
		password.style.borderColor="red";
		err+="Provide password";
		alert(err);
	}else{
		password.style.borderColor="#ccc";
		status2=true;
	}
	
	
	if(status1 == true && status2 == true){
		return true;
	}else{
		return false;
	}
	
}



function checkSignUp(){

	var fname = document.getElementById("fname");
	var lname = document.getElementById("lname");
	var gender = document.getElementById("gender");
	var bday = document.getElementById("bday");
	var reg_em = document.getElementById("register_email");
	var reg_pass = document.getElementById("register_password");
	var conf_pass = document.getElementById("confirm_password");
	var mob_no = document.getElementById("mob_no");
	
	status1 = false;
	status2 = false;
	status3= false;
	status4 = false;
	status5 = false;
	status6 = false;
	status7 = false;
	status8 = false;
	status9 = false;
	
	err="";
	
	if(fname.value == ""){
		fname.style.borderColor="red";
		err+="Provide fname \n";
	}else{
		fname.style.borderColor="#ccc";
		status1=true;
	}
	
	if(lname.value == ""){
		lname.style.borderColor="red";
		err+="Provide lname \n";
	}else{
		lname.style.borderColor="#ccc";
		status2=true;
	}
	
	if(gender.value == ""){
		gender.style.borderColor="red";
		err+="Provide gender \n";
	}else{
		gender.style.borderColor="#ccc";
		status3=true;
	}
	
	if(bday.value == ""){
		bday.style.borderColor="red";
		err+="Provide birthday \n";
	}else{
		bday.style.borderColor="#ccc";
		status4=true;
	}
	
	if(reg_em.value == ""){
		reg_em.style.borderColor="red";
		err+="Provide email \n";
	}else{
		reg_em.style.borderColor="#ccc";
		status5=true;
	}
	
	if(reg_pass.value == ""){
		reg_pass.style.borderColor="red";
		err+="Provide password \n";
	}else{
		reg_pass.style.borderColor="#ccc";
		status6=true;
	}
	
	if(conf_pass.value == ""){
		conf_pass.style.borderColor="red";
		err+="Confirm password field empty \n";
	}else{
		conf_pass.style.borderColor="#ccc";
		status7=true;
	}
	
	if(status6 == true && status7 == true && reg_pass.value != conf_pass.value){
		reg_pass.style.borderColor="red";
		conf_pass.style.borderColor="red";
		err+="Password and confirm password are not equal\n";
	}else{
		reg_pass.style.borderColor="#ccc";
		conf_pass.style.borderColor="#ccc";
		status8=true;
	}
	
	if(mob_no.value == ""){
		mob_no.style.borderColor="red";
		err+="Provide Mobile number \n";
	}else{
		
		if(mob_no.value.length != 10){
			mob_no.style.borderColor="red";
			err+="Mobile number should have 10 digits \n";
		}else
		{
		mob_no.style.borderColor="#ccc";
		status9=true;
	    }
	}
	
	if(status1==true && status2==true && status3==true && status4==true && status5==true && status6==true && status7==true && status8==true && status9==true)
	{	
		return true;
	}else
	{
		/*alert(err + "status1" + status1 + "\n" + "status2" + status2 + "\n" + "status2" + status2 + "\n"
				 + "status4" + status4 + "\n" + "status5" + status5 + "\n" + "status6" + status6 + "\n"
				 + "status7" + status7 + "\n" + "status8" + status8 + "\n" + "status9" + status9 + "\n");*/
	
		alert(err);
		
		return false;
		
	}
	
}
