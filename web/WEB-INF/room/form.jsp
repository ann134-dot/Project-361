<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/form.css">
    <title>Rooms</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <form action="/rooms" id="form" <c:if test="${room == null}">method="POST" </c:if> >
        <h1><c:choose><c:when test="${room == null}">New</c:when><c:otherwise>Edit</c:otherwise></c:choose> Room</h1>
        <label for="number">Number</label>
        <input type="number" name="number" id="number" autofocus="autofocus" value="${room.getNumber()}" required>
        <label for="floor">Floor</label>
        <input type="floor" name="floor" id="floor" autofocus="autofocus" value="${room.getFloor()}" required>
        <label for="id_hotel">Hotel</label>
        <select name="id_hotel" id="id_hotel" required>
            <option disabled selected value></option>
            <c:forEach items="${hotelList}" var="hotel">
                <option value="${hotel.getId()}" <c:if test="${hotel.getId() == room.getHotel().getId()}"> selected </c:if>>${hotel.getName()}</option>
            </c:forEach>
        </select>
        <label for="id_room_type">Room Type</label>
        <select name="id_room_type" id="id_room_type" required>
            <option disabled selected value></option>
            <c:forEach items="${roomTypeList}" var="roomType">
                <c:if test="${roomType.getHotel().getName()!='Hilton'}">
                <option value="${roomType.getId()}" <c:if test="${roomType.getId() == room.getRoomType().getId() && roomType.getHotel().getId() == room.getHotel().getId()}"> selected </c:if>>${roomType.getName()}</option>
                </c:if>
            </c:forEach>
        </select>
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
        let url = "/rooms/${room.getId()}";

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'number': document.getElementById("number").value,
                'floor': document.getElementById("floor").value,
                'id_hotel': document.getElementById("id_hotel").value,
                'id_room_type': document.getElementById("id_room_type").value,
            }),
        }).then(resp => {   window.location.href = url });
    }

    if(document.getElementById("form").method !== "post"){
        document.getElementById("form").addEventListener("submit", send);
    }

</script>
</html>

