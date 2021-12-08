<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/form.css">
    <title>Hotels</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">

</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">


    <form action="/hotels" id="form" <c:if test="${hotel == null}">method="POST" </c:if> >
        <h1><c:choose><c:when test="${hotel == null}">New</c:when><c:otherwise>Edit</c:otherwise></c:choose> Hotel</h1>
        <label for="name">Name</label>
        <input type="text" name="name" id="name" autocomplete="off" autofocus="autofocus"
               value="${hotel.getName()}" required>
        <label for="city">City</label>
        <input type="text" name="city" id="city"
               value="${hotel.getCity()}" required>
        <label for="address">Address</label>
        <input type="text" name="address" id="address"
               value="${hotel.getAddress()}" required>

        <div class="submit">
            <button onclick="window.history.go(-1);" type="button">Cancel</button>
            <input type="submit" value="Submit" id="button">
        </div>
    </form>
</div>
</body>

<script>
    function send(e){
        e.preventDefault();
        let url = "/hotels/${hotel.getId()}";

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'name': document.getElementById("name").value,
                'city': document.getElementById("city").value,
                'address': document.getElementById("address").value
            }),
        }).then(resp => {   window.location.href = url });
    }

    if(document.getElementById("form").method !== "post"){
        document.getElementById("form").addEventListener("submit", send);
    }

</script>
</html>
