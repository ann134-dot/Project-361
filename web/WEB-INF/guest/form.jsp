
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/form.css">
    <title>Guests</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <form action="/guests" id="form" <c:if test="${guest == null}">method="POST" </c:if> >
        <h1><c:choose><c:when test="${guest == null}">New</c:when><c:otherwise>Edit</c:otherwise></c:choose> Guest</h1>
        <label for="name">Login</label>
        <input type="text" name="login" id="login" autocomplete="off" autofocus="autofocus" value="${guest.getLogin()}" required>
        <label for="name">Password</label>
        <input type="password" name="password" id="password" autocomplete="off" autofocus="autofocus" value="${guest.getPassword()}" required>
        <label for="name">Name</label>
        <input type="text" name="name" id="name" autocomplete="off" autofocus="autofocus" value="${guest.getName()}" required>
        <label for="document">Identification Type</label>
        <input type="text" name="document_type" id="document_type" autocomplete="off" value="${guest.getDocumentType()}" required>
        <label for="document">Document</label>
        <input type="text" name="document" id="document" autocomplete="off" value="${guest.getDocument()}" required>
        <label for="birth_date">Birth Date</label>
        <input type="date" name="birth_date" id="birth_date" autocomplete="off" value="${guest.getBirthDate()}" required>
        <label for="email">E-mail</label>
        <input type="email" name="email" id="email" autocomplete="off" value="${guest.getEmail()}" required>
        <label for="phone_number">Phone Number</label>
        <input type="tel" name="phone_number" id="phone_number" autocomplete="off" value="${guest.getPhoneNumber()}" onkeydown="mask(this, mphone);" required>
        <label for="phone_number">Home Number</label>
        <input type="tel" name="home_number" id="home_number" autocomplete="off" value="${guest.getHomeNumber()}" >

        <div class="submit">
            <button onclick="window.history.go(-1);" type="button">Cancel</button>
            <input type="submit" value="Submit" id="button">
        </div>
    </form>
</div>
</body>
<script>

    function mask(o, f) {
        setTimeout(function() {
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

    function send(e){
        e.preventDefault();
        let url = "/guests/${guest.getId()}";

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'name': document.getElementById("name").value,
                'document': document.getElementById("document").value,
                'birth_date': document.getElementById("birth_date").value,
                'email': document.getElementById("email").value,
                'phone_number': document.getElementById("phone_number").value,
                'login': document.getElementById("login").value,
                'password': document.getElementById("password").value,
                'document_type': document.getElementById("document_type").value,
                'home_number': document.getElementById("home_number").value,

            }),
        }).then(resp => {   window.location.href = url });


    }

    if(document.getElementById("form").method !== "post"){
        document.getElementById("form").addEventListener("submit", send);
    }

</script>
</html>
