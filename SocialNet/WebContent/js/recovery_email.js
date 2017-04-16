/**
 * Composed by manish
 * started on 11-11-2016
 */


var recovery_email = document.getElementById("recovery_email");
var err;

function checkRecoveryEmail(){
	if(recovery_email.value == ""){
		recovery_email.value="Email field empty";
		recovery_email.style.borderColor="red";
		return false;
	}else{
		return true;
	}
}
