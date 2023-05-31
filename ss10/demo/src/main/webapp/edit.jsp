<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 5/31/2023
  Time: 8:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/student-servlet?action=edit">
    <label>id</label>
    <input name="id" value="${id}" readonly>
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
