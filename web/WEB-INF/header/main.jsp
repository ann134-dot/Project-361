<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <div class="logo" onclick="window.location.href='/dashboard';">
        <h1>HMS</h1>
    </div>
    <nav>

        <c:if test="${sessionStaff.getAccessLevel() == 'EMPLOYEE'}">
            <c:import url="/WEB-INF/header/employeeOptions.jsp"/>
        </c:if>
        <c:if test="${sessionStaff.getAccessLevel() == 'MANAGER'}">
            <c:import url="/WEB-INF/header/managerOptions.jsp"/>
        </c:if>
        <c:if test="${sessionStaff.getAccessLevel() == 'USER'}">
            <c:import url="/WEB-INF/header/userOptions.jsp"/>
        </c:if>


    </nav>
    <div class="user">
        <h2>${sessionStaff.getName()}</h2>
        <a href="/auth/logout">Logout</a>
    </div>
</header>
