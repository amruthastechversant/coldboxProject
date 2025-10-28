/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	/**
	 * Display a listing of the resource
	 */
	function index( event, rc, prc ){
		event.setView("login/index");
	}

	function Login(event,rc,prc){
		// if(event.isPost()){
		// 	if (!structKeyExists(rc, "username") OR !structKeyExists(rc, "password")) {
		// 		rc.errorMsg = "Please enter username and password.";
		// 		event.setView("login/index");
		// 		return;
		// 	}
		// }
		var username=rc.username;
		var password=hash(rc.password,"SHA-256");

		var qryloginUser=queryExecute(
			"select username,password from loginusers where username=:username and password=:password",
			{
				username={value=username,cfsqltype="cf_sql_varchar"},
				password={value=password,cfsqltype="cf_sql_varchar"}
			}
		);

		// writeDump(qryloginUser.recordCount);abort;
		if(qryloginUser.recordCount EQ 1){
			session.user=qryloginUser.username;
			relocate("dashboard/index");
		}else{
			rc.errorMsg="Invalid username and password";
			event.setView("login/index");
		}
	}

	function test(event,pc,prc){
		relocate("dashboard/index");
	}

	function Logout(event,pc,prc){
		structDelete(session, "user");
		relocate("login.index");
	}

	

}

