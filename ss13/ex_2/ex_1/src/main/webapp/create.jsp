<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 6/1/2023
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/UserServlet?action=create" method="post">
        <label>Name</label>
        <input type="text" name="name">
        <label>Email</label>
        <input type="text" name="email">
        <label>Country</label>
        <input type="text" name="country"><hr>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
