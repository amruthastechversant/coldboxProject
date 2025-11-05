component extends="coldbox.system.testing.BaseTestCase" appMapping="/root" {
    function beforeAll(){
        super.beforeAll();
        var contactService=getInstance("models.contactService");
         
    }

    function run( testResults, testBox ) {
        describe("contact service tests",function(){
            it("should return data while calling getData()",function(){
                var contactService=new models.contactService();
                var result=contactService.getData({},{},{});
                expect(result).toBequery();
            });

            it("should return EducationList",function(){
                var contactService=new models.contactService();
                var result=contactService.getEducation({},{},{});
                expect(result).toBequery();
            });

            it("should save new contact",function(){
                var rc={
                    firstname:"john",
                    lastname:"s",
                    address:"abc",
                    phonenumber:"12345",
                    place:"kollam",
                    education_id:"1",
                    age:"25",
                    gender:"male",
                    dob:"27-10-1998"
                };
                var contactService=new models.contactService();
                var result=contactService.saveForm(rc);
                expect(result.recordCount).toBeGTE(0);
            });

            it("should update existing contact",function(){
                var rc={
                    firstname:"john",
                    lastname:"s",
                    address:"abc",
                    phonenumber:"12345",
                    place:"kollam",
                    education_id:"1",
                    age:"25",
                    gender:"male",
                    dob:"27-10-1998",
                    id:1
                };
                var contactService=new models.contactService();
                var result=contactService.updateContact(rc);
                expect(result.recordCount).toBeGTE(0);
            });

            it("should get contact by Id",function(){
                var contactService=new models.contactService();
                var result=contactService.getContactById(1);
                expect(result).toBequery();
            });

            it("should delete contact by id",function(){
                var contactService=new models.contactService();
                var result=contactService.deleteContact(1);
                expect(result.recordCount).toBeGTE(0);
            })

        })
    }
}