<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>
    Simple Calculator
</h1>
<br/>
<form action="CalculatorServlet" method="get">

    <legend>Calculator</legend>
    <label>First Operand</label>
    <input type="text" name="first">
    <label>Operator</label>
    <select name="toanTu" id="toanTu">
        <option  value="cong">Cộng</option>
        <option  value="tru">Trừ</option>
        <option  value="nhan">Nhân</option>
        <option  value="chia">Chia</option>
    </select>
    <label>Second Operand</label>
    <input type="text" name="second">
    <button type="submit">Submit</button>
</form>
</body>
</html>