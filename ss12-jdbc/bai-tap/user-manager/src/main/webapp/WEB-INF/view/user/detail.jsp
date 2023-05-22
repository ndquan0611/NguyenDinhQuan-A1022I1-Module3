<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/22/2023
  Time: 6:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../taglib/taglib.jsp"%>
<html>
<head>
    <title>Detail product</title>
</head>
<body>
<div>
    <p>ID: </p>
    <p>${detail.id}</p>
    <p>Name: </p>
    <p>${detail.name}</p>
    <p>Email: </p>
    <p>${detail.email}</p>
    <p>Country</p>
    <p>${detail.country}</p>
</div>
</body>
</html>
