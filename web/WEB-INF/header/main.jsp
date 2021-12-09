<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <head><link rel="stylesheet" type="text/css" href="/css/header.css"></head>
    <div id="navbar">
    <div class="logo-image" onclick="window.location.href='/dashboard';">
        <img img src="../img/TipTop.png">
    </div>
    <ul>

        <c:if test="${sessionEmployee.getAccessLevel() == 'EMPLOYEE'}">
            <c:import url="/WEB-INF/header/employeeOptions.jsp"/>
        </c:if>
        <c:if test="${sessionEmployee.getAccessLevel() == 'MANAGER'}">
            <c:import url="/WEB-INF/header/managerOptions.jsp"/>
        </c:if>
        <c:if test="${sessionEmployee.getAccessLevel() == 'USER'}">
            <c:import url="/WEB-INF/header/userOptions.jsp"/>
        </c:if>
        <c:if test="${sessionEmployee.getAccessLevel() == 'CLEANER'}">
            <c:import url="/WEB-INF/header/cleanerOptions.jsp"/>
        </c:if>


    <c:choose>
        <c:when test ="${sessionEmployee.getAccessLevel() == 'EMPLOYEE' ||
                        sessionEmployee.getAccessLevel() == 'MANAGER' ||
                        sessionEmployee.getAccessLevel() == 'USER' ||
                        sessionEmployee.getAccessLevel() == 'CLEANER' }">
            <li>
                <h2>${sessionEmployee.getName()}</h2>
                <a href="/auth/logout">Logout</a>
            </li>
        </c:when>
        <c:otherwise>
            <div class="user">
               <li> <a href="/auth/login">Account Page</a> </li>
            </div>
        </c:otherwise>
    </c:choose>
    </ul>
</div>
</header>
