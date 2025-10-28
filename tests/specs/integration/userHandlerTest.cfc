component extends="coldbox.system.testing.BaseTestCase" {

    function beforeAll() {
        super.beforeAll();
        controller = getController();
    }

    function runTests() {
        describe("User Registration Handler (Non-ORM)", function(){

            it("should show registration form", function(){
                var event = execute( route="user.index" );
                expect( event.getView() ).toBe("user/Register");
            });

            it("should not save user when fields are missing", function(){
                var event = execute( route="user.saveUser", params={ username="", email="", password="" } );
                var err = getRequestContext().getPrivateValue("error");
                expect( err ).toBe("All fields are required.");
            });

            it("should save valid user", function(){
                var params = { username="testuser", email="testuser@test.com", password="12345" };
                execute( route="user.saveUser", params=params );

                // Verify record exists
                var qry = queryExecute(
                    "SELECT * FROM users WHERE email=:email",
                    { email: {value=params.email, cfsqltype="cf_sql_varchar"} }
                );
                expect( qry.recordCount ).toBeGT(0);
                expect( qry.username ).toBe("testuser");
            });

            it("should reject duplicate email", function(){
                var params = { username="dupuser", email="testuser@test.com", password="11111" };
                var event = execute( route="user.saveUser", params=params );
                var err = getRequestContext().getPrivateValue("error");
                expect( err ).toBe("Email already registered.");
            });
        });
    }
}
