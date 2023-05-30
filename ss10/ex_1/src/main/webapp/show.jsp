<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 5/30/2023
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<c:import url="nabar.jsp"></c:import>
<h1>Danh sách khách hàng</h1>
<table border="1px" style="border:solid">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${list}" var="l" varStatus="loop">
        <tr>
            <td>
                    ${loop.count}
            </td>
            <td>
                    ${l.name}
            </td>
            <td>
                    ${l.dateOfBirth}
            </td>
            <td>
                    ${l.address}
            </td>
            <td>
                <img src="${l.image}">
            </td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
