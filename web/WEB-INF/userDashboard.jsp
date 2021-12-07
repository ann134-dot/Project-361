<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content">
    <h1 id="today"></h1>
</div>

<script>
    let today = document.getElementById("today");

    const monthNames = ["January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
    ];

    let now = new Date();
    let dateNow = monthNames[now.getMonth()] + " " + now.getDate() + ", " + now.getFullYear();
    today.innerText = dateNow;

</script>