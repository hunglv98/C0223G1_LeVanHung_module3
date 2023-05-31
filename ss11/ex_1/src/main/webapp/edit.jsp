<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 5/31/2023
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>EDIT DATA</h2>
<form action="/product-servlet?action=edit" method="post">
    <label>ID</label>
    <input name="id" value="${id}" readonly>
    <label>NAME</label>
    <input type="text" name="name">
    <label>PRICE</label>
    <input type="text" name="price">
    <label>DESCRIPTION</label>
    <input type="text" name="description">
    <label>MANUFACTURER</label>
    <input type="text" name="manufacturer"><hr>
    <button type="submit">SUBMIT</button>
</form>
</body>
</html>
