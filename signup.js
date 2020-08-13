// JavaScript source code

window.onload = function () {
    var d = new Date();

    var year  = d.getFullYear() - 18;
    var month = d.getMonth()+1;
    var day = d.getDate();

    var max_date = year + "-" + month + "-" + day;

    document.getElementById("date").setAttribute("max", max_date);
}

function checkInput() {

    var message = "";

    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var emailC = document.getElementById("emailC").value;
    var pass = document.getElementById("password").value;
    var passC = document.getElementById("passwordC").value;

    //if statement checks to make sure all the information is entered
    if (username == "" || email == "" || emailC == "" || pass == "" || passC == "") {
        message = message + "Please enter all the required information!"
    } else {
        /*
        * 
        * Will need to check if username is already in the database,
        * and create a seperate message for that!!!
        * 
        */

        var emailReg = new RegExp("[A-Z a-z 0-9]+[@]{1}[A-Z a-z]+[.]{1}[A-Z a-z]+");

        //Checks if email entered passes Regex and if they confirmed it correctly
        if (!emailReg.test(email))
            message = message + "The email you entered does not match the requested format! ";
        else if (email != emailC) 
            message = message + "The emails you entered are not the same! ";
        


        var passReg = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{8,})");

        //Checks if password entered passes Regex and if they confirmed it correctly
        if (!passReg.test(pass))
            message = message + "The password you entered does not match the requested format! Password must contain at least 8 characters, at least one uppercase character, and at least one number. ";
        else if (pass != passC) 
            message = message + "The passwords you entered are not the same! ";

    }

    //if they did everything correctly
    if (message == "") {

        message = "Thank you for signing up!";
        document.getElementById("text").innerHTML = message;
        document.getElementById("img").src = "images/happy.png";
        /*
        * 
        * Will need to insert everything into the database.
        * 
        */
        window.setTimeout(function () {
            document.location.href = "LogIn.html";
        }, 3000);

    } else {
        document.getElementById("text").innerHTML = message;
        document.getElementById("img").src = "images/sad.png";
    }


}
