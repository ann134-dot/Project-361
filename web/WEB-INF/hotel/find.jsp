<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/one.css">
    <title>Hotel</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>
<div class="content">
    <div class="model">
        <h1>Hotel</h1>
    </div>
    <c:if test="${allowed == true}">
    <div class="edit">
        <button class="delete" onclick="openModal('${hotel.getName()}')">Delete</button>
        <button onclick="window.location.href='/hotels/${hotel.getId()}/edit';">Edit</button>
    </div>
    </c:if>
    <div class="about">
        <h2>About</h2>
        <div class="property">
            <span class="label">ID</span>
            <span class="data">${hotel.getId()}</span>
        </div>
        <div class="property">
            <span class="label">Name</span>
            <span class="data">${hotel.getName()}</span>
        </div>
        <div class="property">
            <span class="label">City</span>
            <span class="data">${hotel.getCity()}</span>
        </div>
        <div class="property">
            <span class="label">Address</span>
            <span class="data">$${hotel.getAddress()}</span>
        </div>

    </div>
</div>
<div class="modal" id="modal-delete">
    <div class="modal-content">
        <div class="modal-header">
            <h1>Delete</h1>
        </div>
        <div class="modal-body" id="sure">
        </div>
        <div class="modal-footer">
            <button onclick="cancel()" type="button">Cancel</button>
            <button onclick="link(${hotel.getId()})" class="cancel"> Delete </button>
        </div>
    </div>
</div>
</body>
<script>
    let modal = document.getElementById("modal-delete");
    function openModal(hotel) {
        modal.style.display = "flex";
        document.getElementById("sure").innerHTML = "Delete hotel " + hotel + "?";
    }
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };

    function cancel(){
        modal.style.display = "none";
    }


    function link(id) {
        let url = "/hotels/"+ id;
        fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(resp => {   window.location.href = "/hotels" });
    }
</script>
</html>
