<cfoutput>

<cfif structKeyExists(rc, "errorMsg")>
    <p style="color:red">#rc.errorMsg#</p>
</cfif>

<form action="#event.buildLink('login.Login')#" method="POST" id="loginForm" >
    <h1 class="text-center">Login</h1>
    <table class="login">
    <tr>
        <td><label for="username">USERNAME</label></td>
        <td><input type="text" name="username" id="username" autocomplete="on">
        <div id="usernameError" class="text-danger"></div></td>
    </tr>
    <tr>
        <td><label for="password">PASSWORD</label></td>
        <td><input type="password" name="password" id="password" autocomplete="on">
        <div id="passwordError" class="text-danger"></div></td>
    </tr>
    <tr>
        <td><input type="submit" value="Login"></td>
    </tr>
    </table>
</form>
</cfoutput>
