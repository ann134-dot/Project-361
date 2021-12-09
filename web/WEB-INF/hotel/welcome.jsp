<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <link rel="stylesheet" href="../css/welcome.css">
<%--    <title>Homepage design</title>--%>
<%--</head>--%>

<body>
<div class="banner-area">
    <header>
        <div class="menu">
            <ul>
                <c:choose>
                    <c:when test ="${sessionEmployee.getAccessLevel() == 'EMPLOYEE' ||
                        sessionEmployee.getAccessLevel() == 'MANAGER' ||
                        sessionEmployee.getAccessLevel() == 'USER' ||
                        sessionEmployee.getAccessLevel() == 'CLEANER' }">
                        <li>
                            ${sessionEmployee.getName()}
                            <a href="/auth/logout">Logout</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <div class="user">
                            <li> <a href="/auth/login">Account Page</a> </li>
                            <li><a href="/auth/login">Login</a></li>
                            <li><a href="#">Signup</a></li>
                        </div>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </header>
    <div class="banner-text">
        <h1>WELCOME TO TIP TOP HOTELS!</h1>
        <p>Where dreams become reality</p>
        <a href="/hotels">Hotels</a>
    </div>

</div>
</body>

