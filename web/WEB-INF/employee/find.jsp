<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/one.css">
    <title>Employees</title>
    <meta name="viewport" content="width=device-width, user-scalable=0">
</head>
<body>
<c:import url="/WEB-INF/header/main.jsp"/>

<c:if test="${sessionEmployee.getId() == employee.getId()}">
    <style>
        .edit {
            justify-content: flex-end;
        }
    </style>
</c:if>

<div class="content">
    <div class="model">
        <h1>${employee.getName()}</h1>
        <h3>${employee.getAccessLevel()}</h3>
    </div>
    <div class="edit">
        <c:if test="${sessionEmployee.getId() != employee.getId()}">
            <button class="delete" onclick="openModal('${employee.getName()}')">Delete</button>
        </c:if>
        <button onclick="window.location.href='/employee/${employee.getId()}/edit';">Edit</button>
    </div>

    <div class="about">
        <h2>About</h2>
        <div class="property">
            <span class="label">ID</span>
            <span class="data">${employee.getId()}</span>
        </div>
        <div class="property">
            <span class="label">Name</span>
            <span class="data">${employee.getName()}</span>
        </div>
        <div class="property">
            <span class="label">Surname</span>
            <span class="data">${employee.getSurname()}</span>
        </div>
        <div class="property">
            <span class="label">Email</span>
            <span class="data">${employee.getEmail()}</span>
        </div>
        <div class="property">
            <span class="label">Address</span>
            <span class="data">${employee.getAddress()}</span>
        </div>
        <div class="property">
            <span class="label">Shift</span>
            <span class="data">${employee.getShift()}</span>
        </div>
        <div class="property">
            <span class="label">Salary</span>
            <span class="data">${employee.getSalary()}</span>
        </div>
        <div class="property">
            <span class="label">Access Level</span>
            <span class="data">${employee.getAccessLevel()}</span>
        </div>
        <div class="property">
            <span class="label">Login</span>
            <span class="data">${employee.getLogin()}</span>
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
            <button onclick="link(${employee.getId()})" class="cancel"> Delete </button>
        </div>
    </div>
</div>
</body>
<script>
    let modal = document.getElementById("modal-delete");
    function openModal(employee) {
        modal.style.display = "flex";
        document.getElementById("sure").innerHTML = "Delete employee " + employee + "?";
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
        let url = "/employee/"+ id;
        fetch(url, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
        }).then(resp => {   window.location.href = "/employee" });
    }
</script>
</html>
