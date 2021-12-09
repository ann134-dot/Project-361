<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>

    <link rel="stylesheet" type="text/css" href="/css/form_test.css">
    <title>Guests</title>
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">

    <script>
        $(function(){
            $("#header").load("header_test.jsp");
            // $("#footer").load("footer.html");
        });
    </script>

</head>
<body>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<!-- main -->
<div id="header"></div>

<div class="main-w3layouts wrapper">
    <h1><c:choose><c:when test="${guest == null}">New</c:when><c:otherwise>Edit</c:otherwise></c:choose> Guest</h1>
    <div class="main-agileinfo">
        <div class="agileits-top">
            <form action="/guests" id="form"
                  <c:if test="${guest == null}">method="POST" </c:if> >
                <input class="text" type="text" name="name" id="name" placeholder="Name" value="${guest.getName()}"
                       required="">
                <input class="text" type="text" name="surname" id="surname" placeholder="Surname"
                       value="${guest.getSurname()}" required="">
                <input class="text" type="text" name="address" id="address" placeholder="Address"
                       value="${guest.getAddress()}" required="">
                <input class="text w3lpass" type="text" name="document_type" id="document_type"
                       value="${guest.getDocumentType()}" placeholder="Identification Type" required="">
                <input class="text" type="text" name="document" id="document" value="${guest.getDocument()}"
                       placeholder="Document" required="">
                <input class="text" type="date" name="birth_date" id="birth_date" autocomplete="off"
                       value="${guest.getBirthDate()}" placeholder="Birth Date" required="">
                <input class="text email" type="email" name="email" id="email" value="${guest.getEmail()}"
                       placeholder="Email" required="">
                <input class="text" type="tel" name="phone_number" id="phone_number" autocomplete="off"
                       value="${guest.getPhoneNumber()}" onkeydown="mask(this, mphone);" placeholder="Phone Number"
                       required="">
                <input class="text" type="tel" name="home_number" id="home_number" autocomplete="off"
                       value="${guest.getHomeNumber()}"
                       onkeydown="mask(this, mphone);" placeholder="Home Number"
                       required="">
                <input class="text" type="text" name="login" id="login" value="${guest.getLogin()}" placeholder="Login"
                       required="">
                <input class="text w3lpass" type="password" name="password" id="password" value="${guest.getPassword()}"
                       placeholder="Password" required="">
                <input type="submit" value="Submit" id="button">
               <%-- <button onclick="window.history.go(-1);" type="button">Cancel</button>
            --%></form>
            <p>Don't have an Account? <a href="#"> Login Now!</a></p>
        </div>
    </div>
    <!-- copyright -->
    <div class="colorlibcopy-agile">
        <p>© 2018 Colorlib Signup Form. All rights reserved | Design by <a href="https://colorlib.com/" target="_blank">Colorlib</a>
        </p>
    </div>
    <!-- //copyright -->
    <ul class="colorlib-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<!-- //main -->
</body>
<script>

    function mask(o, f) {
        setTimeout(function () {
            let v = mphone(o.value);
            if (v != o.value) {
                o.value = v;
            }
        }, 1);
    }

    function mphone(v) {
        let r = v.replace(/\D/g, "");
        r = r.replace(/^0/, "");
        if (r.length > 10) {
            r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
        } else if (r.length > 5) {
            r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
        } else if (r.length > 2) {
            r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
        } else {
            r = r.replace(/^(\d*)/, "($1");
        }
        return r;
    }

    function send(e) {
        e.preventDefault();
        let url = "/guests/${guest.getId()}";

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'name': document.getElementById("name").value,
                'surname': document.getElementById("surname").value,
                'address': document.getElementById("address").value,
                'document': document.getElementById("document").value,
                'birth_date': document.getElementById("birth_date").value,
                'email': document.getElementById("email").value,
                'phone_number': document.getElementById("phone_number").value
            }),
        }).then(resp => {
            window.location.href = url
        });
    }

    if (document.getElementById("form").method !== "post") {
        document.getElementById("form").addEventListener("submit", send);
    }

</script>
</html>
