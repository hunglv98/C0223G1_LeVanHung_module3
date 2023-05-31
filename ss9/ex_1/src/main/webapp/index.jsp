<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<fieldset style="width: 500px">
    <legend>Exercise</legend>
        <form action="/discount">
            <label>Product Description</label>
            <input type="text" name="description" placeholder="Input the description">
            <hr>
            <label>List Price</label>
            <input type="text" name="price" placeholder="Input price">
            <hr>
            <label>Discount Percent</label>
            <input type="text" name="discount" placeholder="Input the discount percent">
            <hr>
            <button type="submit">Calculate Discount</button>
        </form>
</fieldset>
</body>
</html>