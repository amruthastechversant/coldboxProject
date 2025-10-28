/**
 * I am a new handler
 * Implicit Functions: preHandler, postHandler, aroundHandler, onMissingAction, onError, onInvalidHTTPMethod
 */
component extends="coldbox.system.EventHandler"{

	property name="registerService" inject="model:registerService";

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	/**
	 * Register
	 */
	function Register( event, rc, prc ){
		event.setView("user/Register");
	}

	function saveUser(event, rc, prc){
		registerService.saveUser(event,rc,prc);
		prc.successMessage="user Registered successfully";
		event.setView("user/Register");
	}



}

