component access="true" {
    function saveUser(event,rc,prc){

        if (!structKeyExists(rc, "email") || !len(trim(rc.email))) {
        prc.error = "Email is required.";
        event.setView("user/Register");
        return;
    }
		var saveUserqry=queryExecute(
			"select count(email) as count from users where email=:email",
				{email=rc.email,cfsqltype="cf_sql_varchar"} 
		);
		if(saveUserqry.count > 0){
			prc.successMessage="Email already exists";
            return event.setView("user/Register");
		}

		var saveUser=queryExecute(
			"insert into users(username,email,password) 
			values(
				:username,:email,:password
			)",
			{
				username:{value=rc.username,cfsqltype="cf_sql_varchar"},
				email:{value=rc.email,cfsqltype="cf_sql_varchar"},
				password:{value=hash(rc.password, 'SHA-256'), cfsqltype="cf_sql_varchar"}
			}
		);
		
        event.setView("user/Register");
        return saveUser;
	}
}