<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/16/2023
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../taglib/taglib.jsp" %>
<html>
<head>
    <title>Display all product</title>
</head>
<body>
<div>
    <h1>Danh sách sản phẩm</h1>
    <a href="/product?action=create">Create</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Desc</th>
            <th>Producer</th>
            <th colspan="2">Action</th>
        </tr>
        <c:forEach items="${products}" var="p">
            <tr>
                <td>${p.id}</td>
                <td><a href="/product?action=detail&id=${p.id}">${p.name}</a></td>
                <td>${p.price}</td>
                <td>${p.desc}</td>
                <td>${p.producer}</td>
                <td>
                    <a href="/product?action=update&id=${p.id}">Update</a>
                    <a href="/product?action=delete&id=${p.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
