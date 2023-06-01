<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 6/1/2023
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Hiển thị danh sách User</h1>
<%--int id, String name, String email, String country--%>
<a href="/UserServlet?action=create">ADD NEW USER</a>
<table>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="list" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${list.name}</td>
            <td>${list.email}</td>
            <td>${list.country}</td>
            <td><a href="/UserServlet?action=edit&id=${list.id}"> <button>Edit</button></a></td>
            <td><a href="/UserServlet?action=delete&id=${list.id}"> <button>Delete</button></a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
