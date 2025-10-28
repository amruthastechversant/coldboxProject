$(document).ready(function(){
    $("#loginForm").on("submit",function(e){

        var username=$("#username").val();
        var password=$("#password").val();

        let isValid=true;

        if(username==""){
            $("#usernameError").text("Please Enter username");
            isValid=false;
        }
        if(password==""){
            $("#passwordError").text("Please Enter password");
            isValid=false;
        }

        if(!isValid){
            e.preventDefault();
        }
    })

    $("#addressForm").on("submit",function(e){

        var firstname=$("#firstname").val();
        var lastname=$("#lastname").val();
        var address=$("#address").val();
        var phonenumber=$("#phonenumber").val();
        var dob=$("#dob").val();
        var educationOptions=$("#education").val();
        var genderSelected=$("input[name='gender']:checked").length > 0;
        var errorMsg=$("#error-msg");
        let errors=[];
        let isValid=true;
        

        if(firstname==""){
            errors.push("Please enter Firstname");
            isValid=false;
        }

        if(lastname==""){
            errors.push("Please enter lastname");
            isValid=false;
        }

        if(address==""){
            errors.push("Please enter address");
            isValid=false;
        }

        if(phonenumber==""){
            errors.push("Please enter phonenumber");
            isValid=false;
        }


        if(dob==""){
            errors.push("Please enter dob");
            isValid=false;
        }


        if(educationOptions==""){
            errors.push("Please select Education");
            isValid=false;
        }

        if(!genderSelected){
            errors.push("Please select gender");
            isValid=false;
        }

        if(errors.length>0){
            errorMsg.html(errors.join("<br>"));
        }else{
            errorMsg.html("");
        }
        if(!isValid){
            e.preventDefault();
        }
    })

    $("#registerForm").on("submit",function(e){
        var username=$("#username").val();
        var email=$("#email").val();
        var password=$("#password").val();
        let isValid=true;
        if(username==""){
            $("#usernameError").text("Please Enter username");
            isValid=false;
        }

        if(email==""){
            $("#emailError").text("Please Enter email");
            isValid=false;
        }

         if(password==""){
            $("#passwordError").text("Please Enter password");
            isValid=false;
        }

        if(!isValid){
            e.preventDefault();
        }
    })

});

