<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/17/2023
  Time: 7:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../taglib/taglib.jsp"%>
<html>
<head>
    <title>Update user</title>
    <%@include file="../../taglib/bootstrap.jsp"%>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<div class="container">
    <h1>Update user</h1>
    <form action="/user" method="post">
        <input type="hidden" name="action" value="update">
        <div class="mb-3">
            <label for="id" class="form-label">ID: </label>
            <input type="number" class="form-control" id="id" name="id" value="${user.id}">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Name: </label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email: </label>
            <input type="text" class="form-control" id="email" name="email" value="${user.email}">
        </div>
        <div class="mb-3">
            <label for="country" class="form-label">Country: </label>
            <input type="text" class="form-control" id="country" name="country" value="${user.country}" }>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
