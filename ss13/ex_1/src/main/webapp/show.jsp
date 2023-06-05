<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h1>Hiển thị danh sách User</h1>
<a href="/UserServlet?action=create">ADD NEW USER</a>
<table style="border: black solid 1px">
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
            <td><a href="/UserServlet?action=edit&id=${list.id}"><button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal">Edit</button></a>
            </td>
            <td><button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modelId"
                        onclick="remove(${list.id},'${list.name}')">Delete</button>
            </td>
        </tr>
    </c:forEach>
</table>
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelTitleId"></h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Do you wanna remove <span id="name"></span>?
            </div>

            <div class="modal-footer">
                <form action="/UserServlet?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">
</script>
<script>
    function remove(id, name) {
        document.getElementById("name").innerText = name;
        document.getElementById("idDelete").value = id;
    }
</script>
</body>
</html>
