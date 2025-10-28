/**
 * This is your application router.  From here you can controll all the incoming routes to your application.
 *
 * https://coldbox.ortusbooks.com/the-basics/routing
 */
component {

	function configure(){

		/*routes=[
			{pattern="/",handler="login",action="index"}
		]
		routes=[
			{pattern="/",target="login",action="index"}
		];*/

		group( { pattern="/", target="login." }, function(){
			route( "/", "index" )
			.route( "/tester", "test" )
		} );

		group({pattern="/",target="address."},function(){
			route("/","form")
			.route("/","saveForm")
		});
			// route("/address/form","address.form");
		/* route(
			pattern : "/",
			target  : "login",
			name    : "index"
		);*/

		/**
		 * --------------------------------------------------------------------------
		 * Router Configuration Directives
		 * --------------------------------------------------------------------------
		 * https://coldbox.ortusbooks.com/the-basics/routing/application-router#configuration-methods
		 */
		// setFullRewrites( true );
		// setBaseURL("/coldbox_projects/MyFirstCBApp/");

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 */

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ){
			return "Ok!";
		} );

		// A nice RESTFul Route example
		route( "/api/echo", function( event, rc, prc ){
			return { "error" : false, "data" : "Welcome to my awesome API!" };
		} );

		// @app_routes@

		// Conventions-Based Routing
		route( ":handler/:action?" ).end();
	}

}
