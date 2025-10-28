component access="true" {
    function getData(event,rc,prc){
		var getListqry=queryExecute(
			"select id,firstname,lastname,address,place,education_id,age,gender,dob from contacts"
		);
		return getListqry;
	}

    function getEducation(event,rc,prc){
		var getEducationqry=queryExecute(
			"select id,education from education"
		);
		return getEducationqry;
	}


    function saveForm(rc){
        var saveFormQry=queryExecute(
			"insert into contacts(firstname,lastname,address,phonenumber,place,education_id,age,gender,dob)
			values(
				:firstname,:lastname,:address,:phonenumber,:place,:education,:age,:gender,:dob	
			)",
			{
				firstname: {value=rc.firstname, cfsqltype="cf_sql_varchar"},
                lastname: {value=rc.lastname, cfsqltype="cf_sql_varchar"},
                address: {value=rc.address, cfsqltype="cf_sql_varchar"},
                phonenumber: {value=rc.phonenumber, cfsqltype="cf_sql_varchar"},
                place: {value=rc.place, cfsqltype="cf_sql_varchar"},
                education: {value=rc.education, cfsqltype="cf_sql_varchar"},
                age: {value=rc.age, cfsqltype="cf_sql_integer"},
                gender: {value=rc.gender, cfsqltype="cf_sql_varchar"},
                dob: {value=rc.dob, cfsqltype="cf_sql_date"}
			}
		);
		return saveFormQry;
    }

}


