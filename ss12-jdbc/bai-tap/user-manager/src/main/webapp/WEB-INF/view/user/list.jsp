<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/17/2023
  Time: 6:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../taglib/taglib.jsp" %>
<html>
<head>
    <title>Display all user</title>
    <%@include file="../../taglib/bootstrap.jsp" %>
    <link rel="stylesheet" href="../../../css/style.css">
</head>
<body>
<div class="container">
    <h1>Display all user</h1>
    <div style="display: flex; align-items: center; justify-content: space-between">
        <div>
            <a href="/user?action=create" class="btn btn-success">Create</a>
            <a href="/user?action=sort" class="btn btn-secondary">Sort</a>
        </div>
        <form class="d-flex" action="/user" method="post">
            <input type="hidden" name="action" value="search">
            <input class="form-control me-2" name="search" type="text" placeholder="Search" aria-label="Search"
                   value="${search}">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Country</th>
            <th colspan="2">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="u">
            <tr>
                <th scope="row">${u.id}</th>
                <td><a href="/user?action=detail&id=${u.id}" style="text-decoration: none">${u.name}</a></td>
                <td>${u.email}</td>
                <td>${u.country}</td>
                <td>
                    <a href="/user?action=update&id=${u.id}" class="btn btn-primary">Edit</a>
                </td>
                <td>
                    <a href="/user?action=delete&id=${u.id}" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
