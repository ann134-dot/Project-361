<%@ page import="java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=0">
    <title>Dashboard</title>

    <c:if test="${sessionEmployee.getAccessLevel() == 'EMPLOYEE'}">
        <c:set var="css" value="/css/dash.css" />
    </c:if>
    <c:if test="${sessionEmployee.getAccessLevel() == 'MANAGER'}">
        <c:set var="css" value="/css/managerDash.css" />
    </c:if>
    <c:if test="${sessionEmployee.getAccessLevel() == 'USER'}">
        <c:set var="css" value="/css/dash.css" />
    </c:if>


    <link rel="stylesheet" type="text/css" href="${css}">
</head>
<body>

<c:import url="/WEB-INF/header/main.jsp"/>

<c:if test="${sessionEmployee.getAccessLevel() == 'EMPLOYEE'}">
    <c:import url="/WEB-INF/employeeDashboard.jsp"/>
</c:if>
<c:if test="${sessionEmployee.getAccessLevel() == 'MANAGER'}">
    <c:import url="/WEB-INF/managerDashboard.jsp"/>
</c:if>
<c:if test="${sessionEmployee.getAccessLevel() == 'USER'}">
    <c:import url="/WEB-INF/userDashboard.jsp"/>
</c:if>

</body>
</html>
