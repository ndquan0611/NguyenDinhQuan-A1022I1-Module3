<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/17/2023
  Time: 6:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../taglib/taglib.jsp"%>
<html>
<head>
    <title>Create new user</title>
    <%@include file="../../taglib/bootstrap.jsp"%>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<div class="container">
    <h1>Create new user</h1>
    <form action="/user" method="post">
        <input type="hidden" name="action" value="create">
        <div class="mb-3">
            <label for="id" class="form-label">ID: </label>
            <input type="number" class="form-control" id="id" name="id">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Name: </label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email: </label>
            <input type="text" class="form-control" id="email" name="email">
        </div>
        <div class="mb-3">
            <label for="country" class="form-label">Country: </label>
            <input type="text" class="form-control" id="country" name="country">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
