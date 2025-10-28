<cfoutput>
#renderView( view="layouts/sidebar" )# 
</cfoutput>
<cfoutput>
<cfif structKeyExists(prc, "successMessage")>
    <div class="text-success">#prc.successMessage#</div>
</cfif>
<div id='error-msg' class="text-danger"></div>
    #html.startForm(action="address.saveForm",method="post",class="form-table" ,id="addressForm")#
    <table>
    <tr>
        <td>#html.label(field="firstname",content="First Name",class="form-label")#</td>
        <td>#html.textfield(name="firstname",id="firstname",class="form-control",value=rc.firstname?:"")#</td>
        
        <td>#html.label(field="lastname",content="Last Name",class="form-label")#</td>
        <td>#html.textfield(name="lastname",id="lastname",class="form-control",value="")#</td>
    </tr>
    <tr>
        <td>#html.label(field="address",content="Address",class="form-label")#</td>
        <td colspan="3">#html.textarea(name="address",id="address",rows="3")#</td>
    </tr>
    <tr>
        <td>#html.label(field="phonenumber",content="Phone Number",class="form-label")#</td>
        <td colspan="3">#html.inputfield(name="phonenumber",id="phonenumber",type="number")#</td>
    </tr>
    <tr>
        <td>#html.label(field="place",content="Place",class="form-label")#</td>
        <td>#html.textfield(name="place",id="place")#</td>
        <td>#html.label(field="education",content="Education",class="form-label")#</td>
        <td colspan="3">
            #html.select(id="education",name="education" ,class="form-control" , options=prc.educationList,  column="id",
            nameColumn="education",  selected=rc.education ?: "")#
        </td>
    </tr>
    <tr>
        <td>#html.label(field="age",content="Age")#</td>
        <td>#html.inputField(id="age", name="age",type="number", min="1", max="120",value=rc.age ? :"")#</td>
        <td>#html.label(field="gender",content="Gender")#</td>
        <td>
            <div class="radio-group">
                #html.RadioButton(name="gender" ,value="Male", checked=(structKeyExists(rc, "gender") AND rc.gender EQ "Male"))#Male
                #html.RadioButton(name="gender", value="Female",checked=(structKeyExists(rc, "gender") AND rc.gender EQ "Female") )#Female
                #html.RadioButton(name="gender" ,value="Other",checked=(structKeyExists(rc, "gender") AND rc.gender EQ "Other"))#Other
                
            </div>
        </td>
    </tr>
    <tr>
        <td>#html.label(field="dob",content="Date of Birth")#</td>
        <td>#html.inputField(name="dob", id="dob", type="date", class="form-control", value=rc.dob ?: "")#</td>
    </tr>
    <tr>
        <td colspan="4" class="submit-container">#html.SubmitButton(name="ADD",type="submit")#</td>
    </tr>
</table>
#html.endForm()#
</cfoutput>




