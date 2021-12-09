<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=0">
    <link rel="stylesheet" href="../css/form_test.css">
    <title>Login</title>
</head>
<body>

<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
    <div class="wrapper wrapper--w680">
        <div class="card card-4">
            <div class="card-body">

                <form method="POST" action="/auth/login" id="form-login">

                    <h2 style="text-align:center">Login</h2>
                    <span id="error">${errorMessage}</span>

                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Login</label>
                                <input class="input--style-4" type="text" name="login" id="login"
                                       required="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Password</label>
                                <input class="input--style-4" type="password" id="password" name="password" required>
                            </div>
                        </div>
                    </div>
                    <div class="p-t-15">
                        <button class="btn btn--radius-2 btn--blue" type="submit" value="Submit">Submit</button>

                        <button class="btn btn--radius-2 btn--blue" onclick="location.href='/guests/new';" value="Registration">
                            Registration
                        </button>
                    <button class="btn btn--radius-2 btn--blue" onclick="location.href='/hotels';" value="Back to Main Page">Back to Main Page</button>
                    </div>
                <%--                    --%>
<%--                    <div class="submit">--%>
<%--                        <input type="submit" value="Login">--%>

<%--                        <input type="button" onclick="location.href='/guests/new';" value="Registration"/>--%>
<%--                        &lt;%&ndash;        <a href="/guests/new" >Registration</a>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                    <br>--%>
<%--                    <br>--%>
<%--                    <br>--%>
<%--                    <div class="submit">--%>
<%--                        <input type="button" onclick="location.href='/hotels';" value="Back to Main Page"/>--%>
<%--                        &lt;%&ndash;        <a href="/hotels" >Hotels</a>&ndash;%&gt;--%>
<%--                    </div>--%>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    const error = document.getElementById("error");

    if (error.innerHTML != "") {
        error.style.display = "inline";
    }
</script>

</body>
</html>