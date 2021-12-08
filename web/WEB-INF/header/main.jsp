<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>

    <div class="logo" onclick="window.location.href='/dashboard';">
        <img style = "width:50%; height:50%" src="https://ecoculturebs.com/wp-content/uploads/2020/07/TipTop-300x175.png">
    </div>
    <nav>

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
    </nav>

    <c:choose>
        <c:when test ="${sesssionEmployee == null}">
            <div class="user">
                <a href="/auth/login">Account Page</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="user">
                <h2>${sessionEmployee.getName()}</h2>
                <a href="/auth/logout">Logout</a>
            </div>
        </c:otherwise>
    </c:choose>


</header>
