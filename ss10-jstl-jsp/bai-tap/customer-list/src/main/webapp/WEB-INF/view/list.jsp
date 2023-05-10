<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/10/2023
  Time: 6:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../taglib/taglib.jsp"%>
<html>
<head>
    <title>List Customer</title>
</head>
<body>
    <div class="container">
        <h1>Danh sách khách hàng</h1>
        <table class="table">
            <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${customers}" var="c">
                <tr>
                    <td>${c.name}</td>
                    <td>${c.dateOfBirth}</td>
                    <td>${c.address}</td>
                    <td><img src="${c.img}" alt="" width="70px" height="50px"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
