<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <title>Rooms</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <h1><c:if test="${sessionEmployee.getAccessLevel()=='CLEANER'}">Dirty </c:if>Rooms</h1>
    <div class="over">
        <table>
            <thead>
                <tr><th>ID</th><th>Number</th><th>Hotel</th><th>Room Type</th><th>Availability</th></tr>
            </thead>
            <tbody>
                <c:forEach items="${roomList}" var="room">
                    <c:if test="${room.getClean()==0 && sessionEmployee.getAccessLevel()=='CLEANER'}">
                    <tr>
                        <td>${room.getId()}</td>
                        <td>${room.getNumber()}</td>
                        <td>${room.getHotel().getName()}</td>
                        <td>${room.getRoomType().getName()}</td>
                        <td>${room.getAvailability()}</td>
                        <td><button onclick="clean(${room.getId()},${room.getNumber()},${room.getHotel().getId()},${room.getRoomType().getId()})">Clean</button></td>
                    </tr>
                    </c:if>
                    <c:if test="${sessionEmployee.getAccessLevel()!='CLEANER'}">
                        <tr>
                            <td>${room.getId()}</td>
                            <td>${room.getNumber()}</td>
                            <td>${room.getHotel().getName()}</td>
                            <td>${room.getRoomType().getName()}</td>
                            <td>${room.getAvailability()}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </div>

    </table>
</div>

</body>

<script>
    function clean(id, number, hotel_id, roomType_id){
        let url = "/rooms/"+id;

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: new URLSearchParams({
                'number': number,
                'id_hotel': hotel_id,
                'id_room_type': roomType_id,
                'clean': 1,
            }),
        }).then(resp => {   window.location.href = "/rooms/" });
    }
    function link(id) {
        console.log(id);
        let url = "/rooms/"+ id;

        fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(resp => {   window.location.href = "/rooms" });
    }
</script>
</html>
