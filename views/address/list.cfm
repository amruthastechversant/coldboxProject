<cfoutput>
#renderView( view="layouts/sidebar" )# 
</cfoutput>
<cfoutput>
    
            <cfloop query="prc.contactList">
                <li>#firstname#</li>
            </cfloop>
        
</cfoutput>