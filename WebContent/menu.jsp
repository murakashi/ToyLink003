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
<div id="header"><div class = "outline">&nbsp;STEPPY</div></div>
<div id="wrapper">
<br>
<br>
<center>
<p><font size="5" color="red"><%=session.getAttribute("zaiko00")%></font></p>
<table>
<tr>
<td><form action="Order" method="post">
<input href="#" class="square_btn" type="submit" value="発注">
</form>
</td>
<td><form action="Zaiko" method="post">
<input href="#" class="square_btn" type="submit" value="在庫状況" name="bname">
</form>
</td>
<td><form action="PayStatus" method="post">
<input href="#" class="square_btn" type="submit" value="支払状況">
</form>
</td>
<td><form action="OrderStatus" method="post">
<input href="#" class="square_btn" type="submit" value="発注状況">
</form>
</td>
</tr>

<tr>
<td><form action="Uriage" method="post">
<input href="#" class="square_btn" type="submit" value="売上一覧">
</form>
</td>
<td><form action="UriageIn" method="post">
<input href="#" class="square_btn" type="submit" value="売上入力">
</form>
</td>
<td><form action="Syohin" method="post">
<input href="#" class="square_btn" type="submit" value="商品一覧" name="bname">
</form>
</td>
<td><form action="NewSyohin" method="post">
<input href="#" class="square_btn" type="submit" value="新規商品追加">
</form>
</td>
</tr>
</table>
</center>
<br>
</div>
<div id="footer">Copyright © 2018 STEPPY All Rights Reserved.</div>
</body>
</html>