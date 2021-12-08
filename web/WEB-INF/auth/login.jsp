<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=0">
    <link rel="stylesheet" href="../css/form.css">
    <title>Login</title>
</head>
<body>

<form method="POST" action="/auth/login" id="form-login">




    <h2 style="text-align:center">Login</h2>
    <span id="error">${errorMessage}</span>
    <label for="login">Login</label>
    <input type="text" name="login" id="login" autofocus required>
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
    <div class="submit">
        <input type="submit" value="Login">

        <input type="button" onclick="location.href='/guests/new';" value="Registration" />
        <%--        <a href="/guests/new" >Registration</a>--%>
    </div>
    <br>
    <br>
    <br>
    <div class="submit">
        <input type="button" onclick="location.href='/hotels';" value = "Back to Main Page"/>
        <%--        <a href="/hotels" >Hotels</a>--%>
    </div>

</form>

<script>

    const error = document.getElementById("error");

    if(error.innerHTML != ""){
        error.style.display = "inline";
    }
</script>

</body>
</html>