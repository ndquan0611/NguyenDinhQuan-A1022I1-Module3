<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/16/2023
  Time: 9:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<div>
    <h1>Update</h1>
    <form action="/product" method="post">
        <input type="hidden" name="action" value="update">
        <p>Id: </p>
        <input type="text" name="id" value="${product.id}">
        <p>Name: </p>
        <input type="text" name="name" value="${product.name}">
        <p>Price: </p>
        <input type="text" name="price" value="${product.price}">
        <p>Desc: </p>
        <input type="text" name="desc" value="${product.desc}">
        <p>Producer: </p>
        <input type="text" name="producer" value="${product.producer}">
        <input type="submit" value="Update">
    </form>
</div>
</body>
</html>
