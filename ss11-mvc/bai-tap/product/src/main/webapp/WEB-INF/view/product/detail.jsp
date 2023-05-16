<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Title</title>
</head>
<body>
<div>
    <p>ID: </p>
    <c:out value="${product.id}"></c:out>
    <p>Name: </p>
    <c:out value="${product.name}"></c:out>
    <p>Price: </p>
    <c:out value="${product.price}"></c:out>
    <p>Desc: </p>
    <c:out value="${product.desc}"></c:out>
    <p>Producer: </p>
    <c:out value="${product.producer}"></c:out>
</div>
</body>
</html>
