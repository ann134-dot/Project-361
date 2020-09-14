<%--
  Created by IntelliJ IDEA.
  User: Lavinha
  Date: 5/3/2020
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/find.css">
    <title>Bookings</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<header>
    <div class="logo" onclick="window.location.href='/dashboard';">
        <h1>HMS</h1>
    </div>
    <nav>
        <a href="/bookings/">Bookings</a><a href="/guests/">Guests</a></a><a href="/rooms/">Rooms</a><a href="/roomTypes/">Room Types</a>
    </nav>
    <div class="user">
        <h2>${sessionStaff.getName()}</h2>
        <a href="/auth/logout">Logout</a>
    </div>
</header>
<div class="content">
    <h1>Bookings</h1>
    <div class="over">
        <table>
            <thead>
                <tr><th>Guest</th><th>Arrival</th><th>Departure</th><th>Room</th><th>Total</th><th>Status</th></tr>
            </thead>
            <tbody>
            <c:forEach items="${bookingList}" var="booking">
                <tr onclick="window.location.href='/bookings/${booking.getId()}';"><td>${booking.getGuest().getName()}</td><td>${booking.getArrival()}</td><td>${booking.getDeparture()}</td><td>${booking.getRoom().getNumber()}</td><td>$${booking.getTotal()}</td><td>${booking.getStatus()}</td></tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="submit">
        <button onclick="window.location.href='/bookings/new';">New Booking</button>
    </div>
</div>
</body>
</html>


