component access="true" {
    function getData(event,rc,prc){
		var getListqry=queryExecute(
			"select c.id,c.firstname,c.lastname,c.address,c.phonenumber,c.place,e.education as education,c.age,c.gender,c.dob from contacts as c
			left join education as e on c.education_id=e.id"
		
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
				:firstname,:lastname,:address,:phonenumber,:place,:education_id,:age,:gender,:dob	
			)",
			{
				firstname: {value=rc.firstname, cfsqltype="cf_sql_varchar"},
                lastname: {value=rc.lastname, cfsqltype="cf_sql_varchar"},
                address: {value=rc.address, cfsqltype="cf_sql_varchar"},
                phonenumber: {value=rc.phonenumber, cfsqltype="cf_sql_varchar"},
                place: {value=rc.place, cfsqltype="cf_sql_varchar"},
                education_id: {value=rc.education_id, cfsqltype="cf_sql_varchar"},
                age: {value=rc.age, cfsqltype="cf_sql_integer"},
                gender: {value=rc.gender, cfsqltype="cf_sql_varchar"},
                dob: {value=rc.dob, cfsqltype="cf_sql_date"}
			}
		);
		return saveFormQry;
    }

	function updateContact(rc){
		var updateContactqry=queryExecute(
			"update contacts set 
				firstname = :firstname,
				lastname = :lastname,
				address = :address,
				phonenumber = :phonenumber,
				place = :place,
				education_id = :education_id,
				age = :age,
				gender = :gender,
				dob = :dob
				where id = :id",
				{
				firstname: {value=rc.firstname, cfsqltype="cf_sql_varchar"},
                lastname: {value=rc.lastname, cfsqltype="cf_sql_varchar"},
                address: {value=rc.address, cfsqltype="cf_sql_varchar"},
                phonenumber: {value=rc.phonenumber, cfsqltype="cf_sql_varchar"},
                place: {value=rc.place, cfsqltype="cf_sql_varchar"},
                education_id: {value=rc.education_id, cfsqltype="cf_sql_varchar"},
                age: {value=rc.age, cfsqltype="cf_sql_integer"},
                gender: {value=rc.gender, cfsqltype="cf_sql_varchar"},
                dob: {value=rc.dob, cfsqltype="cf_sql_date"},
				id:{value=rc.id,cfsqltype="cf_sql_integer"}
				}
		);
		return updateContactqry;
	}

	function getContactById(id){
		var getContactIdqry=queryExecute(
			"select id,firstname,lastname,address,phonenumber,place,education_id,age,gender,dob from contacts
			where id=:id",
			{id:{value:arguments.id,cfsqltype="cf_sql_integer"}}
		);
		return getContactIdqry;
	}

	function deleteContact(id){
		var getDeleteContactqry=queryExecute(
			"delete from contacts where id= :id",
			{id:{value:arguments.id,cfsqltype="cf_sql_integer"}}
		);
		return getDeleteContactqry;
	}
	

}


