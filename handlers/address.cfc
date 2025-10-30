/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	property name="contactService" inject="model:contactService";

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	/**
	 * form
	 */
	

	function form( event, rc, prc ){	
		prc.educationList=contactService.getEducation();

		if(structKeyExists(rc, "id")){
			prc.contact=contactService.getContactById(rc.id);
		}
		else{
			prc.contact={};
		}
		event.setView("address/form");
	}

	function list(event,rc,prc){
		prc.contactList=contactService.getData();
		prc.msg = event.getValue("msg", "");
		event.setView("address/list");
	}

	function saveForm(event,rc,prc){
		if(structKeyExists(rc, "id") and len(rc.id)){
			contactService.updateContact(rc);
			prc.successMessage="updated Record successfully";
		}
		else{
			contactService.saveForm(rc);
			prc.successMessage="Saved Record Successully";
		}
		
		prc.educationList=contactService.getEducation();
		event.setView("address/form");
	}

	function deleteContact(event,rc,prc){
		if(structKeyExists(rc, "id") and len(rc.id)){
			contactService.deleteContact(rc.id);
			relocate(event="address.list",queryString="msg=deleted")
			
		}
		else{
			prc.successMessage="invalid Id";
			relocate(event="address.list",queryString="msg=invalid")
		}
		
	}
	
	
}