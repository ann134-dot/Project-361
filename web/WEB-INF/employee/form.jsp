<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/form.css">
    <title>Employees</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <form action="/employee" id="form">
<%--        <c:if test="${employee == null}">method="POST" </c:if> > --%>
<%--        <h1><c:choose><c:when test="${employee == null}">New </c:when><c:otherwise>Edit </c:otherwise></c:choose>Employee</h1>--%>
    <h1>Edit Employee</h1>
    <label for="name">Name</label>
        <input type="text" name="name" id="name" autocomplete="off" autofocus="autofocus" required value="${employee.getName()}" readonly>
        <label for="surname">Surname</label>
        <input type="text" name="surname" id="surname" autocomplete="off" autofocus="autofocus" required value="${employee.getSurname()}" readonly>
        <label for="email">Email</label>
        <input type="text" name="email" id="email" autocomplete="off" autofocus="autofocus" required value="${employee.getEmail()}" readonly>
        <label for="address">Address</label>
        <input type="text" name="address" id="address" autocomplete="off" autofocus="autofocus" required value="${employee.getAddress()}" readonly>
        <label for="shift">Shift</label>
        <input type="text" name="shift" id="shift" autocomplete="off" autofocus="autofocus" required value="${employee.getShift()}" required>
        <label for="salary">Salary</label>
        <input type="number" min = "1" name="salary" id="salary" autocomplete="off" autofocus="autofocus" required value="${employee.getSalary()}" required>
        <label for="access_level">Access Level</label>
    <input type="text" name="access_level" id="access_level" autocomplete="off" autofocus="autofocus" required value="${employee.getAccessLevel()}" readonly>
        <label for="id_hotel">Hotel</label>
    <input type="text" min = "1" name="id_hotel" id="id_hotel" autocomplete="off" autofocus="autofocus" required value="${employee.getHotel().getName()}" readonly>
        <label for="login">Login</label>
        <input type="text" name="login" id="login" required autocomplete="off" value="${employee.getLogin()}" readonly>
        <label for="password">Password</label>
        <input type="password" required name="password" id="password" autocomplete="off" value="${employee.getPassword()}" readonly>
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
        let url = "/employee/${employee.getId()}";

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'name': document.getElementById("name").value,
                'surname': document.getElementById("surname").value,
                'email': document.getElementById("email").value,
                'address': document.getElementById("address").value,
                'shift': document.getElementById("shift").value,
                'salary': document.getElementById("salary").value,
                'access_level': document.getElementById("access_level").value,
                'login': document.getElementById("login").value,
                'guest_id': 0,
                'password': document.getElementById("password").value,
                'id_hotel': document.getElementById("id_hotel").value
            }),
        }).then(resp => {   window.location.href = url });
    }

    if(document.getElementById("form").method !== "post"){
        document.getElementById("form").addEventListener("submit", send);
    }

</script>
</html>

