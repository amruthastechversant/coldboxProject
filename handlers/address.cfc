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
		event.setView("address/form");
	}

	function list(event,rc,prc){
		prc.contactList=contactService.getData();
		event.setView("address/list");
	}

	function saveForm(event,rc,prc){
		contactService.saveForm(rc);
		prc.successMessage="Saved Record Successully";
		prc.educationList=contactService.getEducation();
		event.setView("address/form");
	}

	

}

