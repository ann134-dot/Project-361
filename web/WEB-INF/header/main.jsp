<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <div class="logo" onclick="window.location.href='/dashboard';">
        <h1>Hotel MS</h1>
    </div>
    <nav>

        <c:if test="${sessionEmployee.getAccessLevel() == 'EMPLOYEE'}">
            <c:import url="/WEB-INF/header/employeeOptions.jsp"/>
        </c:if>
        <c:if test="${sessionEmployee.getAccessLevel() == 'MANAGER'}">
            <c:import url="/WEB-INF/header/managerOptions.jsp"/>
        </c:if>


    </nav>
    <div class="user">
        <h2>${sessionEmployee.getName()}</h2>
        <a href="/auth/logout">Logout</a>
    </div>
</header>
