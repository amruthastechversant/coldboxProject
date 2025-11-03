component extends="coldbox.system.testing.BaseTestCase" appMapping="/root" {

    function beforeAll() {
        super.beforeAll();

        // Load the model you want to test
       var  registerService = getInstance( "models.registerService" ); // adjust mapping as needed
       var mockRegisterService = getMockBox().createEmptyMock("models.registerService");
    }

    function run( testResults, testBox ) {
        
        describe( "registerService.saveUser()", function() {
        
        // var mockBox = getMockBox();
        
        // var mockRegisterService = mockBox.createMock( "models.registerService" );
        // // Set an expectation that the "doSomething" method will be called with "hello" and 123
        // mockRegisterService.$( "doSomething" )
        //         .$args( "hello", 123 )
        //         .$results( true );

        // // Call the method under test, which will call the mocked service
        // mockRegisterService.saveUser();

        // // Verify that the expectation was met
        // mockRegisterService.$verify();

/*
            it( "should return an error if email is missing", function() {
                // Mock dependencies
                var setViewCalledWith = "";
                var event={
                    setView:function(viewName){
                        setViewCalledWith=viewName;
                    }
                };
                var rc = { username = "testuser", email = "", password = "123" };
                var prc = {};

               
                var registerService=new models.registerService();
                // Run test
                registerService.saveUser( event, rc, prc );
                
                expect( prc.error ).toBe( "Email is required." );
                expect(setViewCalledWith ).toBe( "user/Register" );
            });

/*
            it( "should set successMessage if email already exists", function() {
                // Mock queryExecute() globally
                // mockStaticMethod( registerService, "queryExecute" )
                //     .$args( anyValue(), anyValue() )
                //     .$return( { count : 1 } );

                 var setViewCalledWith = "";
                var event={
                    setView:function(viewName){
                        setViewCalledWith=viewName;
                    }
                };

                
                var rc = { username = "testuser", email = "existing@example.com", password = "123" };
                var prc = {};

                
                var registerService=new models.registerService();
                registerService.saveUser( event, rc, prc );

                expect( prc.successMessage ).toBe( "Email already exists" );
                expect( setViewCalledWith ).toBe( "user/Register" );
            });

*/
            it( "should insert user successfully when email is new", function() {
                // First call: email check (returns 0)
                // Second call: insert success
               



               

                var setViewCalledWith = "";
                var event={
                    setView:function(viewName){
                        setViewCalledWith=viewName;
                    }
                };
                
                var rc = { username = "newuser", email = "newuser@example.com", password = "secret" };
                var prc = {};

                var registerService=new models.registerService();
                var result = registerService.saveUser( event, rc, prc );

                 expect( setViewCalledWith ).toBe( "user/Register" );;
                expect( prc ).notToHaveKey( "error" );
                expect( result ).notToBeNull();
            });
            

        });
    }

}
