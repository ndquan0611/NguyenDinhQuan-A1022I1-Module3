<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/10/2023
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<div>
    <h1>Product Discount Calculator</h1>
    <form action="/display-discount" method="post">
        <div>
            <label for="price">Price: </label>
            <input type="text" id="price" name="price">
        </div>
        <div>
            <label for="percent">Percent: </label>
            <input type="text" id="percent" name="percent">
        </div>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
