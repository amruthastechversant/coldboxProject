<cfoutput>
#renderView( view="layouts/sidebar" )# 
</cfoutput>
<cfoutput>
<cfif structKeyExists(prc, "successMessage")>
    <div class="text-success">#prc.successMessage#</div>
</cfif>
<div id='error-msg' class="text-danger"></div>
    #html.startForm(action="address.saveForm",method="post",class="form-table" ,id="addressForm")#
    <cfif structKeyExists(prc, "contact") AND structKeyExists(prc.contact, "id")>
        <input type="hidden" name="id" value="#prc.contact.id#">
    <cfelse>
        <input type="hidden" name="id" value="">
    </cfif>

    <table>
    <tr>
        <td>#html.label(field="firstname",content="First Name",class="form-label")#</td>
        <td>#html.textfield(name="firstname",id="firstname",class="form-control",value=prc.contact.firstname?:'')#</td>
        
        <td>#html.label(field="lastname",content="Last Name",class="form-label")#</td>
        <td>#html.textfield(name="lastname",id="lastname",class="form-control",value=prc.contact.lastname?:'')#</td>
    </tr>
    <tr>
        <td>#html.label(field="address",content="Address",class="form-label")#</td>
        <td colspan="3">#html.textarea(name="address",id="address",rows="3", value=prc.contact.address?:'')#</td>
    </tr>
    <tr>
        <td>#html.label(field="phonenumber",content="Phone Number",class="form-label")#</td>
        <td colspan="3">#html.inputfield(name="phonenumber",id="phonenumber",type="number", value=prc.contact.phonenumber?:'')#</td>
    </tr>
    <tr>
        <td>#html.label(field="place",content="Place",class="form-label")#</td>
        <td>#html.textfield(name="place",id="place", value=prc.contact.place?:'')#</td>
        <td>#html.label(field="education",content="Education",class="form-label")#</td>
        <td colspan="3">
<!---             #html.select(name="education_id",id="education",class="form-control",options=prc.educationList,column="id",nameColumn="education",
            selectedValue= prc.contact.education_id)# --->
            
<!---             <cfdump  var="#prc.educationList.id EQ prc.contact.education_id#" abort> --->
            <select name="education_id",id="education",class="form-control">
                <option value="">select education</option>
                <cfloop query="#prc.educationList#">
                    <option value="#prc.educationList.id#"
                        <cfif structKeyExists(prc, "contact")  AND structKeyExists(prc.contact, "education_id") 
                        AND prc.educationList.education EQ prc.contact.education_id>selected
                        </cfif>>
                        #prc.educationList.education#
                    </option>
                </cfloop>
            </select>
        </td>
    </tr>
    <tr>
        <td>#html.label(field="age",content="Age")#</td>
        <td>#html.inputField(id="age", name="age",type="number", min="1", max="120",value=prc.contact.age ? :"")#</td>
        <td>#html.label(field="gender",content="Gender")#</td>
        <td>
            <div class="radio-group">
                #html.RadioButton(name="gender" ,value="Male", checked=(structKeyExists(prc, "contact") and structKeyExists(prc.contact, "gender") AND prc.contact.gender EQ "Male"))#Male
                #html.RadioButton(name="gender", value="Female",checked=(structKeyExists(prc, "contact") and structKeyExists(prc.contact, "gender") AND prc.contact.gender EQ "Female"))#Female
                #html.RadioButton(name="gender" ,value="Other",checked=(structKeyExists(prc, "contact") and structKeyExists(prc.contact, "gender") AND prc.contact.gender EQ "Other"))#Other
                
            </div>
        </td>
    </tr>
    <tr>
        <td>#html.label(field="dob",content="Date of Birth")#</td>
        <td>#html.inputField(name="dob", id="dob", type="date", class="form-control", value= (structKeyExists(prc, "contact") and structKeyExists(prc.contact, "dob"))
            ? dateFormat(prc.contact.dob, "yyyy-mm-dd") 
            : "")#</td>
    </tr>
    <tr>
        <td colspan="4" class="submit-container">#html.SubmitButton(value=(structKeyExists(prc, "contact") and structKeyExists(prc.contact, "id")? "UPDATE":"ADD"),type="submit")#</td>
    </tr>
</table>
#html.endForm()#
</cfoutput>




