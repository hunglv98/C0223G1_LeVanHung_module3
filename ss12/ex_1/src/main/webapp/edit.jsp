<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 6/1/2023
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/UserServlet?action=edit" method="post">
        <label>ID</label>
        <input name="id" value="${user.getId()}" readonly>
        <label>Name</label>
        <input type="text" name="name" value="${user.getName()}">
        <label>Email</label>
        <input type="text" name="email" value="${user.getEmail()}">
        <label>Country</label>
        <input type="text" name="country" value="${user.getCountry()}">
        <button type="submit">Submit</button>
    </form>
</body>
</html>
