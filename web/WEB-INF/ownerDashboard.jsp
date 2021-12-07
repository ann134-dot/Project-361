<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content">

    <h1 id="today"></h1>

<%--    <div id="revenues">--%>
<%--        <h2>Revenues</h2>--%>
<%--        <div class="property" style="grid-area: 2/1/3/2;">--%>
<%--            <span class="label">Days</span>--%>
<%--            <span class="data">$ <span id="yearRevenues"></span></span>--%>
<%--        </div>--%>

<%--        <div class="property" style="grid-area: 2/2/3/3;">--%>
<%--            <span class="label">Salary</span>--%>
<%--            <span class="data">$ <span id="weekRevenues"></span></span>--%>
<%--        </div>--%>
<%--    </div>--%>





<%--    <div id="rooms">--%>
<%--        <h2>Hotel Current Situation</h2>--%>
<%--        <div class="property" style="grid-area: 2/1/3/2;">--%>
<%--            <span class="label">Occupied</span>--%>
<%--            <span class="data"><span id="occupiedRooms"></span></span>--%>
<%--        </div>--%>
<%--        <div class="property" style="grid-area: 2/2/3/3;">--%>
<%--            <span class="label">Available</span>--%>
<%--            <span class="data"><span id="availableRooms"></span></span>--%>
<%--        </div>--%>
<%--        <div class="property" style="grid-area: 2/3/3/4;">--%>
<%--            <span class="label">Total</span>--%>
<%--            <span class="data"><span id="totalRooms"></span></span>--%>
<%--        </div>--%>
<%--    </div>--%>



</div>

<script>
    let today = document.getElementById("today");

    const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];

    let now = new Date();
    let dateNow = monthNames[now.getMonth()] + " " + now.getDate() + ", " + now.getFullYear();
    today.innerText = dateNow;

    // let hoursToMidnight = 24 - now.getHours();
    // let minutesToNextHour = 60 - now.getMinutes();
    // let secondsToNextMinute = 60 - now.getSeconds();
    //
    // let minutesToMidnight = (hoursToMidnight * 60) + minutesToNextHour;
    //
    // let secondsToMidnight = (minutesToMidnight * 60) + secondsToNextMinute;
    //
    // let millisecondsToMidnight = secondsToMidnight * 1000;
    //
    // setTimeout(function () {
    //     window.location.reload();
    // }, millisecondsToMidnight)
    //
    //
    // let url = "/api/ownerDashboard";
    // fetch(url, {method: 'GET'})
    //     .then(response => response.json())
    //     .then(data => {
    //
    //         document.getElementById("yearRevenues").innerHTML = data.yearRevenues;
    //         document.getElementById("monthRevenues").innerHTML = data.monthRevenues;
    //
    //         document.getElementById("occupiedRooms").innerHTML = data.occupiedRooms;
    //         document.getElementById("availableRooms").innerHTML = data.availableRooms;
    //         document.getElementById("totalRooms").innerHTML = data.totalRooms;
    //
    //     });


</script>