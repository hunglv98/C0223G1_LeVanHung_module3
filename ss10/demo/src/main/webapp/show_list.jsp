<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 5/30/2023
  Time: 9:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách học sinh</h1>
<a href="/student-servlet?action=add">Thêm mới học sinh</a>
<table>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Address</th>
        <th>Email</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="list" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${list.name}</td>
            <td>${list.address}</td>
            <td>${list.email}</td>
            <td><a href="/student-servlet?action=edit&id=${list.id}" >Edit</a></td>
            <td><a href="/student-servlet?action=delete&id=${list.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
