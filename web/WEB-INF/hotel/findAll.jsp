<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <title>Hotels</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <c:if test ="${sessionEmployee.getAccessLevel() != 'MANAGER'}">

    </c:if>
    <h1>Hotels</h1>
    <div class="over">
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>City</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${hotelList}" var="hotel">
                <tr <c:if test = "${sessionEmployee.getAccessLevel() == 'MANAGER'}"> onclick="window.location.href='/hotels/${hotel.getId()}';" </c:if>>
                    <td>${hotel.getName()}</td>
                    <td>${hotel.getCity()}</td>
                    <td>${hotel.getAddress()}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

</div>

</body>
</html>
