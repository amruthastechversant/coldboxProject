<cfoutput>
    <div class="col-md-3"> 
        #renderView( view="layouts/sidebar" )# 
    </div>
</cfoutput>
<cfoutput> 
<!---  <cfdump  var="#structKeyExists(rc, "msg")#" abort>  --->
        <div class="table-responsive mt-3 table-container">
        <cfif structKeyExists(rc, "msg") and len(rc.msg)>
            <cfif rc.msg EQ "deleted">
                <div class="text-success">Deleted contact successfully</div>
            <cfelseif rc.msg EQ "invalid">
                <div class="text-danger">Invalid contact Id</div>
            </cfif>
        </cfif>
            <table id="addressTable" class="display table table-striped table-hover mt-2 ">
                <thead>
                    <tr>
                        <th scope="col">##</th>
                        <th scope="col">Firstname</th>
                        <th scope="col">Lastname</th>
                        <th scope="col">Address</th>
                        <th scope="col">phonenumber</th>
                        <th scope="col">place</th>
                        <th scope="col">Education</th>
                        <th scope="col">Age</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Dob</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <cfloop query="#prc.contactList#">
                        <tr>
                            <td>#id#</td>
                            <td>#firstname#</td>
                            <td>#lastname#</td>
                            <td>#address#</td>
                            <td>#phonenumber#</td>
                            <td>#place#</td>
                            <td>#education#</td>
                            <td>#age#</td>
                            <td>#gender#</td>
                            <td>#dateFormat(dob,"yyyy-mm-dd")#</td>
                            <td>
                            <div class="d-flex justify-content-center align-items-center gap-1">
                                <a href="#event.buildLink('address.form',{id=id})#" class="btn btn-sm btn-outline-primary me-2" title="Edit">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>
                                    
                                <a href="#event.buildLink('address.deleteContact',{id=id})#" class="btn btn-sm btn-outline-danger" title="Delete" 
                                    onclick="return confirm('Are you sure you want to delete this contact?');">
                                    <i class="fa-solid fa-trash"></i>
                                </a>
                            </div>
                            </td>
                        </tr>
                    </cfloop>
                </tbody>
            </table>
        </div>
</cfoutput>