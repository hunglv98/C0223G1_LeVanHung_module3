<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 5/31/2023
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>ADD NEW PRODUCT</h1>
<form action="/product-servlet?action=add" method="post">
    <label>ID</label>
    <input type="text" name="id">
    <label>Name</label>
    <input type="text" name="name">
    <label>Price</label>
    <input type="text" name="price">
    <label>Description</label>
    <input type="text" name="description">
    <label>Manufacturer</label>
    <input type="text" name="manufacturer">
    <button type="submit">Submit</button>
</form>
</body>
</html>
