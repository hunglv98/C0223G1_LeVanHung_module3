<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 5/31/2023
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Hiển thị danh sách</h1>
<a href="/product-servlet?action=create">Thêm mới hình ảnh</a>
<table>
    <tr>
        <th>Stt</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Manufacturer</th>
        <td>Edit</td>
        <td>Delete</td>
    </tr>

        <c:forEach items="${list}" var="list" varStatus="loop">
    <tr>
        <td>${loop.count}</td>
        <td>${list.name}</td>
        <td>${list.price}</td>
        <td>${list.description}</td>
        <td>${list.manufacturer}</td>
        <td><a href="/product-servlet?action=edit&id=${list.id}"><button>Edit</button></a> </td>
        <td><a href="/product-servlet?action=delete&id=${list.id}"><button>Delete</button></a> </td>
    </tr>
        </c:forEach>
</table>
</body>
</html>
