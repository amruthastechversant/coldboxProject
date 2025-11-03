/**
 * Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 * ---
 */
component {


	this.datasources["coldbox_dsn"] = {
	class: "com.mysql.cj.jdbc.Driver", 
	bundleName: "com.mysql.cj", 
	bundleVersion: "8.0.33",
	connectionString: "jdbc:mysql://127.0.0.1:3306/coldbox_task?useUnicode=true&characterEncoding=UTF8&serverTimezone=Asia/Calcutta&autoReconnect=true&useSSL=false&maxReconnects=3&useLegacyDatetimeCode=true",
	username: "root",
	password: "encrypted:c4525f9e419c20dc6a34d83305a44524c31a4a4c9bf26d81711123b0cdc84bc1",
	
	// optional settings
	blob:true, // default: false
	clob:true, // default: false
	connectionLimit:100, // default:-1
	liveTimeout:5, // default: -1; unit: minutes
	alwaysSetTimeout:true, // default: false
	validate:false, // default: false
	};
	// APPLICATION CFC PROPERTIES
	this.name                 = "ColdBoxTestingSuite";
	this.sessionManagement    = true;
	this.setClientCookies     = true;
	this.sessionTimeout       = createTimespan( 0, 0, 15, 0 );
	this.applicationTimeout   = createTimespan( 0, 0, 15, 0 );
	this.whiteSpaceManagement = "smart";
	this.enableNullSupport    = shouldEnableFullNullSupport();
	this.datasource = "coldbox_dsn";
	

	/**
	 * --------------------------------------------------------------------------
	 * Location Mappings
	 * --------------------------------------------------------------------------
	 * - cbApp : Quick reference to root application
	 * - coldbox : Where ColdBox library is installed
	 * - testbox : Where TestBox is installed
	 */
	// Create testing mapping
	this.mappings[ "/tests" ]   = getDirectoryFromPath( getCurrentTemplatePath() );
	// The root application mapping
	rootPath                    = reReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
	this.mappings[ "/root" ]    = this.mappings[ "/cbapp" ] = rootPath;
	this.mappings[ "/coldbox" ] = rootPath & "coldbox";
	this.mappings[ "/testbox" ] = rootPath & "testbox";

	/**
	 * Fires on every test request. It builds a Virtual ColdBox application for you
	 *
	 * @targetPage The requested page
	 */
	public boolean function onRequestStart( targetPage ){
		// Set a high timeout for long running tests
		setting requestTimeout   ="9999";
		// New ColdBox Virtual Application Starter
		request.coldBoxVirtualApp= new coldbox.system.testing.VirtualApp( appMapping = "/root" );

		// If hitting the runner or specs, prep our virtual app
		if ( getBaseTemplatePath().replace( expandPath( "/tests" ), "" ).reFindNoCase( "(runner|specs)" ) ) {
			request.coldBoxVirtualApp.startup( true );
		}

		// Reload for fresh results
		if ( structKeyExists( url, "fwreinit" ) ) {
			if ( structKeyExists( server, "lucee" ) ) {
				pagePoolClear();
			}
			// ormReload();
			request.coldBoxVirtualApp.restart();
		}

		return true;
	}

	/**
	 * Fires when the testing requests end and the ColdBox application is shutdown
	 */
	public void function onRequestEnd( required targetPage ){
		request.coldBoxVirtualApp.shutdown();
	}

	private boolean function shouldEnableFullNullSupport(){
		var system = createObject( "java", "java.lang.System" );
		var value  = system.getEnv( "FULL_NULL" );
		return isNull( value ) ? false : !!value;
	}

}
