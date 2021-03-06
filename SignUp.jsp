<%@ page import="java.util.*" %>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="stylesheet.css">
    <script src="signup.js"></script>
	<title>Pokemon Hotels</title>
</head>

<body>
    <div class="bar">
        <a href="Login.html">Log in</a>
        <a href="index.html">Home</a>
        <a href="Pokedex.html">Pokedex</a>
        <input id="search-bar" type="text" placeholder="Search . . .">
        <script>
            var input = document.getElementById("search-bar");
            input.addEventListener("keyup", function (event) {
                if (event.keyCode === 13) {
                    document.location.href = "SearchResult.html";
                }
            });
        </script>
    </div>
    <br />
    <div class="home-content">
        <br />
        <br />
        <br />
        <br />
        <div class="login_signup">
            <form action="" method="post" >
                <br />
                <div class="nameOfField">* User name:</div>
                <div class="inputField"><input type="text" id="username" autofocus /></div>
                <br />
                <br />
                <div class="nameOfField">* Email:</div>
                <div class="inputField"><input type="text" id="email"/></div>
                <br />
                <br />
                <div class="nameOfField">* Email Confirmation: </div>
                <div class="inputField"><input type="text" id="emailC"/></div>
                <br />
                <br />
                <div class="nameOfField">* Password: </div>
                <div class="inputField"><input type="password" id="password" title="Password must contain at least 8 characters, at least one uppercase character, and at least one number." required/></div>
                <br />
                <br />
                <div class="nameOfField">* Retype Password: </div>
                <div class="inputField"><input type="password" id="passwordC" title="Password must contain at least 8 characters, at least one uppercase character, and at least one number." required/></div>
                <br />
                <br />
                <div class="nameOfField">&nbsp;&nbsp; Birthday: </div>
                <div class="inputField">
                    <input type="date" id="date" style="width:150px;"/>
                </div>
                <br />
                <br />
                <br />
                <input type="button" id="submit" value="Submit" onclick="checkInput()" style="background-color:white;" /> <br /><br />
            </form>
            <div class="reply-box">
                <img id="img" src="images/happy.png" title="Happy!" height="80" width="80"/>
                <p id="text">Welcome! Please sign up with the correct input! Keep in mind that passwords must contain at least 8 characters, at least one uppercase character, and at least one number.</p>
            </div>
        </div>
    </div>
    <br />
    <div class="contact-info">
        <p>Contact Info</p>
    </div>
</body>
</html>