<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <title>Employees</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <h1>Employees</h1>
    <div class="over">
        <table>
            <thead>
                <tr><th>Name</th><th>Surname</th><th>Email</th><th>Address</th><th>Shift</th><th>Salary</th><th>Access Level</th><th>Login</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${employeeList}" var="employee">
                <c:if test = "${employee.getAccessLevel() != 'USER'}"> <tr onclick="window.location.href='/employee/${employee.getId()}';"><td>${employee.getName()}</td><td>${employee.getSurname()}</td><td>${employee.getEmail()}</td><td>${employee.getAddress()}</td><td>${employee.getShift()}</td><td>${employee.getSalary()}</td><td>${employee.getAccessLevel()}</td><td>${employee.getLogin()}</td></tr>
           </c:if> </c:forEach>
            </tbody>
        </table>
    </div>

    </table>

</div>


<script>
    function link(id) {
        console.log(id);
        let url = "/employee/"+ id;

        fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(resp => {   window.location.href = "/employee" });
    }
</script>
</html>

