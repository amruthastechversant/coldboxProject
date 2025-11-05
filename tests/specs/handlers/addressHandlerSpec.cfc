component extends="coldbox.system.testing.BaseTestCase" appMapping="/root" {
    function beforeAll(){
        super.beforeAll();
    }

    beforeEach( function(){
        mockContactService = createMock( "model:contactService" )
            .$( "getEducation", queryNew("id,name") )
            .$( "getContactById", queryNew("id,firstname") )
            .$( "getData", queryNew("id,firstname,lastname") )
            .$( "updateContact", queryNew("ID,FIRSTNAME,LASTNAME") )
            .$( "saveForm", queryNew("FIRSTNAME,LASTNAME") );


	    getWireBox().registerInstance( mockContactService, "contactService" );
    });


    function run(testResults,testBox){
        describe("address service tests",function(){
            it("should test form having education list and id",function(){
                var event=execute(
                    event="address.form",
                    rc={id=1},
                    private=true
                );

                var prc=event.getprivateCollection();
            
                expect(prc.educationList).toBequery();
                expect(prc.contact).toBeStruct();
                expect(event.getcurrentview()).toBe("address/form");
            });

            it( "should set empty contact when no ID provided", function(){
				var event = execute(
					event = "address.form",
					rc = {},
                    private=true
				);

				var prc = event.getPrivateCollection();

				expect( prc.educationList ).toBeQuery();
				expect( prc.contact ).toBeStruct();
				expect( event.getCurrentView() ).toBe( "address/form" );
			});

            it( "should set empty contact when no ID provided", function(){
                var event=execute(
                    event="address.list",
                    rc={}
                );

                var prc = event.getPrivateCollection();
                expect( prc.contactList ).toBeQuery();
                expect(prc.msg).toBe("");
                expect( event.getCurrentView() ).toBe( "address/list" );
            });

            it( "should save contact", function(){
                var  rc={
                        FIRSTNAME="john",
                        LASTNAME="s",
                        ADDRESS="abc",
                        PHONENUMBER="12345",
                        PLACE="kollam",
                        EDUCATION_ID="1",
                        AGE="25",
                        GENDER="male",
                        DOB="27-10-1998"
                    }
                var event=execute(
                    event="address.saveForm",
                    rc=rc
                );
                var prc = event.getPrivateCollection();
                expect(prc.successMessage).toBe("Saved Record Successully");
                expect( event.getCurrentView() ).toBe( "address/form" );
            });

             it( "should update contact", function(){
                var  rc={
                        FIRSTNAME="john",
                        LASTNAME="s",
                        ADDRESS="abc",
                        PHONENUMBER="12345",
                        PLACE="kollam",
                        EDUCATION_ID="1",
                        AGE="25",
                        GENDER="male",
                        DOB="27-10-1998",
                        ID=1
                    }
                var event=execute(
                    event="address.saveForm",
                    rc=rc
                );
                var prc = event.getPrivateCollection();
                expect(prc.successMessage).toBe("updated Record Successully");
                expect( event.getCurrentView() ).toBe( "address/form" );
            });
        })
    }
}