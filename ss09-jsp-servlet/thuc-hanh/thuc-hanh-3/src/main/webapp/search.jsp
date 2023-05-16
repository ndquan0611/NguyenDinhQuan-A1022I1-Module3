<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/8/2023
  Time: 6:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
    <h2>Vietnamese Dictionary</h2>
    <form action="/translation" method="get">
        <input type="text" name="search" placeholder="Enter your word: "/>
        <input type="submit" id="submit" value="Search: "/>
    </form>
</body>
</html>
