<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>メニュー</title>
</head>
<body>
<div id="header"><div class = "outline"><font size="7" color="white" height="center">STEPPY</font></div></div>
<br>
<br>
<br>
<br>
<center>
<p><font size="5" color="red"><%=session.getAttribute("zaiko00")%></p>
<table>
<tr>
<td><form action="Order" method="post">
<input href="#" class="square_btn" type="submit" value="発注"></td>
</form>
<td><form action="Zaiko" method="post">
<input href="#" class="square_btn" type="submit" value="在庫状況" name="bname"></td>
</form>
<td><form action="PayStatus" method="post">
<input href="#" class="square_btn" type="submit" value="支払状況"></td>
</form>
<td><form action="OrderStatus" method="post">
<input href="#" class="square_btn" type="submit" value="発注状況"></td>
</form>
</tr>

<tr>
<td><form action="Uriage" method="post">
<input href="#" class="square_btn" type="submit" value="売上"></td>
</form>
<form action="UriageIn" method="post">
<td><input href="#" class="square_btn" type="submit" value="売上入力"></td>
</form>
<td><form action="Syohin" method="post">
<input href="#" class="square_btn" type="submit" value="商品一覧" name="bname"></td>
</form>
<td><form action="NewSyohin" method="post">
<input href="#" class="square_btn" type="submit" value="新規商品追加"></td>
</form>
</tr>
</table>
</center>
<br>
<br>
<div id="footer"></div>
</body>
</html>