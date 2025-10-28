<cfoutput>
#renderView( view="layouts/sidebar" )# 
</cfoutput>
<cfoutput>
<cfif structKeyExists(prc, "successMessage")>
    <div class="text-success">#prc.successMessage#</div>
</cfif>

<form action="#event.buildLink("user.saveUser")#" method="post" id="registerForm">
    <h1 class="text-center">Register</h1>
    <table class="login">
    <tr>
        <td><label for="username">USERNAME</label></td>
        <td><input type="text" name="username" id="username" autocomplete="on">
        <div id="usernameError" class="text-danger"></div></td>
    </tr>
    <tr>
        <td><label for="email">EMAIL</label></td>
        <td><input type="text" name="email" id="email" autocomplete="on">
        <div id="emailError" class="text-danger"></div></td>
    </tr>
    <tr>
        <td><label for="password">PASSWORD</label></td>
        <td><input type="password" name="password" id="password" autocomplete="on">
        <div id="passwordError" class="text-danger"></div></td>
    </tr>
    <tr>
        <td><input type="submit" value="Register"></td>
    </tr>
    </table>
</form>
</cfoutput>
