<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 5/30/2023
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/student-servlet">
    <label>id</label>
    <input type="text" name="id">
    <label>name</label>
    <input type="text" name="name">
    <label>address</label>
    <input type="text" name="address">
    <label>email</label>
    <input type="text" name="email">
    <button type="submit">Submit</button>
</form>
</body>
</html>
