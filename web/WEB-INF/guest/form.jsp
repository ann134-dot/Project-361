<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <link rel="stylesheet" type="text/css" href="/css/form.css">--%>
<%--    <title>Guests</title>--%>
<%--    <meta name="viewport" content="width=device-width, user-scalable=0">--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:import url="/WEB-INF/header/main.jsp"/>--%>
<%--<div class="content">--%>
<%--    <form action="/guests" id="form" <c:if test="${guest == null}">method="POST" </c:if> >--%>
<%--        <h1><c:choose><c:when test="${guest == null}">New</c:when><c:otherwise>Edit</c:otherwise></c:choose> Guest</h1>--%>

<%--        <label for="name">Name</label>--%>
<%--        <input type="text" name="name" id="name" autocomplete="off" autofocus="autofocus" value="${guest.getName()}" required>--%>
<%--        <label for="surname">Surname</label>--%>
<%--        <input type="text" name="surname" id="surname" autocomplete="off" autofocus="autofocus" value="${guest.getSurname()}" required>--%>
<%--        <label for="name">Address</label>--%>
<%--        <input type="text" name="address" id="address" autocomplete="off" autofocus="autofocus" value="${guest.getAddress()}" required>--%>
<%--        <label for="document">Identification Type</label>--%>
<%--        <input type="text" name="document_type" id="document_type" autocomplete="off" value="${guest.getDocumentType()}" required>--%>
<%--        <label for="document">Document</label>--%>
<%--        <input type="text" name="document" id="document" autocomplete="off" value="${guest.getDocument()}" required>--%>
<%--        <label for="birth_date">Birth Date</label>--%>
<%--        <input type="date" name="birth_date" id="birth_date" autocomplete="off" value="${guest.getBirthDate()}" required>--%>
<%--        <label for="email">E-mail</label>--%>
<%--        <input type="email" name="email" id="email" autocomplete="off" value="${guest.getEmail()}" required>--%>
<%--        <label for="phone_number">Phone Number</label>--%>
<%--        <input type="tel" name="phone_number" id="phone_number" autocomplete="off" value="${guest.getPhoneNumber()}" onkeydown="mask(this, mphone);" required>--%>

<%--        <label for="phone_number">Home Number</label>--%>
<%--        <input type="tel" name="home_number" id="home_number" autocomplete="off" value="${guest.getHomeNumber()}" onkeydown="mask(this, mphone);" >--%>
<%--        <label for="name">Login</label>--%>
<%--        <input type="text" name="login" id="login" autocomplete="off" autofocus="autofocus" value="${guest.getLogin()}" required>--%>
<%--        <label for="name">Password</label>--%>
<%--        <input type="password" name="password" id="password" autocomplete="off" autofocus="autofocus" value="${guest.getPassword()}" required>--%>

<%--        <div class="submit">--%>
<%--            <button onclick="window.history.go(-1);" type="button">Cancel</button>--%>
<%--            <input type="submit" value="Submit" id="button">--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--<script>--%>

<%--    function mask(o, f) {--%>
<%--        setTimeout(function() {--%>
<%--            let v = mphone(o.value);--%>
<%--            if (v != o.value) {--%>
<%--                o.value = v;--%>
<%--            }--%>
<%--        }, 1);--%>
<%--    }--%>

<%--    function mphone(v) {--%>
<%--        let r = v.replace(/\D/g, "");--%>
<%--        r = r.replace(/^0/, "");--%>
<%--        if (r.length > 10) {--%>
<%--            r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");--%>
<%--        } else if (r.length > 5) {--%>
<%--            r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");--%>
<%--        } else if (r.length > 2) {--%>
<%--            r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");--%>
<%--        } else {--%>
<%--            r = r.replace(/^(\d*)/, "($1");--%>
<%--        }--%>
<%--        return r;--%>
<%--    }--%>

<%--    function send(e){--%>
<%--        e.preventDefault();--%>
<%--        let url = "/guests/${guest.getId()}";--%>

<%--        fetch(url, {--%>
<%--            method: 'PUT',--%>
<%--            headers: {--%>
<%--                'Content-Type': 'application/x-www-form-urlencoded'--%>
<%--            },--%>
<%--            body: new URLSearchParams({--%>
<%--                'name': document.getElementById("name").value,--%>
<%--                'surname': document.getElementById("surname").value,--%>
<%--                'address': document.getElementById("address").value,--%>
<%--                'document': document.getElementById("document").value,--%>
<%--                'birth_date': document.getElementById("birth_date").value,--%>
<%--                'email': document.getElementById("email").value,--%>
<%--                'phone_number': document.getElementById("phone_number").value--%>
<%--            }),--%>
<%--        }).then(resp => {   window.location.href = url });--%>
<%--    }--%>

<%--    if(document.getElementById("form").method !== "post"){--%>
<%--        document.getElementById("form").addEventListener("submit", send);--%>
<%--    }--%>

<%--</script>--%>
<%--</html>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <title>Guests</title>
    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="/css/form_test.css">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>

<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
    <div class="wrapper wrapper--w680">
        <div class="card card-4">
            <div class="card-body">
                <h1 style="text-align: center"><c:choose><c:when test="${guest == null}">New</c:when><c:otherwise>Edit</c:otherwise></c:choose>
                    Guest</h1>

                <form action="/guests" id="form"
                     <c:if test="${guest == null}">method="POST" </c:if> >
                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">first name</label>
                                <input class="input--style-4" type="text" name="name" id="name"
                                       value="${guest.getName()}" required="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">last name</label>
                                <input class="input--style-4" type="text" name="surname" id="surname"
                                       value="${guest.getSurname()}" required="">
                            </div>
                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="col-1">
                            <div class="input-group">
                                <label class="label">Birthday</label>
                                <div class="input-group-icon">
                                    <input class="input--style-4 js-datepicker" type="date" name="birth_date"
                                           id="birth_date"
                                           value="${guest.getBirthDate()}" required="">
                                    <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="col-1">
                            <div class="input-group">
                                <label class="label">Address</label>
                                <input class="input--style-4" type="address" id="address"
                                       value="${guest.getAddress()}" required="">
                            </div>
                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Phone Number</label>
                                <input class="input--style-4" type="text" name="phone_number" id="phone_number"
                                       autocomplete="off"
                                       value="${guest.getPhoneNumber()}" onkeydown="mask(this, mphone);"
                                       required="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Home Number</label>
                                <input class="input--style-4" type="text" name="home_number" id="home_number"
                                       autocomplete="off"
                                       value="${guest.getHomeNumber()}"
                                       onkeydown="mask(this, mphone);" required="">
                            </div>
                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Identification Type</label>
                                <input class="input--style-4" type="text" name="document_type" id="document_type"
                                       value="${guest.getDocumentType()}" required="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Document</label>
                                <input class="input--style-4" type="text" name="document" id="document"
                                       value="${guest.getDocument()}"
                                       required="">
                            </div>
                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Email</label>
                                <input class="input--style-4" type="email" name="email" id="email"
                                       value="${guest.getEmail()}"
                                       required="">
                            </div>
                        </div>
                        <div class="col-2">
                            <div class="input-group">
                                <label class="label">Login</label>
                                <input class="input--style-4" type="text" name="login" id="login"
                                       value="${guest.getLogin()}"
                                       required="">
                            </div>
                        </div>
                    </div>
                    <div class="row row-space">
                        <div class="col-1">
                            <div class="input-group">
                                <label class="label">Password</label>
                                <input class="input--style-4" type="password" name="password" id="password"
                                       value="${guest.getPassword()}"
                                       required="">
                            </div>
                        </div>
                    </div>
                    <div class="row row-space">
                        <button class="btn btn--radius-2 btn--blue" type="submit" value="Submit">Submit</button>

                        <button class="btn btn--radius-2 btn--blue" onclick="window.history.go(-1);" type="submit">
                            Cancel
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
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
