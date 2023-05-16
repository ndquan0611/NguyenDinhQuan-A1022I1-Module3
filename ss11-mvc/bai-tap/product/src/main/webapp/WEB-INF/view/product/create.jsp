<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/16/2023
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<div>
    <h1>Create</h1>
    <form action="/product" method="post">
        <input type="hidden" name="action" value="create">
        <p>Id: </p>
        <input type="text" name="id">
        <p>Name: </p>
        <input type="text" name="name">
        <p>Price: </p>
        <input type="text" name="price">
        <p>Desc: </p>
        <input type="text" name="desc">
        <p>Producer: </p>
        <input type="text" name="producer">
        <input type="submit" value="Create">
    </form>
</div>
</body>
</html>
